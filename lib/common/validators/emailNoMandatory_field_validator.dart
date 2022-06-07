import 'package:formz/formz.dart';

import '../constants/regex_constants.dart';

enum EmailNoMandatoryValidationError { empty }

class EmailNoMandatoryValidator extends FormzInput<String, EmailNoMandatoryValidationError> {
  const EmailNoMandatoryValidator.pure() : super.pure('');
  const EmailNoMandatoryValidator.dirty([String value = '']) : super.dirty(value);

  @override
  EmailNoMandatoryValidationError? validator(String value) {
    if (value == "" ||  RegExp(RegexConstants.validEmailRegex).hasMatch(value)){
      return null;
    }else{
      return EmailNoMandatoryValidationError.empty;
    }
  }
}
