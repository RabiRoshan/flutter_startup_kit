part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class UninitializedState extends AuthState {
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}

class AuthenticatingState extends AuthState {
  const AuthenticatingState();

  @override
  List<Object> get props => null;
}

class AuthenticatedState extends AuthState {
  final String token;

  const AuthenticatedState(this.token);

  @override
  List<Object> get props => [token];
}

class AuthFailedState extends AuthState {
  final ErrorResponse error;

  const AuthFailedState(this.error);

  @override
  List<Object> get props => [null];
}
