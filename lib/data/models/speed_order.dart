import 'package:ly_odesa/data/models/json_converter.dart';
import 'package:ly_odesa/data/models/product.dart';

class SpeedOrder {
  final int id;
  final Product product;
  final String fullName, phoneNumber, day, time;

  SpeedOrder({required this.id, required this.product, required this.fullName, required this.phoneNumber,
    required this.day, required this.time
  });

  factory SpeedOrder.fromJson(Map<String, dynamic> json){
    return SpeedOrder(
        id: json['id'] as int,
        product: JSONConverter().fromJson(json['product'] as Map<String, dynamic>),
        fullName: json['name'] as String,
        phoneNumber: json['number'] as String,
        day: json['day'] as String,
        time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'product': JSONConverter().toJson(product),
    'name': fullName,
    'number': phoneNumber,
    'day': day,
    'time': time
  };
}