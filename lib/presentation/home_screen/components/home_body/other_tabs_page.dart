import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/presentation/home_screen/components/home_body/item_card.dart';

class OtherTabsPage extends StatelessWidget {
  const OtherTabsPage({
    required this.productList,
    Key? key}) : super(key: key);
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
        return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 700) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: GridView.builder(
                              itemCount: productList.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.80,
                              ),
                              itemBuilder: (context, index) =>
                              ItemCard(product: productList[index],)),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: GridView.builder(
                              itemCount: productList.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.80,
                              ),
                              itemBuilder: (context, index) =>
                              ItemCard(product: productList[index],),
                            )
                        ),
                      ],
                    );
                  }
                }
            );
          }
}
