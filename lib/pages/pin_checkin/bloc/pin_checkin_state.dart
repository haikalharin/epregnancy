part of 'pin_checkin_bloc.dart';

class PinCheckInStateInitial extends PinCheckInState {}

class PinCheckInState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? pin;
  final UserModel? userInfo;
  final bool? isActive;
  final bool? firstVisit;

  PinCheckInState(
      {this.pin,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.userInfo,
      this.firstVisit,
      this.isActive});

  PinCheckInState copyWith(
      {FormzStatus? submitStatus,
      String? pin,
      String? errorMessage,
      UserModel? userInfo,
      bool? isActive,
      bool? firstVisit}) {
    return PinCheckInState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        pin: pin ?? this.pin,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive,
        firstVisit: firstVisit ?? this.firstVisit,
    );
  }
}
