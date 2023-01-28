import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({required this.amount, Key? key}) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 5.0),
        child: Text('В наявності: $amountшт.', style:const TextStyle(color: Colors.grey, fontSize: 15)),
      ),
    );
  }
}
