import 'package:flutter/material.dart';
import 'package:ly_odesa/domain/providers/providers.dart';
import 'package:provider/provider.dart';

class PhotoAndButtons extends StatelessWidget {
  const PhotoAndButtons({required this.image, Key? key}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.grey),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 500,
            maxWidth: 500,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.network(image, height: double.infinity, width: double.infinity, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(color: Color(0xff1b1a1a)),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  context.read<CartProvider>().clearAmountBuy();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios, color: Color(0xff504D4D), size: 25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}