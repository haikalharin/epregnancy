part of 'login_bloc.dart';

class LoginState {
  final UserModelFirebase? userModelFirebase;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator username;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  LoginState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const MandatoryFieldValidator.pure(),
        this.password = const Password.pure(),
        this.userModelFirebase,
        this.status = FormzStatus.pure,
        this.errorMessage});

  LoginState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        MandatoryFieldValidator? username,
        Password? password,
        String? errorMessage}) {
    return LoginState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        password: password ?? this.password,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, username, password,username];
}

class LoginInitial extends LoginState {}
