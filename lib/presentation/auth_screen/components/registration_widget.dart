import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:ly_odesa/domain/providers/user_data_provider/user_data_provider.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {Navigator.pop(context);},
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
                          context.read<UserDataProvider>().changeLoginState();
                        },
                        child: const Text('Вхід', style: TextStyle(fontSize: 25, color: Colors.grey),)),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Приєднуйся, зроби це!', style: TextStyle(fontSize: 20),),
                        TextFieldCustom(
                            controller: fullNameController,
                            icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20), hintText: "Ім'я Прізвище"),
                        TextFieldCustom(
                            controller: emailController,
                            icon: const Icon(Icons.mail, color: Colors.white, size: 20,), hintText: 'Пошта'),
                        TextFieldCustom(
                            controller: phoneNumberController,
                            icon: const Icon(Icons.phone_iphone, color: Colors.white, size: 20,),
                            hintText: 'Телефон'),
                        TextFieldCustom(
                            controller: passwordController,
                            icon: const Icon(Icons.lock_outline_rounded, color: Colors.white, size: 20,), hintText: 'Пароль'),
                        TextFieldCustom(
                            controller: cityController,
                            hintText: 'Місто'),
                        TextFieldCustom(
                            controller: numberOfNovaPoshtaController,
                            hintText: 'Відділення'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                              child: GestureDetector(
                                onTap: () {
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
          ],

    );
  }
}
