import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_demo/screens/instruction/instruction_screen.dart';
import 'package:flutter_demo/shared/routes/routes.dart';
import 'package:flutter_demo/shared/utils.dart';

class InstructionRoutesFactory {
  final navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.instruction:
        return platformPageRoute(
          context: context,
          settings: settings,
          builder: (context) => InstructionScreen(navigatorKey: navigatorKey,),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}
