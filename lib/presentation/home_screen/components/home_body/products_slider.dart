import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/presentation/details_screen/details_screen.dart';

class ProductSliderWidget extends StatelessWidget {
  const ProductSliderWidget({
    required this.productList,
    Key? key}) : super(key: key);
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: productList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.transparent,
                        textStyle: const TextStyle(color: Colors.white, fontFamily: 'e-Ukraine'),
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.3),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: productList[index],)));
                          },
                          child: SizedBox(
                            height: 150, width: 150,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child:
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: SizedBox(
                                      width: 140,
                                      height: 140,
                                      child: Image.network(productList[index].images[0], fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(productList[index].name, overflow: TextOverflow.fade, softWrap: false,)
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text('${productList[index].price} гривень')
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              );
      }
}

class ProductSliderBackground extends StatelessWidget {
  final Widget child;
  final String title;
  const ProductSliderBackground({
    required this.child,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: Text(title, style: const TextStyle(fontSize: 30),))
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, top: 15),
          decoration: const BoxDecoration(
            color: Color(0xffACACAA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 1,
            left: 1,
            bottom: 1,
          ),
          child: Container(
              width: double.infinity - 1,
              height: 200 - 1,
              decoration: const BoxDecoration(
                color: Color(0xff1b1a1a),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30 - 1),
                  bottomLeft: Radius.circular(30 - 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                ),
                child: child,
              )
          ),
        ),
      ],
    );
  }
}