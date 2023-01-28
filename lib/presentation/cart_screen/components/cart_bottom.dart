import 'package:flutter/material.dart';
import 'package:ly_odesa/presentation/order_screen/order_screen.dart';
import 'package:provider/provider.dart';

import '../../../domain/providers/providers.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text('${context.watch<CartProvider>().cart.cartPrice}₴',
                        style: const TextStyle(fontSize: 40, color: Colors.green, fontFamily: 'e-Ukraine'),
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(width: 20),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      if(context.read<CartProvider>().cart.cartPrice > 0){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderScreen()));}
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text('Замовити',
                        style: TextStyle(color: Color(0xff1b1a1a), fontSize: 35, fontFamily: 'e-Ukraine'),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}