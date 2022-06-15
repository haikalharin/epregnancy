part of 'login_example_bloc.dart';

class LoginExampleState {
  final PhoneValidator phoneNumber;
  final Username username;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  LoginExampleState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const Username.pure(),
        this.password = const Password.pure(),
        this.status = FormzStatus.pure,
        this.errorMessage});

  LoginExampleState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        Username? username,
        Password? password,
        String? errorMessage}) {
    return LoginExampleState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        password: password ?? this.password,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, username, password,username];
}

class LoginInitial extends LoginExampleState {}
