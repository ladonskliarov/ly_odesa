import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/domain/validator/validator.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';

import '../../../domain/blocs/blocs.dart';
import '../../../domain/providers/providers.dart';

class LoginedOrderWidget extends StatefulWidget {
  const LoginedOrderWidget({
    required this.fullName, required this.email,
    required this.city, required this.phoneNumber,
    required this.numberOfNovaPoshta, required Validator validator,
    Key? key}) : _validator = validator, super(key: key);
  final String fullName, email, city, phoneNumber, numberOfNovaPoshta;
  final Validator _validator;


  @override
  State<LoginedOrderWidget> createState() => _LoginedOrderWidgetState();
}

class _LoginedOrderWidgetState extends State<LoginedOrderWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fullNameController = TextEditingController(text: widget.fullName);
    emailController = TextEditingController(text: widget.email);
    cityController = TextEditingController(text: widget.city);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);
    numberOfNovaPoshtaController = TextEditingController(text: widget.numberOfNovaPoshta.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: SizedBox(
              height: 50,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('Привіт, давай замовимось!', maxLines: 5, style: TextStyle(color: Colors.white, fontSize: 20),)),
            ),
          ),
          TextFieldCustom(
            validator: (value) {
              return widget._validator.validateFullNameField(value);
            },
              controller: fullNameController,
              icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20), hintText: "Ім'я Прізвище"),
          TextFieldCustom(
            validator: (value) {
              return widget._validator.validateEmailFiled(value);
            },
              controller: emailController,
              icon: const Icon(Icons.mail, color: Colors.white, size: 20,), hintText: 'Пошта'),
          TextFieldCustom(
            validator: (value) {
              return widget._validator.validatePhoneNumberField(value);
            },
              controller: phoneNumberController,
              icon: const Icon(Icons.phone_iphone, color: Colors.white, size: 20,), hintText: 'Телефон'),
          TextFieldCustom(
            validator: (value) {
              return widget._validator.validateCityField(value);
            },
              controller: cityController,
              hintText: 'Місто'),
          TextFieldCustom(
              validator: (value) {
                return widget._validator.validatePostField(value);
              },
              controller: numberOfNovaPoshtaController,
              hintText: 'Відділення'
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<OrderBloc>(context).add(
                      SendOrderEvent(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          phoneNumber: phoneNumberController.text,
                          city: cityController.text,
                          numberOfNovaPoshta: numberOfNovaPoshtaController.text,
                          cart: context.read<CartProvider>().cart
                      )
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
                          (route) => false);
                  context.read<CartProvider>().clearCart();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text('О оу, перегляньте заповнення', style: TextStyle(color: Color(0xff1b1a1a)),)),
                  );
                }
              }, child: const Text('Надіслати замовлення')
          )
        ],),
    );
  }
}
