import 'package:ly_odesa/data/models/product.dart';

class Other extends Product {
  Other({
    required super.id, required super.price, required super.amount,
    required super.name, required super.material, required super.description,
    required super.size, required super.color, required super.images
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
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
  };
}