import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthBloc _authBloc;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  factory SignInBloc({required AuthBloc authBloc}) => SignInBloc._(
      authBloc, GlobalKey(), TextEditingController(), TextEditingController());

  SignInBloc._(this._authBloc, this._formKey, this._emailController,
      this._passwordController)
      : super(SignInInit(
            _formKey, _emailController, _passwordController, false)) {
    _emailController.text = 'test@gmail.com';
    _passwordController.text = '123456';
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is DoSignInEvent) {
      yield* _mapDoSignInEventToState();
    }
  }

  Stream<SignInState> _mapDoSignInEventToState() async* {
    final state = this.state;
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (state is SignInInit) {
      yield state.copyWith(isLoading: true);
      await Future.delayed(Duration(milliseconds: 1000));
      yield state.copyWith(isLoading: false);
      if (_emailController.text == 'test@gmail.com' &&
          _passwordController.text == '123456') {
        _authBloc.add(
            DidAuthenticate(User('01', 'test@gmail.com', 'Test', 'Test', Map())));
      } else {
        print('Authenticate failed');
      }
    }
  }
}
