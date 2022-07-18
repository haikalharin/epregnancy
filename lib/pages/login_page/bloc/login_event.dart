part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  List<Object> get props => [];
}
class LoginInitDataChanged extends LoginEvent {
  const LoginInitDataChanged();


  @override
  List<Object> get props => [];
}

class LoginDispose extends LoginEvent {
  const LoginDispose();


  @override
  List<Object> get props => [];
}

class LoginPhoneNumberChanged extends LoginEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
class LoginWithGoogleSubmitted extends LoginEvent {
  const LoginWithGoogleSubmitted();
}

class LoginSubmittedWithNumberPhone extends LoginEvent {
  const LoginSubmittedWithNumberPhone(this.context, this.codeController);

  final BuildContext context;
  final TextEditingController codeController;
}
