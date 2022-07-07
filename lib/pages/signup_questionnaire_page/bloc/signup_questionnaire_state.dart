part of 'signup_questionnaire_bloc.dart';

class SignUpQuestionnaireState {
  final UserModelFirebase? userModelFirebase;
  final PhoneValidator phoneNumber;
  final EmailAddressUsername username;
  final FormzStatus status;
  final String? errorMessage;

  SignUpQuestionnaireState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const EmailAddressUsername.pure(),
        this.userModelFirebase,
        this.status = FormzStatus.pure,
        this.errorMessage});

  SignUpQuestionnaireState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        EmailAddressUsername? username,
        String? errorMessage}) {
    return SignUpQuestionnaireState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, username];
}

class SignUpQuestionnaireInitial extends SignUpQuestionnaireState {}
