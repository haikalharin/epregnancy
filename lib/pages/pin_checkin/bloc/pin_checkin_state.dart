part of 'pin_checkin_bloc.dart';

class PinCheckInStateInitial extends PinCheckInState {}

class PinCheckInState {
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? pin;
  final UserModel? userInfo;
  final bool? isActive;

  PinCheckInState(
      {this.pin,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage,
        this.userInfo,
        this.isActive});

  PinCheckInState copyWith(
      {FormzStatus? submitStatus,
        String? pin,
        String? errorMessage,
        UserModel? userInfo,
        bool? isActive}) {
    return PinCheckInState(
        submitStatus: submitStatus,
        errorMessage: errorMessage,
        pin: pin ?? this.pin,
        userInfo: userInfo ?? this.userInfo,
        isActive: isActive ?? this.isActive);
  }
}
