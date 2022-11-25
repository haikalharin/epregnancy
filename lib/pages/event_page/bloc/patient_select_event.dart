part of 'patient_select_bloc.dart';

abstract class PatientSelectEvent extends Equatable {
  const PatientSelectEvent();

  @override
  List<Object> get props => [];
}

class FetchPatientEvent extends PatientSelectEvent {
  const FetchPatientEvent(this.name);
  final String? name;

  @override
  List<Object> get props => [name ?? ''];
}
