import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:provider/provider.dart';

import '../../../domain/providers/providers.dart';

class CartCard extends StatelessWidget {
  const CartCard({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(product.images[0], fit: BoxFit.cover,)),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(color: Color(0xff1b1a1a), fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      '${product.price}₴ * ${product.amount} = ${product.price * product.amount}₴ ',
                      style: const TextStyle(
                        color: Color(0xff1b1a1a),
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.read<CartProvider>().removeProductFromCart(deletedProduct: product);
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}