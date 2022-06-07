import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

class PasswordValidator extends FormzInput<String, PasswordValidationError> {
  const PasswordValidator.pure() : super.pure('');

  const PasswordValidator.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    return value.length >= 8 ? null : PasswordValidationError.empty;
  }

  final String invalidPassword = "Password harus 8 digit";
}
