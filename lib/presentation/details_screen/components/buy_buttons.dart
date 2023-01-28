import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/data/repositories/orders_repository/orders_repository.dart';
import 'package:ly_odesa/data/services/firestore_orders_service/firestore_orders_service.dart';
import 'package:ly_odesa/domain/providers/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';

class BuyButtons extends StatelessWidget {
  const BuyButtons({required this.product, Key? key}) : super(key: key);
  final Product product;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color(0xff216CDD)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                    color: Colors.transparent,
                    textStyle: const TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
                      child: InkWell(
                      splashColor: Colors.white.withOpacity(0.3),
                      onTap: () {
                      context.read<CartProvider>().addProductToCart(product);
                    },
                      child: const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                          child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 40,
                          ),
                        ),
                      )
                    )
                  ),
              )
          ),
          const SizedBox(width: 15),
          Expanded(
              flex: 3,
              child: SpeedOrderButton(product: product)
          )
        ],
      ),
    );
  }
}

class SpeedOrderButton extends StatefulWidget {
  final Product product;
  const SpeedOrderButton({Key? key, required this.product}) : super(key: key);

  @override
  State<SpeedOrderButton> createState() => _SpeedOrderButtonState();
}

class _SpeedOrderButtonState extends State<SpeedOrderButton> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final OrderSenderRepository sender = OrderSenderService();


  Future<String?> openDialog() => showDialog<String>(
    context: context, builder:
      (context) => AlertDialog(title: const Text('Ваш номер телефону', style: TextStyle(fontWeight: FontWeight.w500),),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              TextFormField(
                  controller: _fullNameController,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Остап ')
              ),
              TextFormField(
                  controller: _phoneNumberController,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: '380')
              ),
            ],
          ),
        ),
          actions: [
          TextButton(
            child: const Text('Надіслати'),
            onPressed: () {
              sender.sendSpeedOrder(
                  fullName: _fullNameController.text,
                  phoneNumber: _phoneNumberController.text,
                  product: widget.product
              );
              _phoneNumberController.clear();
              _fullNameController.clear();
              Navigator.pop(context);
            },
        )
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: const Color(0xff216CDD),
            borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Material(
              color: Colors.transparent,
              textStyle: const TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
              child: InkWell(
                onTap: () async {
                  await openDialog();
                  if (_fullNameController.text == null || _fullNameController.text.isEmpty
                    && _phoneNumberController.text == null || _phoneNumberController.text.isEmpty
                  ) return;
                },
                child: const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Швидко придбати',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            )
        )
    );
  }
}

