import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/model/model.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences _sharedPreferences;

  AuthBloc(this._sharedPreferences) : super(Unknown()) {
    add(RestoreSession());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RestoreSession) {
      yield* _mapRestoreSessionEventToState();
    } else if (event is DidAuthenticate) {
      yield* _mapAuthenticateEventToState(event.user);
    } else if (event is LogOut) {
      yield* _mapLogOutEventToState();
    }
  }

  Stream<AuthState> _mapRestoreSessionEventToState() async* {
    final authenticated =
        await Future.delayed(Duration(milliseconds: 2000), () {
      return false;
    });

    if (authenticated) {
      final user = User('01', 'test.test@gmail.com', 'Test', 'Test', Map());
      if (user.instructionMap.isNotEmpty) {
        yield Authenticated(user);
      } else {
        yield InstructionIncomplete();
      }
    } else {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> _mapAuthenticateEventToState(User user) async* {
    /// Store user info into SharedPreferences
    if (user.instructionMap.isNotEmpty) {
      yield Authenticated(user);
    } else {
      yield InstructionIncomplete();
    }
  }

  Stream<AuthState> _mapLogOutEventToState() async* {
    /// Call log out from AuthRepository
    yield UnAuthenticated();
  }
}
