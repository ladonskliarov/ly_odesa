import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ly_odesa/data/models/cart.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/repositories/orders_repository/orders_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderSenderRepository _orderSenderRepository;

  OrderBloc(this._orderSenderRepository) : super(UnloginedState()) {
    on<CheckOnUserEvent>((event, emit) async {
      final userInAuth = FirebaseAuth.instance.currentUser;
      if(userInAuth == null){
        emit(UnloginedState());
      } else {
        final docUserInFirestore = await FirebaseFirestore.instance
            .collection('users').doc(userInAuth.uid).get();
        final userJsonData = docUserInFirestore.data();
        final userData = MyUser.fromJson(userJsonData!);
        emit(LoginedState(user: userData));
      }
    });

    on<SendOrderEvent>((event, emit){
      _orderSenderRepository.sendOrder(
        cart: event.cart,
        fullName: event.fullName,
        phoneNumber: event.phoneNumber,
        email: event.email,
        city: event.city,
        numberOfNovaPoshta: event.numberOfNovaPoshta
      );
    });
  }
}
