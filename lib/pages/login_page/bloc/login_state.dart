part of 'login_bloc.dart';

class LoginState {
  final Username username;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  LoginState(
      {this.username = const Username.pure(),
        this.password = const Password.pure(),
        this.status = FormzStatus.pure,
        this.errorMessage});

  LoginState copyWith(
      {FormzStatus? status,
        Username? username,
        Password? password,
        String? errorMessage}) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, username, password];
}

class LoginInitial extends LoginState {}
