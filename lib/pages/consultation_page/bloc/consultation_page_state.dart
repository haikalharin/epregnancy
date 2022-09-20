part of 'consultation_page_bloc.dart';


class ConsultationPageState with FormzMixin {
  final List<ConsultationModel>? listConsultation;
  final ConsultationModel? consultationModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;

  ConsultationPageState(
      {
        this.consultationModel,
        this.listConsultation,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  ConsultationPageState copyWith(
      {FormzStatus? submitStatus,
        ConsultationModel? consultationModel,
        List<ConsultationModel>? listConsultation,
        String? errorMessage}) {
    return ConsultationPageState(
        submitStatus: submitStatus ,
        consultationModel: consultationModel ?? this.consultationModel,
        listConsultation: listConsultation ?? this.listConsultation,
        errorMessage: errorMessage);
  }



  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [];
}

class ConsultationPageInitial extends ConsultationPageState {}
