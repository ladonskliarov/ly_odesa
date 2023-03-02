// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic> json) => MyUser(
      fullName: json['fullName'] as String,
      city: json['city'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      numberOfNovaPoshta: json['numberOfNovaPoshta'] as String,
      bonusCard: BonusCard.fromJson(json['bonusCard'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'city': instance.city,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'numberOfNovaPoshta': instance.numberOfNovaPoshta,
      'bonusCard': instance.bonusCard.toJson(),
    };
