import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({required this.validator, Key? key}) : super(key: key);
  final Validator validator;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
                        },
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/images/brand/ly_dark.png', fit: BoxFit.fill,)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(const ChooseLoginEvent());
                        },
                        child: const Text('Вхід', style: TextStyle(fontSize: 25, color: Colors.grey),)
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Приєднуйся, зроби це!', style: TextStyle(fontSize: 20),),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validateFullNameField(value);
                                },
                                controller: fullNameController,
                                icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20),
                                hintText: "Ім'я Прізвище"
                            ),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validateEmailFiled(value);
                                },
                                controller: emailController,
                                icon: const Icon(Icons.mail, color: Colors.white, size: 20,),
                                hintText: 'Пошта'
                            ),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validateNumberField(value);
                                },
                                controller: phoneNumberController,
                                icon: const Icon(Icons.phone_iphone, color: Colors.white, size: 20,),
                                hintText: 'Телефон'
                            ),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validatePasswordField(value);
                                },
                              obscureText: true,
                                controller: passwordController,
                                icon: const Icon(Icons.lock_outline_rounded, color: Colors.white, size: 20,),
                                hintText: 'Пароль'
                            ),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validateCityField(value);
                                },
                                controller: cityController,
                                hintText: 'Місто'
                            ),
                            TextFieldCustom(
                                validator: (value) {
                                  return widget.validator.validatePostField(value);
                                },
                                controller: numberOfNovaPoshtaController,
                                hintText: 'Відділення'
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: DecoratedBox(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthBloc>(context).add(
                                            RegisterEvent(
                                              fullName: fullNameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              phoneNumber: phoneNumberController.text,
                                              city: cityController.text,
                                              numberOfNovaPoshta: int.parse(numberOfNovaPoshtaController.text),
                                            )
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
                                          child: Text('Стати своїм', style: TextStyle(color: Color(0xff1b1a1a), fontSize: 20),)),
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
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
