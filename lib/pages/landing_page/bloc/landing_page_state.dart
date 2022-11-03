part of 'landing_page_bloc.dart';



class LandingPageState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final UserModel? userModel;
  final String? otp;
  final UserModel? userInfo;
  final bool? isActive;
  final String? typeEvent;


  LandingPageState(
      {this.otp,
        this.submitStatus = FormzStatus.pure,
        this.typeEvent,
        this.userModel,
        this.errorMessage,
        this.userInfo,
        this.isActive});

  LandingPageState copyWith(
      {FormzStatus? submitStatus,
        String? otp,
        String? errorMessage,
        UserModel? userInfo,
        String? typeEvent,
        UserModel? userModel,
        bool? isActive}) {
    return LandingPageState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        otp: otp ?? this.otp,
        typeEvent: typeEvent,
        userModel: userModel?? this.userModel,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive);
  }
}

class LandingPageInitial extends LandingPageState {}

