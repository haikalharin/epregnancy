import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/consultation_model/consultation_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'profile_page_event.dart';

part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc(this.userRepository) : super(ProfilePageInitial());
  final UserRepository userRepository;

  @override
  Stream<ProfilePageState> mapEventToState(ProfilePageEvent event) async* {
    if (event is ChangePhotoProfileEvent) {
      yield* _mapChangePhotoProfileEventToState(event, state);
    } else if (event is InitialProfileEvent) {
      yield* _mapInitialProfileEventToState(event, state);
    }
  }

  Stream<ProfilePageState> _mapInitialProfileEventToState(
    InitialProfileEvent event,
    ProfilePageState state,
  ) async* {
    var user = await AppSharedPreference.getUser();
    yield ProfilePageState(user: user);
  }

  Stream<ProfilePageState> _mapChangePhotoProfileEventToState(
    ChangePhotoProfileEvent event,
    ProfilePageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress, type: "updateProfile");
    try {
      var user = await AppSharedPreference.getUser();
      Uint8List byte = await File(event.path).readAsBytes();
      String imgBase64 = base64.encode(byte);
      var image = "data:image/png;base64,$imgBase64";

      ResponseModel response =
          await userRepository.changePhotoProfile(user.id ?? "", image);

      if (response.code == 200) {
        await AppSharedPreference.setUser(response.data);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, user: response.data,type: "changePhoto");
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
