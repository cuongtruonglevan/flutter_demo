part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class DoSignInEvent extends SignInEvent {
  @override
  List<Object?> get props => [];
}
