
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ly_odesa/data/models/cart.dart';
import 'package:ly_odesa/data/models/order.dart';
import 'package:ly_odesa/data/models/product.dart';
import 'package:ly_odesa/data/models/speed_order.dart';
import 'package:ly_odesa/data/repositories/orders_repository/orders_repository.dart';

class OrderSenderService implements OrderSenderRepository {
  @override
  sendOrder(
      {required Cart cart, required String fullName,
      required String phoneNumber, required String email,
      required String city, required int numberOfNovaPoshta}) async {
    try {
      final ordersCollection = FirebaseFirestore.instance.collection('orders');
      final sortedCollection = await ordersCollection.orderBy('id', descending: true).get();

      int newOrderId = 1;
      if (sortedCollection.docs.isEmpty) {
      } else {
        final sortedCollection = await ordersCollection.orderBy('id', descending: true).get();
        final lastOrderJson = sortedCollection.docs.first.data();
        newOrderId = MyOrder.fromJson(lastOrderJson).id + 1;
      }

      MyOrder order = MyOrder(
          id: newOrderId,
          cart: cart,
          fullName: fullName,
          city: city,
          email: email,
          numberOfNovaPoshta: numberOfNovaPoshta,
          phoneNumber: phoneNumber,
          day:
              '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
          time: '${DateTime.now().hour}:${DateTime.now().minute}');

      Map<String, dynamic> orderJson = order.toJson();
      ordersCollection.doc('$newOrderId').set(orderJson);
    } catch (e) {}
  }

  @override
  sendSpeedOrder({required String phoneNumber, required String fullName, required Product product}) async {
    final ordersCollection = FirebaseFirestore.instance.collection('speedOrders');
    final sortedCollection = await ordersCollection.orderBy('id', descending: true).get();

    int newOrderId = 1;
    if (sortedCollection.docs.isEmpty) {} else {
      final lastOrderJson = sortedCollection.docs.first.data();
      newOrderId = MyOrder.fromJson(lastOrderJson).id + 1;
    }

    SpeedOrder speedOrder = SpeedOrder(
        id: newOrderId,
        product: product,
        fullName: fullName,
        phoneNumber: phoneNumber,
        day: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
        time: '${DateTime.now().hour}:${DateTime.now().minute}');

    Map<String, dynamic> speedOrderJson = speedOrder.toJson();
    ordersCollection.doc('$newOrderId').set(speedOrderJson);
  }
}
