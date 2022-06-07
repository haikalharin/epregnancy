part of 'login_example_bloc.dart';

class LoginExampleState {
  final PhoneValidator phoneNumber;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  LoginExampleState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.password = const Password.pure(),
        this.status = FormzStatus.pure,
        this.errorMessage});

  LoginExampleState copyWith(
      {FormzStatus? status,
        PhoneValidator? phoneNumber,
        Password? password,
        String? errorMessage}) {
    return LoginExampleState(
        status: status ?? this.status,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status, phoneNumber, password];
}

class LoginInitial extends LoginExampleState {}
