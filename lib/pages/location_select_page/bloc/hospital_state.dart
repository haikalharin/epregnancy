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
  final bool last;
  final bool isLoadingBottom;
  final int? page;

  HospitalState({
    this.hospitals,
    this.type,
    this.status,
    this.errorMessage,
    this.patientAmount,
    this.midwifeAmount,
    this.members,
    this.last = false,
    this.isLoadingBottom = true,
    this.midwifes,
    this.page = 0,
  });

  HospitalState copyWith(
      {FormzStatus? status,
      String? type,
      String? errorMessage,
      String? patientAmount,
      String? midwifeAmount,
      bool? last,
      bool? isLoadingBottom,
      List<Member>? members,
      List<Member>? midwifes,
      List<HospitalModel>? hospitals,
      int? page}) {
    return HospitalState(
        type: type ?? this.type,
        status: status ?? this.status,
        patientAmount: patientAmount ?? this.patientAmount,
        midwifeAmount: midwifeAmount ?? this.midwifeAmount,
        errorMessage: errorMessage ?? this.errorMessage,
        last: last ?? this.last,
        isLoadingBottom: isLoadingBottom ?? this.isLoadingBottom,
        page: page ?? this.page,
        members: members ?? this.members,
        midwifes: midwifes ?? this.midwifes,
        hospitals: hospitals ?? this.hospitals);
  }
}

class HospitalBlocInitialState extends HospitalState {}
