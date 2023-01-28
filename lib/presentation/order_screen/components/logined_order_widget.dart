import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';

import '../../../domain/blocs/blocs.dart';
import '../../../domain/providers/providers.dart';

class LoginedOrderWidget extends StatefulWidget {
  final String fullName, email, city, phoneNumber, numberOfNovaPoshta;
  const LoginedOrderWidget({
    required this.fullName, required this.email,
    required this.city, required this.phoneNumber,
    required this.numberOfNovaPoshta,
    Key? key}) : super(key: key);

  @override
  State<LoginedOrderWidget> createState() => _LoginedOrderWidgetState();
}

class _LoginedOrderWidgetState extends State<LoginedOrderWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();

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
    return Column(
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
            controller: fullNameController,
            icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 20), hintText: "Ім'я Прізвище"),
        TextFieldCustom(
            controller: emailController,
            icon: const Icon(Icons.mail, color: Colors.white, size: 20,), hintText: 'Пошта'),
        TextFieldCustom(
            controller: phoneNumberController,
            icon: const Icon(Icons.phone_iphone, color: Colors.white, size: 20,), hintText: 'Телефон'),
        TextFieldCustom(
            controller: cityController,
            hintText: 'Місто'),
        TextFieldCustom(
            controller: numberOfNovaPoshtaController,
            hintText: 'Відділення'
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<OrderBloc>(context).add(
                  SendOrderEvent(
                      fullName: fullNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      city: cityController.text,
                      numberOfNovaPoshta: int.parse(numberOfNovaPoshtaController.text),
                      cart: context.read<CartProvider>().cart
                  )
              );
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (route) => false);
              context.read<CartProvider>().clearCart();
            }, child: const Text('Надіслати замовлення')
        )
      ],);
  }
}
