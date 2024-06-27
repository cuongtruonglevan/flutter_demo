# Flutter Demo Using BloC

This is a simple Flutter project demonstrating the usage of BloC (Business Logic Component) architecture for state management. BloC architecture separates business logic from UI components, promoting a more structured and scalable approach to building Flutter applications.

## Getting Started

To run this project locally, follow these steps:

### Prerequisites

Make sure you have Flutter installed. For installation instructions, refer to the [Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/cuongtruonglevan/flutter_demo.git
   ```

2. Navigate into the project directory:

   ```bash
   cd flutter_demo
   ```

3. Get the dependencies:

   ```bash
   flutter pub get
   ```

### Running the App

Use the following command to run the Flutter app on your connected device or simulator:

```bash
flutter run
```

This command launches the Flutter application in debug mode.

## Architecture Overview

### BloC Pattern

This project uses the BloC pattern for state management:

- **Bloc**: Manages the state of the application.
- **Event**: Represents events that can change the state.
- **State**: Represents the state of the application in response to events.

![Bloc](https://miro.medium.com/max/1400/1*MqYPYKdNBiID0mZ-zyE-mA.png)

### Project Structure

The project structure is organized as follows:
 
 - `lib\main.dart` - Project entry point
 - `lib\core\..` - Core classes like Exception handler
 - `lib\data_access\..` - Manage app's repositories, APIs intergrated here
 - `lib\models\..` - Manage app's models that used to work with repositories
 - `lib\screens\..` - UI code and Logic code for each screen. Ex:
   `lib\screens\home\home_screen.dart` - UI
   `lib\screens\home\bloc\..` - Logic
 - `lib\shared\..` - Components that's used accross the app, included colors and styles
 - `assets\sample.json` - Sample data's stored here

## Dependencies

- `flutter_bloc`: Provides the core functionality to implement the BloC pattern.
- `equatable`: Simplifies equality comparisons for Dart objects.

## Acknowledgments

- [Official Flutter Documentation](https://flutter.dev/docs)
- [Bloc Library Documentation](https://bloclibrary.dev)
- [Equatable Package Documentation](https://pub.dev/packages/equatable)
