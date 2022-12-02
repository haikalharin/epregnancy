part of 'patient_select_bloc.dart';

class PatientSelectState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final List<UserModel>? users;

  PatientSelectState(
      {this.users, this.type, this.status, this.errorMessage});

  PatientSelectState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        List<UserModel>? users}) {
    return PatientSelectState(
        type: type ?? this.type,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        users: users ?? this.users);
  }
}

class PatientSelectBlocInitialState extends PatientSelectState {}