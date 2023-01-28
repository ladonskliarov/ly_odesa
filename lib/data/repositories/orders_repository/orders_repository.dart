import 'package:ly_odesa/data/models/cart.dart';
import 'package:ly_odesa/data/models/product.dart';

class OrderSenderRepository {
  sendOrder({required Cart cart, required String fullName, required String phoneNumber,
    required String email, required String city, required int numberOfNovaPoshta})async{}

  sendSpeedOrder({required String fullName, required String phoneNumber, required Product product})async{}
}