import 'package:formz/formz.dart';

import '../../common/constants/regex_constants.dart';

enum UsernameValidationError { empty, invalid }

class EmailAddressUsername extends FormzInput<String, UsernameValidationError> {
  const EmailAddressUsername.pure() : super.pure('');
  const EmailAddressUsername.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    // return value.isNotEmpty == true ? null : UsernameValidationError.empty;
    if (!RegExp(RegexConstants.validEmailRegex).hasMatch(value)) {
      return UsernameValidationError.invalid;
    }
  }
}
