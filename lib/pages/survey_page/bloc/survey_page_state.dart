part of 'survey_page_bloc.dart';

class SurveyPageState {
  final UserModelFirebase? user;
  final FormzStatus status;
  final String? errorMessage;

  SurveyPageState(
      {this.user,
        this.status = FormzStatus.pure,
        this.errorMessage});

  SurveyPageState copyWith(
      {FormzStatus? status,
        UserModelFirebase? user,
        String? errorMessage}) {
    return SurveyPageState(
        status: status ?? this.status,
        user: user ?? this.user,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class SurveyPageInitial extends SurveyPageState {}