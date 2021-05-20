class EmailValidator {
  EmailValidator._();

  static String? validate(String value) {
    final valueIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*'+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (value.isEmpty) {
      return 'Email should not be empty';
    }
    if (!valueIsValid) {
      return 'You entered an invalid email';
    }
    return null;
  }
}
