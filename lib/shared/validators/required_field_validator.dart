class RequiredFieldValidator {
  RequiredFieldValidator._();

  static String? validate(dynamic value) {
    if (value == null) {
      return 'This field cannot be empty';
    }
    if (value is String && value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
