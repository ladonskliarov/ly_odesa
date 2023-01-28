import 'package:json_annotation/json_annotation.dart';
import 'package:ly_odesa/data/models/bonus_card.dart';

part  'my_user.g.dart';

@JsonSerializable()
class MyUser {
  final String fullName, city, email, phoneNumber, password;
  final int numberOfNovaPoshta;
  final BonusCard bonusCard;

  MyUser({required this.fullName, required this.city,
    required this.email, required this.password,
    required this.numberOfNovaPoshta, required this.bonusCard,
    required this.phoneNumber
  });

  static MyUser fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
  Map<String, dynamic> toJson() => _$MyUserToJson(this);
}