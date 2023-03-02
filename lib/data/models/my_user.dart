import 'package:ly_odesa/data/models/bonus_card.dart';

class MyUser {
  final String fullName, city, email, phoneNumber, password, numberOfNovaPoshta;
  final BonusCard bonusCard;

  MyUser({required this.fullName, required this.city,
    required this.email, required this.password,
    required this.numberOfNovaPoshta, required this.bonusCard,
    required this.phoneNumber
  });

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
    fullName: json['fullName'] as String,
    city: json['city'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    numberOfNovaPoshta: json['numberOfNovaPoshta'] as String,
    bonusCard: BonusCard.fromJson(json['bonusCard'] as Map<String, dynamic>),
    phoneNumber: json['phoneNumber'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'fullName': fullName,
    'city': city,
    'email': email,
    'phoneNumber': phoneNumber,
    'password': password,
    'numberOfNovaPoshta': numberOfNovaPoshta,
    'bonusCard': bonusCard.toJson(),
  };
}