part of 'login_example_bloc.dart';

@immutable
abstract class LoginExampleEvent extends Equatable{
  const LoginExampleEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends LoginExampleEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginUsernameChanged extends LoginExampleEvent {
  const LoginUsernameChanged(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class LoginPasswordChanged extends LoginExampleEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginExampleEvent {
  const LoginSubmitted();
}
class LoginWithGoogleSubmitted extends LoginExampleEvent {
  const LoginWithGoogleSubmitted();
}

class LoginSubmittedWithNumberPhone extends LoginExampleEvent {
  const LoginSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}
