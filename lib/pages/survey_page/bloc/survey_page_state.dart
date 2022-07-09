part of 'survey_page_bloc.dart';

class SurveyPageState with FormzMixin {
  final UserModelFirebase? user;
  final int page;
  final MandatoryFieldValidator name;
  final MandatoryFieldValidator date;
  final FormzStatus submitStatus;
  final String? errorMessage;

  SurveyPageState(
      {this.user,
        this.page = 3,
        this.name = const MandatoryFieldValidator.pure(),
        this.date = const MandatoryFieldValidator.pure(),
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  SurveyPageState copyWith(
      {FormzStatus? submitStatus,
        MandatoryFieldValidator? name,
        MandatoryFieldValidator? date,
        UserModelFirebase? user,
        int? page,
        String? errorMessage}) {
    return SurveyPageState(
        submitStatus: submitStatus ?? this.submitStatus,
        name: name ?? this.name,
        date: date ?? this.date,
        user: user ?? this.user,
        page: page ?? this.page,
        errorMessage: errorMessage);
  }


  @override
  // TODO: implement inputs
  List<FormzInput> get inputs =>[name,date];
}

class SurveyPageInitial extends SurveyPageState {}