import 'package:formz/formz.dart';

enum DropdownValidationError { empty }

class DropdownFieldValidator extends FormzInput<String, DropdownValidationError> {
  const DropdownFieldValidator.pure() : super.pure('- PILIH -');
  const DropdownFieldValidator.dirty([String value = '- PILIH -']) : super.dirty(value);

  @override
  DropdownValidationError? validator(String value) {
    if(value == '- PILIH -'){
      return DropdownValidationError.empty;
    } else {
      return null;
    }

  }
}
