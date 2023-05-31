part of 'signup_questionnaire_bloc.dart';

class SignUpQuestionnaireState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserModel? userModel;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator secondName;
  final MandatoryFieldValidator referralCode;
  final PasswordValidator password;
  final ConfirmPasswordValidator confirmPassword;
  final MandatoryFieldValidator date;
  final bool? dateValid;
  final FormzStatus submitStatus;
  final String? errorMessage;

  SignUpQuestionnaireState(
      {this.firstName = const MandatoryFieldValidator.pure(),
      this.secondName = const MandatoryFieldValidator.pure(),
      this.referralCode = const MandatoryFieldValidator.pure(),
      this.password = const PasswordValidator.pure(),
      this.confirmPassword = const ConfirmPasswordValidator.pure(''),
      this.date = const MandatoryFieldValidator.pure(),
      this.dateValid,
      this.userModelFirebase,
        this.userModel,
        this.submitStatus = FormzStatus.pure,
      this.errorMessage});

  SignUpQuestionnaireState copyWith(
      {FormzStatus? submitStatus,
      UserModelFirebase? userModelFirebase,
      UserModel? userModel,
      MandatoryFieldValidator? firstName,
      MandatoryFieldValidator? secondName,
      MandatoryFieldValidator? referralCode,
      PasswordValidator? password,
      ConfirmPasswordValidator? confirmPassword,
      MandatoryFieldValidator? date,
      bool? dateValid,
      String? errorMessage}) {
    return SignUpQuestionnaireState(
        submitStatus: submitStatus ?? this.submitStatus,
        firstName: firstName ?? this.firstName,
        secondName: secondName ?? this.secondName,
        referralCode: referralCode ?? this.referralCode,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        date: date ?? this.date,
        dateValid: dateValid ?? this.dateValid,
        userModelFirebase: userModelFirebase ?? this.userModelFirebase,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs =>
      [firstName, secondName, password, confirmPassword, date];
}

class SignUpQuestionnaireInitial extends SignUpQuestionnaireState {}
