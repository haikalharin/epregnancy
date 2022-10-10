part of 'forgot_password_page_bloc.dart';



class ForgotPasswordPageState with FormzMixin {
  final UserModel? userModel;
  final MandatoryFieldValidator userName;
  final PasswordValidator newPassword;
  final ConfirmPasswordValidator confirmPassword;
  final FormzStatus? submitStatus;
  final String? errorMessage;

  ForgotPasswordPageState(
      {this.userName = const MandatoryFieldValidator.pure(),
        this.newPassword = const PasswordValidator.pure(),
        this.confirmPassword = const ConfirmPasswordValidator.pure(''),
        this.userModel,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  ForgotPasswordPageState copyWith(
      {FormzStatus? submitStatus,
        UserModel? userModel,
        MandatoryFieldValidator? userName,
        PasswordValidator? newPassword,
        ConfirmPasswordValidator? confirmPassword,
        String? errorMessage}) {
    return ForgotPasswordPageState(
        submitStatus: submitStatus,
        userName: userName ?? this.userName,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [userName];
}


class ForgotPasswordPageInitial extends ForgotPasswordPageState {}
