import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ly_odesa/domain/providers/cart_provider/cart_provider.dart';
import 'package:ly_odesa/presentation/custom_widgets/text_field_widget.dart';
import 'package:ly_odesa/presentation/home_screen/home_screen.dart';

import '../../../domain/blocs/blocs.dart';

class SignoutOrderWidget extends StatefulWidget {
  const SignoutOrderWidget({Key? key}) : super(key: key);

  @override
  State<SignoutOrderWidget> createState() => _SignoutOrderWidgetState();
}

class _SignoutOrderWidgetState extends State<SignoutOrderWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController numberOfNovaPoshtaController = TextEditingController();

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