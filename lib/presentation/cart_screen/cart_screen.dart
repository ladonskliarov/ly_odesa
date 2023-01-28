import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ly_odesa/domain/providers/cart_provider/cart_provider.dart';
import 'package:ly_odesa/presentation/cart_screen/components/cart_bottom.dart';
import 'package:ly_odesa/presentation/cart_screen/components/cart_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
          return Material(
            textStyle: const TextStyle(
            fontSize: 30, color: Colors.white, fontFamily: 'e-Ukraine'),
            color: const Color(0xff1b1a1a),
            child: SafeArea(
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xff1b1a1a)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 30),
                        child: Image.asset(
                          'assets/images/brand/craft_bag.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Stack(children: [
                    Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 25,
                            child: SizedBox(
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 500,
                                    width: 500,
                                    child: CarouselSlider.builder(
                                      itemCount: context.watch<CartProvider>().cart.products.length,
                                      options: CarouselOptions(
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.vertical,
                                          viewportFraction: 0.3,
                                          enableInfiniteScroll: false),
                                      itemBuilder: (BuildContext context, _,
                                          int index) {
                                        return CartCard(product: context.watch<CartProvider>().cart.products[index]);
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            )),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 15.0),
                          child: Container(
                              color: Colors.white,
                              height: 1,
                              width: MediaQuery.of(context).size.width),
                        ),
                        const Expanded(
                          flex: 5,
                          child: CartBottom()
                        ),
                      ],
                    )
                  ]),
                ],
              ),
            ),
        );
  }
}