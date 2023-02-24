part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoadedState extends AuthState {
  final MyUser user;

  const LoginLoadedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginStateError extends AuthState {
  final Error error;
  const LoginStateError(this.error);
  @override
  List<Object?> get props => [error];
}