import 'package:formz/formz.dart';

enum MandatoryValidationError { empty }

class MandatoryFieldValidator extends FormzInput<String, MandatoryValidationError> {
  const MandatoryFieldValidator.pure() : super.pure('');
  const MandatoryFieldValidator.dirty([String value = '']) : super.dirty(value);

  @override
  MandatoryValidationError? validator(String value) {
    return value.isNotEmpty == true ? null : MandatoryValidationError.empty;
  }
}
