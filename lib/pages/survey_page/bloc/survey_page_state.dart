part of 'survey_page_bloc.dart';

class SurveyPageState with FormzMixin {
  final UserModel? user;
  final BabyModelApi? dataBaby;
  final int page;
  final int choice;
  final MandatoryFieldValidator name;
  final MandatoryFieldValidator date;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  SurveyPageState(
      {this.user,
        this.dataBaby,
        this.page = 3,
        this.choice = 0,
        this.name = const MandatoryFieldValidator.pure(),
        this.date = const MandatoryFieldValidator.pure(),
        this.submitStatus = FormzStatus.pure,
        this.type,
        this.errorMessage
      });

  SurveyPageState copyWith(
      {FormzStatus? submitStatus,
        MandatoryFieldValidator? name,
        MandatoryFieldValidator? date,
        UserModel? user,
        BabyModelApi? dataBaby,
        int? page,
        int? choice,
        String? type,
        String? errorMessage,
      }) {
    return SurveyPageState(
        submitStatus: submitStatus,
        name: name ?? this.name,
        date: date ?? this.date,
        user: user ?? this.user,
        dataBaby: dataBaby ?? this.dataBaby,
        page: page ?? this.page,
        choice: choice ?? this.choice,
        type: type,
        errorMessage: errorMessage,
    );
  }


  @override
  // TODO: implement inputs
  List<FormzInput> get inputs =>[name,date];
}

class SurveyPageInitial extends SurveyPageState {}