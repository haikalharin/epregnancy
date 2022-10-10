part of 'forgot_password_page_bloc.dart';



@immutable
abstract class ForgotPasswordPageEvent extends Equatable {
  const ForgotPasswordPageEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends ForgotPasswordPageEvent {
  const EmailChangedEvent(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class ChangeNewPasswordChanged extends ForgotPasswordPageEvent {
  const ChangeNewPasswordChanged(this.newPassword);

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

class ChangeConfirmNewPasswordChanged extends ForgotPasswordPageEvent {
  const ChangeConfirmNewPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ForgotPasswordSubmitted extends ForgotPasswordPageEvent {
  const ForgotPasswordSubmitted();
}

class ForgotPasswordInitEvent extends ForgotPasswordPageEvent {
  const ForgotPasswordInitEvent();

  @override
  List<Object> get props => [];
}

