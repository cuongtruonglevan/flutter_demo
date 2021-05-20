import 'package:flutter/services.dart';

const defaultError = 'Something wrong just happened';

class AppException implements Exception {
  final String internalMessage;

  final String userFriendlyMessage;

  AppException(
      {required this.internalMessage, this.userFriendlyMessage = defaultError});

  factory AppException.fromException(dynamic exception) {
    if (exception is AppException) {
      return exception;
    } else if (exception is PlatformException) {
      return AppException._fromPlatformException(exception);
    } else {
      return AppException(
        internalMessage: exception.toString(),
        userFriendlyMessage: defaultError,
      );
    }
  }

  factory AppException._fromPlatformException(PlatformException exception) {
    return AppException(
      internalMessage: exception.message!,
      userFriendlyMessage: defaultError,
    );
  }

  @override
  String toString() {
    return internalMessage;
  }
}

class UnauthorizedAppException extends AppException {
  UnauthorizedAppException() : super(internalMessage: '401 Unauthorized');
}
