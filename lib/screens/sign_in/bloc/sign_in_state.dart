part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInit extends SignInState {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;

  SignInInit(this.formKey, this.emailController, this.passwordController,
      this.isLoading);

  SignInInit copyWith({bool? isLoading}) {
    return SignInInit(this.formKey, this.emailController,
        this.passwordController, isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [
        this.formKey,
        this.emailController,
        this.passwordController,
        this.isLoading
      ];
}
