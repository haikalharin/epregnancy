part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable{
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends SignupEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginUsernameChanged extends SignupEvent {
  const LoginUsernameChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginInitEvent extends SignupEvent {
  const LoginInitEvent();


  @override
  List<Object> get props => [];
}

class LoginPasswordChanged extends SignupEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends SignupEvent {
  const LoginSubmitted();
}
class LoginWithGoogleSubmitted extends SignupEvent {
  const LoginWithGoogleSubmitted();
}

class LoginSubmittedWithNumberPhone extends SignupEvent {
  const LoginSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}
