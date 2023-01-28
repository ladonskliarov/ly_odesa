import 'package:flutter/material.dart';
import 'package:ly_odesa/domain/providers/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatelessWidget {
  final int amount;
  const CartCounter({required this.amount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.read<CartProvider>().minusAmountBuy();
            },
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50), border: Border.all(color: const Color(0xffACACAA), width: 1.0)),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(Icons.remove, size: 25, color: Colors.white,),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 40,
            width: 45,
            child: Text(context.watch<CartProvider>().amountBuy.toString(), style: const TextStyle(color: Color(0xffACACAA), fontSize: 30), textAlign: TextAlign.center,),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              context.read<CartProvider>().plusAmountBuy(amount: amount);
            },
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50), border: Border.all(color: const Color(0xffACACAA), width: 1.0)),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(Icons.add, size: 25, color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}