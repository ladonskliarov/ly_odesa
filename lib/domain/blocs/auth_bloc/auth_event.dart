part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckOnDataEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class ChooseLoginEvent extends AuthEvent {
  const ChooseLoginEvent();

  @override
  List<Object> get props => [];
}

class ChooseRegisterEvent extends AuthEvent {
  const ChooseRegisterEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});
  final String email, password;

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.email, required this.password,
    required this.fullName, required this.phoneNumber,
    required this.city, required this.numberOfNovaPoshta,
  });
  final String email, fullName, city, phoneNumber, password;
  final int numberOfNovaPoshta;

  @override
  List<Object> get props => [email, fullName, phoneNumber, city, numberOfNovaPoshta, password];
}

class SignoutEvent extends AuthEvent {
  final BuildContext context;
  const SignoutEvent({required this.context});
  @override
  List<Object> get props => [context];
}
