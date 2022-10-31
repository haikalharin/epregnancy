import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/baby_model/baby_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/baby_model_api/baby_Model_api.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';

part 'survey_page_event.dart';

part 'survey_page_state.dart';

class SurveyPageBloc extends Bloc<SurveyPageEvent, SurveyPageState> {
  SurveyPageBloc(this.userRepository) : super(SurveyPageInitial());

  final UserRepository userRepository;

  @override
  Stream<SurveyPageState> mapEventToState(SurveyPageEvent event) async* {
    if (event is SurveyAddDataEvent) {
      yield* _mapSurveyAddDataToState(event, state);
    } else if (event is SurveyAddDataBabyEvent) {
      yield* _mapSurveyAddDataBabyToState(event, state);
    } else if (event is SurveyDateChanged) {
      yield _mapSurveyDateChangedToState(event, state);
    } else if (event is SurveyBabysNameChanged) {
      yield _mapSurveyBabysNameChangedToState(event, state);
    } else if (event is SurveyPageChanged) {
      yield _mapSurveyPageChangedToState(event, state);
    } else if (event is SurveyChoice) {
      yield _mapSurveySurveyChoiceToState(event, state);
    } else if (event is SurveyInitEvent) {
      yield* _mapSurveyInitEventToState(event, state);
    } else if (event is SurveyDisposeEvent) {
      yield _mapSurveyDisposeEventToState(event, state);
    }
  }
  SurveyPageState _mapSurveyDisposeEventToState(
      SurveyDisposeEvent event,
      SurveyPageState state,
      ) {
    return SurveyPageState();
  }

  Stream<SurveyPageState> _mapSurveyInitEventToState(
      SurveyInitEvent event, SurveyPageState state) async*{
    var user = await AppSharedPreference.getUserRegister();
     List<dynamic> myBaby= [];
    var choice = 0;
    if(event.isUpdate) {
    user = await AppSharedPreference.getUser();
      ResponseModel response = await userRepository.getBaby(user);
     myBaby = response.data;

      if (user.isPregnant == true) {
        choice = 1;
      } else if (user.isPlanningPregnancy == true) {
        choice = 2;
      } else if (user.isHaveBaby == true) {
        choice = 3;
      }
    }
    yield SurveyPageState(user: user, dataBaby: myBaby.isNotEmpty? myBaby.last:BabyModelApi.empty(), choice: choice);
  }

  SurveyPageState _mapSurveySurveyChoiceToState(
      SurveyChoice event,
      SurveyPageState state,
      ) {
    return state.copyWith(
      choice: event.choice,
    );
  }

  SurveyPageState _mapSurveyPageChangedToState(
    SurveyPageChanged event,
    SurveyPageState state,
  ) {
    return state.copyWith(
      page: event.page,
    );
  }

  SurveyPageState _mapSurveyBabysNameChangedToState(
    SurveyBabysNameChanged event,
    SurveyPageState state,
  ) {
    final name = MandatoryFieldValidator.dirty(event.name);
    return state.copyWith(
      name: name,
    );
  }

  SurveyPageState _mapSurveyDateChangedToState(
    SurveyDateChanged event,
    SurveyPageState state,
  ) {
    final date = MandatoryFieldValidator.dirty(event.date);
    return state.copyWith(
      date: date,
    );
  }

  Stream<SurveyPageState> _mapSurveyAddDataToState(
    SurveyAddDataEvent event,
    SurveyPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel user = await AppSharedPreference.getUserRegister();
      if(event.isUpdate){
       user = await AppSharedPreference.getUser();
      }
      ResponseModel response = await userRepository.updateQuestioner(
          SignupQuestRequest(
              id: user.id?? state.user?.id,
              isPregnant: event.isPregnant,
              isPlanningPregnancy: event.isPlanningPregnancy,
              isHaveBaby: event.isHaveBaby));

      if (response.code == 200) {
        UserModel userModel = response.data;
        await AppSharedPreference.setUserRegister(response.data);
        if(event.isUpdate){
          await AppSharedPreference.setUser(response.data);
        }
        // await AppSharedPreference.setString(AppSharedPreference.token,userModel.token??'');
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: 'submit');

      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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

  Stream<SurveyPageState> _mapSurveyAddDataBabyToState(
    SurveyAddDataBabyEvent event,
    SurveyPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel user = await AppSharedPreference.getUserRegister();
      ResponseModel response = ResponseModel.dataEmpty();
      if(state.dataBaby?.id != ""){
        response =  await userRepository.updateQuestionerBaby(
            BabyModelApi(id: state.dataBaby?.id ,name: state.name.value,lastMenstruationDate: state.date.value
            )
        );
      } else{
        String? userId;
        if(user.id != null) {
          userId = await aesDecryptor(user.id);
        } else {
          userId = state.user?.id;
        }

        response =  await userRepository.saveQuestionerBaby(
            BabyModelApi(userId: userId, name: state.name.value,lastMenstruationDate: state.date.value
            )
        );
      }



      if (response.code == 200) {
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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
