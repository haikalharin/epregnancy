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
  final bool lastPagePatient;
  final bool lastPageMidwife;
  final bool isSearch;
  final int isPregnant;
  final SortEnum? sort;
  final String? sortBy;
  final String? name;
  final int page;

  HospitalState({
    this.hospitals,
    this.type,
    this.status,
    this.errorMessage,
    this.patientAmount,
    this.midwifeAmount,
    this.members,
    this.lastPagePatient = false,
    this.lastPageMidwife = false,
    this.isSearch = false,
    this.isPregnant = 2,
    this.sort,
    this.sortBy,
    this.name,
    this.midwifes,
    this.page = 0,
  });

  HospitalState copyWith(
      {FormzStatus? status,
      String? type,
      String? errorMessage,
      String? patientAmount,
      String? midwifeAmount,
      bool? lastPagePatient,
      bool? lastPageMidwife,
      bool? isSearch,
      int? isPregnant,
      SortEnum? sort,
      String? sortBy,
      String? name,
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
        lastPagePatient: lastPagePatient ?? this.lastPagePatient,
        lastPageMidwife: lastPageMidwife ?? this.lastPageMidwife,
        page: page ?? this.page,
        isSearch: isSearch ?? this.isSearch,
        name: name ?? this.name,
        sort: sort ?? this.sort,
        sortBy: sortBy ?? this.sortBy,
        members: members ?? this.members,
        midwifes: midwifes ?? this.midwifes,
        hospitals: hospitals ?? this.hospitals);
  }
}

class HospitalBlocInitialState extends HospitalState {}
