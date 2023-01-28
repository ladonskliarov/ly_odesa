import 'package:flutter/material.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/presentation/details_screen/details_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.product,
    Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white.withOpacity(0.3),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(product: product)));
        },
        child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(product.images[0], fit: BoxFit.fill,),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500), overflow: TextOverflow.fade, softWrap: false,),
                    ),
                    Text('${product.price} гривень'),
                  ],
                ),
              ),
            ]),
    );
  }
}