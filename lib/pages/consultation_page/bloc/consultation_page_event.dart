part of 'consultation_page_bloc.dart';


@immutable
abstract class ConsultationPageEvent extends Equatable{
  const ConsultationPageEvent();

  @override
  List<Object> get props => [];
}

class ConsultationFetchEvent extends ConsultationPageEvent {
  const ConsultationFetchEvent();


  @override
  List<Object> get props => [];
}