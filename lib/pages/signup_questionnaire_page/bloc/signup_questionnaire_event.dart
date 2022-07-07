part of 'signup_questionnaire_bloc.dart';

@immutable
abstract class SignUpQuestionnaireEvent extends Equatable{
  const SignUpQuestionnaireEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends SignUpQuestionnaireEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginUsernameChanged extends SignUpQuestionnaireEvent {
  const LoginUsernameChanged(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class LoginPasswordChanged extends SignUpQuestionnaireEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends SignUpQuestionnaireEvent {
  const LoginSubmitted();
}
class LoginWithGoogleSubmitted extends SignUpQuestionnaireEvent {
  const LoginWithGoogleSubmitted();
}

class LoginSubmittedWithNumberPhone extends SignUpQuestionnaireEvent {
  const LoginSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}
