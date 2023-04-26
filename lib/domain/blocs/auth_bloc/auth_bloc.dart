import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ly_odesa/domain/providers/user_data_provider/user_data_provider.dart';
import 'package:ly_odesa/domain/validator/validator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthLoadingState()) {
    on<ChooseLoginEvent>((event, emit) => emit(const LoginState()));

    on<ChooseRegisterEvent>((event, emit) => emit(const RegisterState()));

    on<CheckOnDataEvent>((event, emit) async {
      emit(AuthLoadingState());
      final userInAuth = FirebaseAuth.instance.currentUser?.uid;
      try {
        if (userInAuth == null) {
          emit(const LoginState());
        } else {
          final docUserInFirestore = await FirebaseFirestore.instance
              .collection('users')
              .doc(userInAuth)
              .get();
              
          final userJsonData = docUserInFirestore.data();

          final userData = MyUser.fromJson(userJsonData!);
          await Future.delayed(const Duration(milliseconds: 200), () {})
              .whenComplete(() {
            emit(LoginLoadedState(user: userData));
          });
        }
      } catch (e) {
        emit(LoginStateError(e as Error));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        final userInAuth = FirebaseAuth.instance.currentUser?.uid;
        if (userInAuth != null) {
          final docUserInFirestore = await FirebaseFirestore.instance
              .collection('users')
              .doc(userInAuth)
              .get();
          final userData = MyUser.fromJson(docUserInFirestore.data()!);
          await Future.delayed(const Duration(milliseconds: 200), () {})
              .whenComplete(() {
            emit(LoginLoadedState(user: userData));
          });
        } else {
          emit(const LoginState());
        }
      } catch (e) {
        emit(LoginStateError(e as Error));
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        emit(AuthLoadingState());
        await authRepository.createUser(
          email: event.email,
          password: event.password,
          fullName: event.fullName,
          phoneNumber: event.phoneNumber,
          city: event.city,
          numberOfNovaPoshta: event.numberOfNovaPoshta,
        );
        authRepository.signIn(email: event.email, password: event.password);
        final currentUserId = FirebaseAuth.instance.currentUser?.uid;
        final collectionUser = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .get();
        final userData = MyUser.fromJson(collectionUser.data()!);
        emit(LoginLoadedState(user: userData));
      } catch (e) {
        emit(LoginStateError(e as Error));
      }
    });

    on<SignoutEvent>((event, emit) {
      authRepository.signOut();
      event.context.read<UserDataProvider>().signOutUser();
      emit(const LoginState());
    });
  }
}
