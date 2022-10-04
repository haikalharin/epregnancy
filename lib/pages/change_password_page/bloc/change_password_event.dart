part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentPasswordChanged extends ChangePasswordEvent {
  const ChangeCurrentPasswordChanged(this.currentPassword);

  final String currentPassword;

  @override
  List<Object> get props => [currentPassword];
}

class ChangeNewPasswordChanged extends ChangePasswordEvent {
  const ChangeNewPasswordChanged(this.newPassword);

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

class ChangeConfirmNewPasswordChanged extends ChangePasswordEvent {
  const ChangeConfirmNewPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}

class ChangeInitEvent extends ChangePasswordEvent {
  const ChangeInitEvent();

  @override
  List<Object> get props => [];
}
