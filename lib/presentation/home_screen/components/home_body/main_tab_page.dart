import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body/bottom_main_tab.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body/products_slider.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({
    required this.plates,
    required this.drinkingGlasses,
    required this.glasses,
    required this.cutlery,
    required this.other,
    Key? key}) : super(key: key);
  final List<Product> plates, drinkingGlasses, glasses, cutlery, other;

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: SizedBox(
                height: double.minPositive,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    ProductSliderBackground(
                        title: 'Тарілки',
                        child:  ProductSliderWidget(
                          productList: widget.plates,
                        )
                    ),
                    ProductSliderBackground(
                        title: 'Прилади',
                        child:  ProductSliderWidget(
                          productList: widget.cutlery,
                        )
                    ),
                    ProductSliderBackground(
                        title: 'Келихи',
                        child: ProductSliderWidget(
                          productList: widget.glasses,
                        )
                    ),
                    ProductSliderBackground(
                        title: 'Склянки',
                        child: ProductSliderWidget(
                          productList: widget.drinkingGlasses,
                        )
                    ),
                    ProductSliderBackground(
                        title: 'Інше',
                        child: ProductSliderWidget(
                          productList: widget.other,
                        )
                    ),
                    const BottomMainTabPage(),
                  ],
                  ),
                )
            ),
          ),
        ],
    );
  }
}