part of 'otp_page_bloc.dart';

class OtpPageInitial extends OtpPageState {}

class OtpPageState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? otp;
  final UserModel? userInfo;
  final bool? isActive;

  OtpPageState(
      {this.otp,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.userInfo,
      this.isActive});

  OtpPageState copyWith(
      {FormzStatus? submitStatus,
      String? otp,
      String? errorMessage,
      UserModel? userInfo,
      bool? isActive}) {
    return OtpPageState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive);
  }
}
