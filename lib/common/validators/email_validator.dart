import 'package:formz/formz.dart';

import '../constants/regex_constants.dart';

enum EmailValidationError { empty, invalid }

class EmailValidator extends FormzInput<String, EmailValidationError> {
  const EmailValidator.pure() : super.pure('');
  const EmailValidator.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value == null) {
      return EmailValidationError.empty;
    }

    if (!RegExp(RegexConstants.validEmailRegex).hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }

  final String invalidEmail = "Email tidak valid";
  final String emailEmpty = "Email wajib di isi";
}
