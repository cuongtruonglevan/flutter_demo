import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

const kInputBorderRadius = 8.0;

double getSafeHeight(BuildContext context) =>
    MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

PageRoute defaultPageRoute(BuildContext context, RouteSettings settings) =>
    platformPageRoute(
      context: context,
      settings: settings,
      builder: (context) => Container(),
    );

InputDecoration getInputOutlineDecoration(String label,
    {bool showHint = true, bool showLabel = true}) {
  final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: AppColors.lineColor),
  );

  final _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: AppColors.primaryColor),
  );

  final _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: AppColors.errorColor),
  );
  return InputDecoration(
    labelText: showLabel ? label.toString() : null,
    hintText: showHint ? label.toString() : null,
    labelStyle: AppTextStyles.normalRegular12,
    enabledBorder: _defaultBorder,
    disabledBorder: _defaultBorder,
    focusedBorder: _focusedBorder,
    errorBorder: _errorBorder,
    focusedErrorBorder: _errorBorder,
  );
}

showAlertDialog(BuildContext context, String message) => showPlatformDialog(
      context: context,
      builder: (context) => PlatformAlertDialog(
        title: Text('Alert'),
        content: Text(message),
        actions: [
          PlatformButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );

extension StoredProperties on SharedPreferences {
  static const String _kUserEmailAddress = 'userEmailAddress';

  String? get userEmailAddress => getString(_kUserEmailAddress);

  set userEmailAddress(String? value) => setString(_kUserEmailAddress, value!);
}
