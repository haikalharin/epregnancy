part of 'login_bloc.dart';

class LoginState {
  final PhoneValidator phoneNumber;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  LoginState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.password = const Password.pure(),
        this.status = FormzStatus.pure,
        this.errorMessage});

  LoginState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        Password? password,
        String? errorMessage}) {
    return LoginState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, phoneNumber, password];
}

class LoginInitial extends LoginState {}
