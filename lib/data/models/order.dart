import 'package:ly_odesa/data/models/cart.dart';

class MyOrder {
  final int id;
  final Cart cart;
  final String fullName,
      phoneNumber,
      city,
      email,
      day,
      time,
      numberOfNovaPoshta;

  MyOrder(
      {required this.id,
      required this.cart,
      required this.fullName,
      required this.phoneNumber,
      required this.city,
      required this.email,
      required this.numberOfNovaPoshta,
      required this.day,
      required this.time});

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        id: json['id'] as int,
        cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
        fullName: json['fullName'] as String,
        phoneNumber: json['phoneNumber'] as String,
        city: json['city'] as String,
        email: json['email'] as String,
        numberOfNovaPoshta: json['numberOfNovaPoshta'] as String,
        day: json['day'] as String,
        time: json['time'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'numberOfNovaPoshta': numberOfNovaPoshta,
        'cart': cart.toJson(),
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'city': city,
        'email': email,
        'day': day,
        'time': time,
      };
}
