import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/data/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Validator _validator = ValidatorRealization();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
                    },
                  child: SizedBox(width: 120, height: 120,
                      child: Image.asset('assets/images/brand/ly_dark.png', fit: BoxFit.fill,)
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(const ChooseRegisterEvent());
                        },
                        child: const Text('Реєстрація', style: TextStyle(
                            fontSize: 25, color: Colors.grey),))
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
              horizontal: 40.0, vertical: 10),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Привіт!', style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),),
                      const Text('Залогінься щоб продовжити',
                        style: TextStyle(fontSize: 20, color: Colors.white),),
                      TextFieldCustom(
                        validator: (value) {
                          return _validator.validateEmailFiled(value);
                        },
                        controller: _emailController,
                          icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20),
                          hintText: 'Пошта'
                      ),
                      TextFieldCustom(
                          validator: (value) {
                            return _validator.validatePasswordField(value);
                          },
                        obscureText: true,
                        controller: _passwordController,
                          icon: const Icon(Icons.lock_outline_rounded, color: Colors.white, size: 20,),
                          hintText: 'Пароль'
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthBloc>(context).add(
                                            LoginEvent(email: _emailController.text, password: _passwordController.text)
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Text('О оу, перегляньте заповнення', style: TextStyle(color: Color(0xff1b1a1a)),)),
                                    );
                                  }
                                },
                                child: const SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                    child: Align(
                                      alignment: Alignment.center,
                                        child: Text('Увійти', style: TextStyle(
                                            color: Color(0xff1b1a1a),
                                            fontSize: 20),
                                        )
                                    ),
                            ),)
                        ),
                      ),
                      const Text('Завдяки цьому кожне замовлення заповнюється автоматично*',
                        style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}