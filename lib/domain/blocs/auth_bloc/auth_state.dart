part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignOutState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoadedState extends AuthState {
  final MyUser user;

  const LoginLoadedState({required this.user});

  @override
  List<Object?> get props => [];
}

class LoginStateError extends AuthState {
  final Error error;
  const LoginStateError(this.error);
  @override
  List<Object?> get props => [];
}

// class SignoutState extends AuthState {
//   @override
//   List<Object> get props => [];
// }