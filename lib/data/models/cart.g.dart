// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      products: (json['products'] as List<dynamic>)
          .map((e) => JSONConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      cartPrice: json['cartPrice'] as int,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'cartPrice': instance.cartPrice,
    };
