import 'dart:async';

import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/consultation_repository/consultation_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/article_model/article_model.dart';

part 'consultation_page_event.dart';
part 'consultation_page_state.dart';

class ConsultationPageBloc extends Bloc<ConsultationPageEvent, ConsultationPageState> {
  ConsultationPageBloc(this.consultationRepository) : super(ConsultationPageInitial());
  final ConsultationRepository consultationRepository;
  @override
  Stream<ConsultationPageState> mapEventToState(ConsultationPageEvent event) async* {
    if (event is ConsultationFetchEvent) {
      yield* _mapConsultationFetchEventToState(event, state);
    }
  }

  Stream<ConsultationPageState> _mapConsultationFetchEventToState(
      ConsultationFetchEvent event,
      ConsultationPageState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      if(state.status.isValidated) {
        final responseModel =
        await consultationRepository.fetchListConsultation();
        List<ConsultationModel> listConsultation = responseModel.data??[];
        if (listConsultation.isNotEmpty) {
          yield state.copyWith(
              listConsultation: listConsultation, submitStatus: FormzStatus.submissionSuccess);
        }
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
//

}
