part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RestoreSession extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class DidAuthenticate extends AuthEvent {
  final User user;

  DidAuthenticate(this.user);

  @override
  List<Object?> get props => [this.user];
}

class LogOut extends AuthEvent {
  LogOut();

  @override
  List<Object?> get props => [];
}
