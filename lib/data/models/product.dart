import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id, price;
  final String name, material, description, size, color;
  final List<String> images;
  int amount;

  Product({required this.id, required this.price, required this.amount,
    required this.name, required this.material, required this.description,
    required this.size, required this.color, required this.images
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

class Plate extends Product {
  Plate({
    required int id, required int price, required int amount,
    required String name, required String material,
    required String description, required String size, required String color,
    required List<String> images
  }) : super(id: id, price: price, amount: amount,
        name: name, material: material,
        description: description, size: size, color: color,
        images: images);
}

class WhiskeyGlasses extends Product {
  WhiskeyGlasses(
      {
        required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}

class DrinkingGlasses extends Product {
  DrinkingGlasses(
      {
        required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}

class ChampagneGlasses extends Product {
  ChampagneGlasses(
      {required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}

class WineGlasses extends Product {
  WineGlasses(
      {required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}

class Cutlery extends Product {
  Cutlery(
      {required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}

class Other extends Product {
  Other(
      {required int id, required int price, required int amount,
        required String name, required String material,
        required String description, required String size, required String color,
        required List<String> images
      })
      : super(id: id, price: price, amount: amount,
      name: name, material: material,
      description: description, size: size, color: color,
      images: images);
}