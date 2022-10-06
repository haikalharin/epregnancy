part of 'survey_page_bloc.dart';

@immutable
abstract class SurveyPageEvent extends Equatable{
  const SurveyPageEvent();

  @override
  List<Object> get props => [];
}

class SurveyAddDataEvent extends SurveyPageEvent {
  const SurveyAddDataEvent(this.isPregnant, this.isPlanningPregnancy, this.isHaveBaby, this.isUpdate);
final bool isUpdate;
  final bool isPregnant;
  final bool isPlanningPregnancy;
  final bool isHaveBaby;


  @override
  List<Object> get props => [];
}

class SurveyAddDataBabyEvent extends SurveyPageEvent {
   SurveyAddDataBabyEvent({this.isUpdate =false});
   bool isUpdate;



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
  const SurveyInitEvent({this.isUpdate = false});
  final bool isUpdate;



  @override
  List<Object> get props => [];
}

class SurveyDisposeEvent extends SurveyPageEvent {
  const SurveyDisposeEvent();



  @override
  List<Object> get props => [];
}

class SurveyChoice extends SurveyPageEvent {
  const SurveyChoice(this.choice);

  final int choice;


  @override
  List<Object> get props => [];
}



