import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/presentation/details_screen/components.dart';
import 'package:ly_odesa/presentation/details_screen/components/amount_widget.dart';
import 'package:ly_odesa/presentation/drawer_screen/drawer_screen.dart';
import 'package:ly_odesa/presentation/home_screen/components/appbar.dart';

// class DetailsScree extends StatelessWidget {
//   const DetailsScree({required this.product, Key? key}) : super(key: key);
//
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     //return DrawerScree(child: Details(product: product));
//   }
// }

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return DrawerScreen(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBarWidget()),
          backgroundColor: const Color(0xff1b1a1a),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  child: SafeArea(
                        child: Column(
                          children: [
                            PhotoAndButtons(image: product.images[0],),
                            ShortDescription(product: product,),
                            DetailPhotosSlider(images: product.images),
                            DetailDescription(description: product.description),
                            AmountWidget(amount: product.amount.toString()),
                            ProductSize(size: product.size),
                            ProductColor(color: product.color),
                            CartCounter(amount: product.amount,),
                            BuyButtons(product: product)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}