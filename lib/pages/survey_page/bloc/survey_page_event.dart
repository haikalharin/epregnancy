part of 'survey_page_bloc.dart';

@immutable
abstract class SurveyPageEvent extends Equatable{
  const SurveyPageEvent();

  @override
  List<Object> get props => [];
}

class SurveyAddDataEvent extends SurveyPageEvent {
  const SurveyAddDataEvent(this.isPregnant, this.isPlanningPregnancy, this.isHaveBaby);

  final bool isPregnant;
  final bool isPlanningPregnancy;
  final bool isHaveBaby;


  @override
  List<Object> get props => [];
}

class SurveyAddDataBabyEvent extends SurveyPageEvent {
  const SurveyAddDataBabyEvent();



  @override
  List<Object> get props => [];
}

class SurveyPageChanged extends SurveyPageEvent {
  const SurveyPageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

class SurveyDateChanged extends SurveyPageEvent {
  const SurveyDateChanged(this.date);

  final String date;

  @override
  List<Object> get props => [date];
}

class SurveyBabysNameChanged extends SurveyPageEvent {
  const SurveyBabysNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class SurveyInitEvent extends SurveyPageEvent {
  const SurveyInitEvent();


  @override
  List<Object> get props => [];
}



