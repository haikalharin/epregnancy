import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../data/model/baby_model/new_baby_model.dart' as newBaby;
import '../../../data/model/baby_model_api/baby_Model_api.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

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

  SurveyPageState _mapSurveyDisposeEventToState(SurveyDisposeEvent event,
      SurveyPageState state,) {
    return SurveyPageState();
  }

  Stream<SurveyPageState> _mapSurveyInitEventToState(SurveyInitEvent event,
      SurveyPageState state) async* {
    try {
      var user = await AppSharedPreference.getUser();
      newBaby.NewBabyModel myBaby = const newBaby.NewBabyModel();
      var choice = 0;
      ResponseModel response = await userRepository.getBaby(user);
      myBaby =
      response.data != null ? response.data : const newBaby.NewBabyModel();
      if (event.isUpdate && response.data != null) {
        // user = await AppSharedPreference.getUser();

        if (user.isPregnant == true) {
          choice = 1;
        } else if (user.isPlanningPregnancy == true) {
          choice = 2;
        } else if (user.isHaveBaby == true) {
          choice = 3;
        }
      }
      if (response.code == 200) {
        if (event.isUpdate && response.data != null) {
          yield SurveyPageState(
              submitStatus: FormzStatus.submissionSuccess,
              type: 'init-data-survey',
              user: user,
              page: 1,
              date: MandatoryFieldValidator.dirty(
                  myBaby.baby!.lastMenstruationDate!),
              dataBaby:
              myBaby.baby != null ? myBaby : const newBaby.NewBabyModel(),
              choice: choice);
        } else {
          yield SurveyPageState(
              submitStatus: FormzStatus.submissionSuccess,
              type: 'init-data-survey',
              user: user,
              page: 1,
              choice: choice);
        }
      } else {
        yield SurveyPageState(
            submitStatus: FormzStatus.submissionSuccess,
            type: 'init-data-survey',
            user: user,
            page: 1,
            choice: choice);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  SurveyPageState _mapSurveySurveyChoiceToState(SurveyChoice event,
      SurveyPageState state,) {
    return state.copyWith(
      choice: event.choice,
    );
  }

  SurveyPageState _mapSurveyPageChangedToState(SurveyPageChanged event,
      SurveyPageState state,) {
    return state.copyWith(
      page: event.page,
    );
  }

  SurveyPageState _mapSurveyBabysNameChangedToState(
      SurveyBabysNameChanged event,
      SurveyPageState state,) {
    final name = MandatoryFieldValidator.dirty(event.name);
    return state.copyWith(
      name: name,
    );
  }

  SurveyPageState _mapSurveyDateChangedToState(SurveyDateChanged event,
      SurveyPageState state,) {
    final date = MandatoryFieldValidator.dirty(event.date);
    return state.copyWith(
      date: date,
    );
  }

  Stream<SurveyPageState> _mapSurveyAddDataToState(SurveyAddDataEvent event,
      SurveyPageState state,) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      // UserModel user = await AppSharedPreference.getUserRegister();
      UserModel user = await AppSharedPreference.getUser();
      ResponseModel responseBaby = await userRepository.getBaby(user);
      newBaby.NewBabyModel myBaby = responseBaby.data ??
          const newBaby.NewBabyModel();

      if (event.isUpdate && myBaby != null) {
        user = await AppSharedPreference.getUser();
      }
      ResponseModel response = await userRepository.updateQuestioner(
          SignupQuestRequest(
              id: user.id ?? state.user?.id,
              isPregnant: event.isPregnant,
              isPlanningPregnancy: event.isPlanningPregnancy,
              isHaveBaby: event.isHaveBaby));

      if (response.code == 200) {
        UserModel userModel = response.data;
        // await AppSharedPreference.setUserRegister(response.data);
        if (event.isUpdate) {
          await AppSharedPreference.setUser(response.data);
        }
        // await AppSharedPreference.setString(AppSharedPreference.token,userModel.token??'');
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, type: 'submit');
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
      SurveyPageState state,) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel user = event.isUpdate == false
          ? await AppSharedPreference.getUser()
          : await AppSharedPreference.getUser();
      ResponseModel response = ResponseModel.dataEmpty();
      if (state.dataBaby?.baby != null) {
        response = await userRepository.updateQuestionerBaby(BabyModelApi(
            id: state.dataBaby?.baby?.id,
            name: state.name.value,
            lastMenstruationDate: state.date.value));
      } else {
        String? userId = user.id;
        // if (user.id != null) {
        //   userId = state.user?.id;
        // } else {
        //   userId = state.user?.id;
        // }

        response = await userRepository.saveQuestionerBaby(BabyModelApi(
            userId: userId,
            name: state.name.value,
            lastMenstruationDate: state.date.value));
      }

      if (response.code == 200) {
        if (event.isUpdate) {
          await AppSharedPreference.setBabyDataNew(newBaby.NewBabyModel(
              baby: newBaby.Baby(
                  userId: user.id,
                  id: state.dataBaby?.baby?.id,
                  name: state.name.value,
                  status: state.dataBaby?.baby?.status,
                  lastMenstruationDate: state.date.value)));
        }
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, type: 'submitBaby');
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
