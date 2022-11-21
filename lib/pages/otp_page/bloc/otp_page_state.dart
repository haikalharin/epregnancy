part of 'otp_page_bloc.dart';

class OtpPageInitial extends OtpPageState {}

class OtpPageState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? otp;
  final UserModel? userInfo;
  final bool? otpResendSuccess;
  final bool? isActive;

  OtpPageState(
      {this.otp,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.otpResendSuccess,
      this.userInfo,
      this.isActive});

  OtpPageState copyWith(
      {FormzStatus? submitStatus,
      String? otp,
      String? errorMessage,
      UserModel? userInfo,
      bool? isActive,
      bool? otpResendSuccess}) {
    return OtpPageState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        otpResendSuccess: otpResendSuccess ?? this.otpResendSuccess,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive);
  }
}
