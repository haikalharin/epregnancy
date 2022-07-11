import 'package:formz/formz.dart';

import '../constants/regex_constants.dart';

enum PhoneValidationError { empty }

class PhoneValidator extends FormzInput<String, PhoneValidationError> {
  const PhoneValidator.pure() : super.pure('');

  const PhoneValidator.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    return RegExp(RegexConstants.validPhoneRegex).hasMatch(value)
        ? null
        : PhoneValidationError.empty;
  }
}
