import 'package:ly_odesa/data/models/cart.dart';
import 'package:ly_odesa/data/models/product.dart';

class OrderSenderRepository {
  void sendOrder({required Cart cart, required String fullName, required String phoneNumber,
    required String email, required String city, required String numberOfNovaPoshta})async{}

  void sendSpeedOrder({required String fullName, required String phoneNumber, required Product product})async{}
}