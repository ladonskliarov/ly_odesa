import 'package:json_annotation/json_annotation.dart';
import 'package:ly_odesa/data/models/product.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart {
  List<Product> products;
  int cartPrice;

  Cart({required this.products, required this.cartPrice});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}