import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';

class ShortDescription extends StatelessWidget {
  const ShortDescription({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(product.name, style: const TextStyle(color: Colors.white, fontSize: 20),),
                ),
                Text(product.material, style: const TextStyle(color: Colors.grey, fontSize: 15))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset('assets/images/brand/ly_dark.png', width: 40, height: 40,),
              ),
            ),
          )
        ],
      ),
    );
  }
}