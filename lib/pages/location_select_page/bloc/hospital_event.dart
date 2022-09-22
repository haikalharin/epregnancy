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