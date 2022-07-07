part of 'signup_bloc.dart';

class SignupState {
  final UserModelFirebase? userModelFirebase;
  final PhoneValidator phoneNumber;
  final EmailAddressUsername username;
  final FormzStatus status;
  final String? errorMessage;

  SignupState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const EmailAddressUsername.pure(),
        this.userModelFirebase,
        this.status = FormzStatus.pure,
        this.errorMessage});

  SignupState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        EmailAddressUsername? username,
        String? errorMessage}) {
    return SignupState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, username];
}

class SignupInitial extends SignupState {}
