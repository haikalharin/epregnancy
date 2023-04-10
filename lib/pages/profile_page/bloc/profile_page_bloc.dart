import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/baby_model_api/baby_Model_api.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/baby_model/new_baby_model.dart';
import '../../../data/model/biodata_model/biodata_response.dart';
import '../../../data/model/consultation_model/consultation_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/secure.dart';

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
    } else if (event is BiodataViewEvent) {
      yield* _mapBiodataViewEvent(event, state);
    }
  }

  Stream<ProfilePageState> _mapInitialProfileEventToState(
    InitialProfileEvent event,
    ProfilePageState state,
  ) async* {
    var _user = await AppSharedPreference.getUser();
    NewBabyModel myBaby = await AppSharedPreference.getBabyDataNew();
    var pregnancyAgeWeek = 0;
    var pregnancyAgeDay = 0;
    if (myBaby.baby?.id != null || myBaby.baby?.id != '') {
      pregnancyAgeWeek = myBaby.baby?.pregnancyAgeWeek??0;
      pregnancyAgeDay = myBaby.baby?.pregnancyAgeDay??0;
    }
    yield ProfilePageState(
        user: _user, baby: myBaby, ageBabyInWeeks: pregnancyAgeWeek, ageBabyInDay: pregnancyAgeDay);
  }

  Stream<ProfilePageState> _mapBiodataViewEvent(
      BiodataViewEvent event,
      ProfilePageState state,
      ) async* {
    yield ProfilePageState(submitStatus: FormzStatus.submissionInProgress);
    var _user = await AppSharedPreference.getUserWithoutDecrypt();
    var user = await AppSharedPreference.getUser();
    NewBabyModel myBaby = await AppSharedPreference.getBabyDataNew();
    var pregnancyAgeWeek = 0;
    var pregnancyAgeDay = 0;
    if (myBaby.baby?.id != null || myBaby.baby?.id != '') {
      pregnancyAgeWeek = myBaby.baby?.pregnancyAgeWeek ?? 0;
      pregnancyAgeDay = myBaby.baby?.pregnancyAgeDay ?? 0;
    }

    ResponseModel response = await userRepository.biodataView(event.password);
    if(response.code == 200){
      BiodataResponse biodataResponse = response.data;
      var _updateUser = _user.copyWith(lastBiodataView: biodataResponse.lastBiodataView.toString());
      await AppSharedPreference.setUser(_updateUser);
      yield ProfilePageState(user: user, baby: myBaby, ageBabyInWeeks: pregnancyAgeWeek, ageBabyInDay: pregnancyAgeDay, submitStatus: FormzStatus.submissionSuccess);
    } else {
      yield ProfilePageState(user: user, baby: myBaby, ageBabyInWeeks: pregnancyAgeWeek, ageBabyInDay: pregnancyAgeDay, errorMessage: response.message, submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<ProfilePageState> _mapChangePhotoProfileEventToState(
    ChangePhotoProfileEvent event,
    ProfilePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, type: "updateProfile");
    try {
      var user = await AppSharedPreference.getUser();
      Uint8List byte = await File(event.path).readAsBytes();
      String imgBase64 = base64.encode(byte);
      var image = "data:image/png;base64,$imgBase64";

      ResponseModel response = await userRepository.changePhotoProfile(user.id ?? "", image);

      if (response.code == 200) {
        UserModel _userModel = response.data;
        ResponseModel<UserModel> userGetInfo = await userRepository.getUserInfo();
        await AppSharedPreference.setUser(userGetInfo.data);
        UserModel userFromSession = await AppSharedPreference.getUser();

        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            user: userFromSession,
            type: "changePhoto");
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
