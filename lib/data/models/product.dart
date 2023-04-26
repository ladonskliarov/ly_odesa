import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class Product {
  final int id, price;
  final String name, material, description, size, color, type;
  final List<String> images;
  int amount;

  Product(
      {required this.id,
      required this.price,
      required this.amount,
      required this.name,
      required this.material,
      required this.description,
      required this.size,
      required this.color,
      required this.images,
      required this.type});

  toJson(){}
}
