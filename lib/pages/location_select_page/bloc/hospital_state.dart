part of 'hospital_bloc.dart';

class HospitalState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final List<HospitalModel>? hospitals;

  HospitalState(
      {this.hospitals, this.type, this.status, this.errorMessage});

  HospitalState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        List<HospitalModel>? hospitals}) {
    return HospitalState(
        type: type ?? this.type,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        hospitals: hospitals ?? this.hospitals);
  }
}

class HospitalBlocInitialState extends HospitalState {}