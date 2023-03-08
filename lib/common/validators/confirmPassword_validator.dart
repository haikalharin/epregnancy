import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { empty }

class ConfirmPasswordValidator extends FormzInput<String, ConfirmPasswordValidationError> {
  final String pass;
  const ConfirmPasswordValidator.pure(this.pass) : super.pure('');
  const ConfirmPasswordValidator.dirty(this.pass, [String value = '']) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String value) {
    return value.length >= 6 && value == pass
        ? null
        : ConfirmPasswordValidationError.empty;
  }
}
