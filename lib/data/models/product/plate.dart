import 'package:ly_odesa/data/models/product.dart';

class Plate extends Product {
  final String capacity;

  Plate({
    required super.id, required super.price, required super.amount,
    required super.name, required super.material, required super.description,
    required super.size, required super.color, required super.images,
    required this.capacity
  });

  factory Plate.fromJson(Map<String, dynamic> json) => Plate(
    id: json['id'] as int,
    price: json['price'] as int,
    amount: json['amount'] as int,
    name: json['name'] as String,
    material: json['material'] as String,
    description: json['description'] as String,
    size: json['size'] as String,
    color: json['color'] as String,
    images:
    (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    capacity: json['capacity'] as String,
  );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'price': price,
    'name': name,
    'material': material,
    'description': description,
    'size': size,
    'color': color,
    'images': images,
    'amount': amount,
    'capacity': capacity
  };
}