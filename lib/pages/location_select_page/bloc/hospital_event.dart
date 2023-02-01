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
  const FetchMembersEvent(this.name, this.page);
  final String? name;
  final int? page;

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