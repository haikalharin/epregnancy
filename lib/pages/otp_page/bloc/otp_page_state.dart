part of 'otp_page_bloc.dart';


class OtpPageInitial extends OtpPageState {}

class OtpPageState {

  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? otp;

  OtpPageState({
    this.otp,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage});

  OtpPageState copyWith({
    FormzStatus?submitStatus,
    String? otp,
    String? errorMessage}) {
    return OtpPageState(
        submitStatus: submitStatus,
        otp: otp ?? this.otp,
        errorMessage: errorMessage);
  }
}