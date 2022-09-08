part of 'signup_questionnaire_bloc.dart';

class SignUpQuestionnaireState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserModelApi? userModelApi;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator secondName;
  final PasswordValidator password;
  final ConfirmPasswordValidator confirmPassword;
  final MandatoryFieldValidator date;
  final FormzStatus submitStatus;
  final String? errorMessage;

  SignUpQuestionnaireState(
      {this.firstName = const MandatoryFieldValidator.pure(),
      this.secondName = const MandatoryFieldValidator.pure(),
      this.password = const PasswordValidator.pure(),
      this.confirmPassword = const ConfirmPasswordValidator.pure(''),
      this.date = const MandatoryFieldValidator.pure(),
      this.userModelFirebase,
        this.userModelApi,
        this.submitStatus = FormzStatus.pure,
      this.errorMessage});

  SignUpQuestionnaireState copyWith(
      {FormzStatus? submitStatus,
      UserModelFirebase? userModelFirebase,
      UserModelApi? userModelApi,
      MandatoryFieldValidator? firstName,
      MandatoryFieldValidator? secondName,
      PasswordValidator? password,
      ConfirmPasswordValidator? confirmPassword,
      MandatoryFieldValidator? date,
      String? errorMessage}) {
    return SignUpQuestionnaireState(
        submitStatus: submitStatus ?? this.submitStatus,
        firstName: firstName ?? this.firstName,
        secondName: secondName ?? this.secondName,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        date: date ?? this.date,
        userModelFirebase: userModelFirebase ?? this.userModelFirebase,
        userModelApi: userModelApi ?? this.userModelApi,
        errorMessage: errorMessage);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs =>
      [firstName, secondName, password, confirmPassword, date];
}

class SignUpQuestionnaireInitial extends SignUpQuestionnaireState {}
