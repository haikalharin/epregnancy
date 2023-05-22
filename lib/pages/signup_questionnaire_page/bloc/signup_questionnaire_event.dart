part of 'signup_questionnaire_bloc.dart';

@immutable
abstract class SignUpQuestionnaireEvent extends Equatable{
  const SignUpQuestionnaireEvent();

  @override
  List<Object> get props => [];
}


class SignupFirstnameChanged extends SignUpQuestionnaireEvent {
  const SignupFirstnameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class SignupSecondnameChanged extends SignUpQuestionnaireEvent {
  const SignupSecondnameChanged(this.secondName);

  final String secondName;

  @override
  List<Object> get props => [secondName];
}

class SignupPasswordChanged extends SignUpQuestionnaireEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}


class SignupConfirmPasswordChanged extends SignUpQuestionnaireEvent {
  const SignupConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class SignupDateChanged extends SignUpQuestionnaireEvent {
  const SignupDateChanged(this.date);

  final String date;

  @override
  List<Object> get props => [date];
}

class SignupReferralCodeChanged extends SignUpQuestionnaireEvent {
  const SignupReferralCodeChanged(this.referralCode);

  final String referralCode;

  @override
  List<Object> get props => [referralCode];
}


class SignupSubmitted extends SignUpQuestionnaireEvent {
  const SignupSubmitted();
}
class SignupWithGoogleSubmitted extends SignUpQuestionnaireEvent {
  const SignupWithGoogleSubmitted();
}

class SignupSubmittedWithNumberPhone extends SignUpQuestionnaireEvent {
  const SignupSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}

class SignupInitEvent extends SignUpQuestionnaireEvent {
  const SignupInitEvent();


  @override
  List<Object> get props => [];
}
