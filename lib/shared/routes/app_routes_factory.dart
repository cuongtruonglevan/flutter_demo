import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/home/home_screen.dart';
import 'package:flutter_demo/shared/routes/routes.dart';
import 'package:flutter_demo/shared/utils.dart';

class AppRoutesFactory {
  final SharedPreferences sharedPreferences;
  final User user;
  final navigatorKey = GlobalKey<NavigatorState>();

  AppRoutesFactory(this.sharedPreferences, this.user);

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return platformPageRoute(
          context: context,
          settings: settings,
          builder: (context) => HomeScreen(user: user),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}
