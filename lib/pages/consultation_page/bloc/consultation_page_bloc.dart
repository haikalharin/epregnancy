import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:PregnancyApp/common/validators/mandatory_field_validator.dart';
import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/consultation_repository/consultation_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'consultation_page_event.dart';

part 'consultation_page_state.dart';

class ConsultationPageBloc
    extends Bloc<ConsultationPageEvent, ConsultationPageState> {
  ConsultationPageBloc(this.consultationRepository)
      : super(ConsultationPageInitial());
  final ConsultationRepository consultationRepository;

  @override
  Stream<ConsultationPageState> mapEventToState(
      ConsultationPageEvent event) async* {
    if (event is ConsultationFetchEvent) {
      yield* _mapConsultationFetchEventToState(event, state);
    } else if (event is ConsultationImageChanged) {
      yield _mapConsultationImageChangedToState(event, state);
    } else if (event is ConsultationDescriptionChanged) {
      yield _mapConsultationDescriptionChangedToState(event, state);
    } else if (event is ConsultationSubmittedEvent) {
      yield* _mapConsultationSubmittedToState(event, state);
    } else if (event is ConsultationDisposeEvent) {
      yield _mapConsultationDisposeEvent(event, state);
    } else if (event is ConsultationLikeSubmitted) {
      yield* _mapConsultationLikeSubmittedEvent(event, state);
    }
  }

  ConsultationPageState _mapConsultationDisposeEvent(
    ConsultationDisposeEvent event,
    ConsultationPageState state,
  ) {
    return ConsultationPageState(
        listConsultation: state.listConsultation, userModel: state.userModel);
  }

  ConsultationPageState _mapConsultationDescriptionChangedToState(
    ConsultationDescriptionChanged event,
    ConsultationPageState state,
  ) {
    final description = MandatoryFieldValidator.dirty(event.description);
    return state.copyWith(description: description);
  }

  ConsultationPageState _mapConsultationImageChangedToState(
    ConsultationImageChanged event,
    ConsultationPageState state,
  ) {
    return state.copyWith(image: event.image);
  }

  Stream<ConsultationPageState> _mapConsultationFetchEventToState(
    ConsultationFetchEvent event,
    ConsultationPageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, listConsultation: []);

    UserModel _userModel = await AppSharedPreference.getUser();

    try {
      final responseModel =
          await consultationRepository.fetchListConsultation();
      List<ConsultationModel> listConsultation = responseModel.data ?? [];
      List<ConsultationModel> consultations = [];

      for (var consultation in listConsultation) {
        List<Comment> _comments = [];
        // todo comment decrypt entity
        // for(var comment in consultation.comments ?? []){
        //   Comment _comment = comment.copyWith(
        //
        //   );
        // }


        User? user = consultation.user?.copyWith(
          id: await aesDecryptor(consultation.user?.id),
          name: await aesDecryptor(consultation.user?.name),
          // email: await aesDecryptor(consultation.user?.email),
          // mobile: await aesDecryptor(consultation.user?.mobile),
        );

        ConsultationModel consultationModel = consultation.copyWith(
          userId: await aesDecryptor(consultation.userId),
          user: user,
        );
        consultations.add(consultationModel);
      }

      if (consultations.isNotEmpty) {
        yield state.copyWith(
            listConsultation: consultations,
            submitStatus: FormzStatus.submissionSuccess,
            userModel: _userModel);
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure, userModel: _userModel);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, userModel: _userModel);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, userModel: _userModel);
      }
    }
  }

  Stream<ConsultationPageState> _mapConsultationLikeSubmittedEvent(
    ConsultationLikeSubmitted event,
    ConsultationPageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, type: 'like');
    try {
      ResponseModel response =
          await consultationRepository.likeConsultation(event.id, event.isLike);

      if (response.code == 200) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, type: 'like');
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            errorMessage: response.message);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<ConsultationPageState> _mapConsultationSubmittedToState(
    ConsultationSubmittedEvent event,
    ConsultationPageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, type: 'update');
    try {
      var user = await AppSharedPreference.getUser();
      if (state.status.isValidated) {
        String? image;
        if (state.image != null && state.image != "") {
          Uint8List byte = await File(state.image ?? "").readAsBytes();
          String imgBase64 = base64.encode(byte);
          image = "data:image/png;base64,$imgBase64";
        }

        ResponseModel response = await consultationRepository.postConsultation(
            ConsultationModel(
                userId: user.id,
                message: state.description.value,
                imageBase64: image));

        if (response.code == 200) {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess, type: 'update');
        } else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionFailure,
              errorMessage: response.message);
        }
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }
}
