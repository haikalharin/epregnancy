part of 'change_password_bloc.dart';

class ChangePasswordState with FormzMixin {
  final UserModel? userModel;
  final PasswordValidator currentPassword;
  final PasswordValidator newPassword;
  final ConfirmPasswordValidator confirmPassword;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  ChangePasswordState(
      {this.currentPassword = const PasswordValidator.pure(),
      this.newPassword = const PasswordValidator.pure(),
      this.confirmPassword = const ConfirmPasswordValidator.pure(''),
      this.userModel,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.type});

  ChangePasswordState copyWith(
      {FormzStatus? submitStatus,
      UserModel? userModel,
      PasswordValidator? currentPassword,
      PasswordValidator? newPassword,
      ConfirmPasswordValidator? confirmPassword,
      String? errorMessage,
      String? type}) {
    return ChangePasswordState(
        submitStatus: submitStatus,
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage,
        type: type ?? this.type);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [newPassword, confirmPassword];
}

class ChangePasswordInitial extends ChangePasswordState {}
