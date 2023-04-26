import 'package:ly_odesa/data/models/json_converter.dart';
import 'package:ly_odesa/data/models/product.dart';

class Cart {
  List<Product> products;
  int cartPrice;

  Cart({required this.products, required this.cartPrice});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        products: (json['products'] as List<dynamic>)
            .map((e) => JSONConverter().fromJson(e as Map<String, dynamic>))
            .toList(),
        cartPrice: json['cartPrice'] as int,
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
        'products': products.map((e) => e.toJson()).toList(),
        'cartPrice': cartPrice,
      };
  }
}
