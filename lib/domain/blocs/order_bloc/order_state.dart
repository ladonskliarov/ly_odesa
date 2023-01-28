part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class UnloginedState extends OrderState {
  @override
  List<Object> get props => [];
}

class LoginedState extends OrderState {
  final MyUser user;
  const LoginedState({required this.user});
  @override
  List<Object> get props => [];
}
