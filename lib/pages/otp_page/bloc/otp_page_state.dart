part of 'otp_page_bloc.dart';

class OtpPageInitial extends OtpPageState {}

class OtpPageState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? otp;
  final UserModel? userInfo;
  final bool? otpResendSuccess;
  final bool? isActive;
  final String? typeEvent;

  OtpPageState(
      {this.otp,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.otpResendSuccess,
      this.userInfo,
      this.typeEvent,
      this.isActive});

  OtpPageState copyWith(
      {FormzStatus? submitStatus,
      String? otp,
      String? errorMessage,
      UserModel? userInfo,
      String? typeEvent,
      bool? isActive,
      bool? otpResendSuccess}) {
    return OtpPageState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        otpResendSuccess: otpResendSuccess ?? this.otpResendSuccess,
        userInfo: userInfo ?? this.userInfo,
        typeEvent: typeEvent ?? this.typeEvent,
        isActive: isActive ?? this.isActive);
  }
}
