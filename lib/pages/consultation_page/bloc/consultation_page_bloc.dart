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
    UserModel userModel = _userModel.copyWith(
      imageUrl: _userModel.imageUrl != null || !_userModel.imageUrl!.contains("http")? await aesDecryptor(_userModel.imageUrl) : _userModel.imageUrl,
    );

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
          imageUrl: consultation.user?.imageUrl != null
              ? await aesDecryptor(consultation.user?.imageUrl)
              : null,
          // email: await aesDecryptor(consultation.user?.email),
          // mobile: await aesDecryptor(consultation.user?.mobile),
        );

        ConsultationModel consultationModel = consultation.copyWith(
          id: await aesDecryptor(consultation.id),
          imageUrl: consultation.imageUrl != null ? await aesDecryptor(consultation.imageUrl) : null,
          userId: await aesDecryptor(consultation.userId),
          user: user,
        );
        consultations.add(consultationModel);
      }

      if (consultations.isNotEmpty) {
        yield state.copyWith(
            listConsultation: consultations,
            submitStatus: FormzStatus.submissionSuccess,
            userModel: userModel);
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure, userModel: userModel);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, userModel: userModel);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, userModel: userModel);
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
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
