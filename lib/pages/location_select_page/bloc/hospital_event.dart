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