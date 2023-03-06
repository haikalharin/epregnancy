import 'package:formz/formz.dart';

import '../constants/regex_constants.dart';

enum PasswordValidationError { empty, invalid }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value == null) {
      return PasswordValidationError.empty;
    }

    if (RegExp(RegexConstants.validPasswordlRegex).hasMatch(value)) {
        return null;
    }else{
      return PasswordValidationError.invalid;
    }

  }

  final String invalidPassword = "Password harus 8 digit";
}
