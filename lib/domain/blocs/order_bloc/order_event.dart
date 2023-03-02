part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class CheckOnUserEvent extends OrderEvent {
  @override
  List<Object> get props => [];

}

class SendOrderEvent extends OrderEvent {
  final String fullName, phoneNumber, city, email, numberOfNovaPoshta;
  final Cart cart;
  const SendOrderEvent({required this.numberOfNovaPoshta, required this.fullName, required this.phoneNumber,
    required this.city, required this.email, required this.cart
  });
  @override
  List<Object> get props => [numberOfNovaPoshta, fullName, phoneNumber, city, email, cart];
}