import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/models/my_user.dart';
import 'package:ly_odesa/data/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/auth_screen/components/login_widget.dart';
import 'package:ly_odesa/presentation/auth_screen/components/register_widget.dart';
import 'package:ly_odesa/presentation/custom_widgets/web_phone_optimizer.dart';
import 'package:ly_odesa/presentation/user_screen/user_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(create: (context) => FirebaseAuthService(),
        child: BlocProvider(
          create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<FirebaseAuthService>(context),
          )..add(CheckOnDataEvent()),
          child: WebPhoneOptimizer(
            child: Scaffold(
                backgroundColor: const Color(0xff1b1a1a),
                body: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
                  child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state){
                                         if (state is LoginLoadedState) {
                                          return UserScreen(
                                              user: MyUser(
                                                  fullName: state.user.fullName,
                                                  city: state.user.city,
                                                  email: state.user.email,
                                                  password: state.user.password,
                                                  numberOfNovaPoshta: state.user.numberOfNovaPoshta,
                                                  bonusCard: state.user.bonusCard,
                                                  phoneNumber: state.user.phoneNumber
                                              )
                                          );
                                        } else if (state is LoginState){
                                          return const LoginWidget();
                                         } else if (state is RegisterState){
                                          return const RegisterWidget();
                                        } else if (state is LoginStateError) {
                                          return Scaffold(
                                            backgroundColor: const Color(0xff1b1a1a),
                                            appBar: AppBar(
                                              leading: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(Icons.arrow_back_ios)
                                              ),
                                            ),
                                            body: Center(
                                              child: Text('Упс.. Сталася помилкa\n${state.error}'),
                                            ),
                                          );
                                        } else if (state is AuthLoadingState){
                                            return const Center(
                                                child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                  )
                                            );
                                         } else {
                                          return Scaffold(
                                            backgroundColor: const Color(0xff1b1a1a),
                                            appBar: AppBar(
                                              leading: IconButton(
                                                  onPressed: () {Navigator.pop(context);},
                                                  icon: const Icon(Icons.arrow_back_ios)
                                              ),
                                            ),
                                            body: const Center(
                                              child: CircularProgressIndicator()
                                            ),
                                          );}
                              },
                            )
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}


