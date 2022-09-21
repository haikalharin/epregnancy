part of 'consultation_page_bloc.dart';


class ConsultationPageState with FormzMixin {
  final List<ConsultationModel>? listConsultation;
  final ConsultationModel? consultationModel;
  final MandatoryFieldValidator description;
  final String? image;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  ConsultationPageState(
      {
        this.consultationModel,
        this.listConsultation,
        this.description = const MandatoryFieldValidator.pure(),
        this.image,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage,
      this.type});

  ConsultationPageState copyWith(
      {FormzStatus? submitStatus,
        ConsultationModel? consultationModel,
        MandatoryFieldValidator? description,
        String? image,
        List<ConsultationModel>? listConsultation,
        String? errorMessage,
      String? type}) {
    return ConsultationPageState(
        submitStatus: submitStatus ,
        consultationModel: consultationModel ?? this.consultationModel,
        listConsultation: listConsultation ?? this.listConsultation,
        description: description ?? this.description,
        image: image ?? this.image,
        type: type,
        errorMessage: errorMessage);
  }



  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [description];
}

class ConsultationPageInitial extends ConsultationPageState {}
