// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
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

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'material': instance.material,
      'description': instance.description,
      'size': instance.size,
      'color': instance.color,
      'images': instance.images,
      'amount': instance.amount,
    };
