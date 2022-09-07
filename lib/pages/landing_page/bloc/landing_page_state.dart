part of 'landing_page_bloc.dart';



class LandingPageState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? otp;
  final UserModel? userInfo;
  final bool? isActive;

  LandingPageState(
      {this.otp,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage,
        this.userInfo,
        this.isActive});

  LandingPageState copyWith(
      {FormzStatus? submitStatus,
        String? otp,
        String? errorMessage,
        UserModel? userInfo,
        bool? isActive}) {
    return LandingPageState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive);
  }
}

class LandingPageInitial extends LandingPageState {}

