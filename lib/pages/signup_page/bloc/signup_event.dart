part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable{
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupPhoneNumberChanged extends SignupEvent {
  const SignupPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SignupUsernameChanged extends SignupEvent {
  const SignupUsernameChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignupInitEvent extends SignupEvent {
  const SignupInitEvent();


  @override
  List<Object> get props => [];
}


class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
class SignupWithGoogleSubmitted extends SignupEvent {
  const SignupWithGoogleSubmitted();
}

class SignupSubmittedWithNumberPhone extends SignupEvent {
  const SignupSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}

class RequestOtp extends SignupEvent {
  const RequestOtp(this.isEmail);
  final bool isEmail;
}
