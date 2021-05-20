import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_demo/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_demo/shared/routes/routes.dart';
import 'package:flutter_demo/shared/utils.dart';

class AuthRoutesFactory {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.signIn:
        return platformPageRoute(
          context: context,
          settings: settings,
          builder: (context) => SignInScreen(),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}
