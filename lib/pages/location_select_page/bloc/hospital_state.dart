part of 'hospital_bloc.dart';

class HospitalState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final String? patientAmount;
  final String? midwifeAmount;
  final List<HospitalModel>? hospitals;
  final List<Member>? members;
  final List<Member>? midwifes;
  final bool? last;

  HospitalState(
      {this.hospitals, this.type, this.status, this.errorMessage, this.patientAmount, this.midwifeAmount, this.members, this.last, this.midwifes});

  HospitalState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        String? patientAmount,
        String? midwifeAmount,
        bool? last,
        List<Member>? members,
        List<Member>? midwifes,
        List<HospitalModel>? hospitals}) {
    return HospitalState(
        type: type ?? this.type,
        status: status ?? this.status,
        patientAmount: patientAmount ?? this.patientAmount,
        midwifeAmount: midwifeAmount ?? this.midwifeAmount,
        errorMessage: errorMessage ?? this.errorMessage,
        last: last ?? this.last,
        members: members ?? this.members,
        midwifes: midwifes ?? this.midwifes,
        hospitals: hospitals ?? this.hospitals);
  }
}

class HospitalBlocInitialState extends HospitalState {}