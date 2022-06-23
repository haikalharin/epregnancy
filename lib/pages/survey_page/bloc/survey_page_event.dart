part of 'survey_page_bloc.dart';

@immutable
abstract class SurveyPageEvent extends Equatable{
  const SurveyPageEvent();

  @override
  List<Object> get props => [];
}

class SurveyAddDataEvent extends SurveyPageEvent {
  const SurveyAddDataEvent(this.condition);

  final String condition;


  @override
  List<Object> get props => [];
}


