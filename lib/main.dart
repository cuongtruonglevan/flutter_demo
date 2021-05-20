import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_demo/screens/splash/splash_screen.dart';
import 'package:flutter_demo/shared/routes/auth_routes_factory.dart';
import 'package:flutter_demo/shared/routes/instruction_routes_factory.dart';
import 'package:flutter_demo/shared/routes/routes.dart';
import 'package:flutter_demo/shared/routes/app_routes_factory.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(sharedPreferences),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          Widget _child;
          if (state is Authenticated) {
            _child = _buildFeaturesApp(context, state.user);
          } else if (state is InstructionIncomplete) {
            _child = _buildInstructionApp(context);
          } else if (state is UnAuthenticated) {
            _child = _buildAuthApp(context);
          } else {
            _child = SplashScreen();
          }
          return AnimatedSwitcher(
            child: _child,
            switchInCurve: Curves.easeInCirc,
            switchOutCurve: Curves.easeOutCirc,
            duration: Duration(milliseconds: 250),
          );
        },
      ),
    );
  }

  Widget _buildAuthApp(BuildContext context) {
    final _routeFactory = AuthRoutesFactory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>
          _routeFactory.generateRoute(context, settings),
      initialRoute: Routes.signIn,
    );
  }

  Widget _buildInstructionApp(BuildContext context) {
    final _routeFactory = InstructionRoutesFactory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _routeFactory.navigatorKey,
      onGenerateRoute: (settings) =>
          _routeFactory.generateRoute(context, settings),
      initialRoute: Routes.instruction,
    );
  }

  Widget _buildFeaturesApp(BuildContext context, User user) {
    final _routesFactory = AppRoutesFactory(sharedPreferences, user);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _routesFactory.navigatorKey,
        onGenerateRoute: (settings) =>
            _routesFactory.generateRoute(context, settings),
        initialRoute: Routes.home,
      ),
    );
  }
}
