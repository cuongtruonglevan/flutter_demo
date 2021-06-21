# Flutter Demo Using BloC

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)

![Bloc](https://miro.medium.com/max/1400/1*MqYPYKdNBiID0mZ-zyE-mA.png)
 
 - `lib\main.dart` - Project entry point
 - `lib\core\..` - Core classes like Exception handler
 - `lib\data_access\..` - Manage app's repositories, APIs intergrated here
 - `lib\models\..` - Manage app's models that used to work with repositories
 - `lib\screens\..` - UI code and Logic code for each screen. Ex:
   `lib\screens\home\home_screen.dart` - UI
   `lib\screens\home\bloc\..` - Logic
 - `lib\shared\..` - Components that's used accross the app, included colors and styles
 - `assets\sample.json` - Sample data's stored here
