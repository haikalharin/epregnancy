part of 'hospital_bloc.dart';

abstract class HospitalEvent extends Equatable {
  const HospitalEvent();

  @override
  List<Object> get props => [];
}

class FetchHospitalsEvent extends HospitalEvent {
  const FetchHospitalsEvent(this.name);

  final String? name;

  @override
  List<Object> get props => [name ?? ''];
}

class FetchMembersEvent extends HospitalEvent {
  const FetchMembersEvent(this.name, this.page,
      {
        this.isNextPage = false,
        this.isSearch = false,
        this.isPregnant = 2, this.sortBy, this.sort});

  final String? name;
  final int? isPregnant;
  final String? sortBy;
  final SortEnum? sort;
  final int? page;
  final bool isNextPage;
  final bool isSearch;

  @override
  List<Object> get props => [name ?? ''];
}

class FetchMidwifesEvent extends HospitalEvent {
  const FetchMidwifesEvent(this.name, this.page);

  final String? name;
  final int? page;

  @override
  List<Object> get props => [name ?? ''];
}

class FetchMemberSummaryEvent extends HospitalEvent {
  const FetchMemberSummaryEvent();

  @override
  List<Object> get props => [];
}

class FetchHospitalsByIdEvent extends HospitalEvent {
  const FetchHospitalsByIdEvent(this.id);

  final String? id;

  @override
  List<Object> get props => [];
}



class ChangeHospitalEvent extends HospitalEvent {
  const ChangeHospitalEvent(this.id);

  final String? id;

  @override
  List<Object> get props => [];
}

class HospitalDispose extends HospitalEvent {
  const HospitalDispose();


  @override
  List<Object> get props => [];
}