import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/baby_model/baby_model.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../data/firebase/event/event_user.dart';
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
    } else if (event is SurveyInitEvent) {
      yield _mapSurveyInitEventToState(event, state);
    }
  }

  SurveyPageState _mapSurveyInitEventToState(
      SurveyInitEvent event, SurveyPageState state) {
    return SurveyPageState();
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
      final UserModelFirebase user = await userRepository.fetchUser();
      bool isUpdateCondition = false;

      final UserRolesModelFirebase role =
          await EventUser.checkRoleExist(user.uid!);
      UserRolesModelFirebase? userRolesModelFirebase;
      final df = DateFormat('yyyyMMdd');
      String timeNow = df.format(new DateTime.now());
      if (role.uid!.isNotEmpty) {
        userRolesModelFirebase = UserRolesModelFirebase(
            condition: event.condition,
            createdDate: timeNow,
            role: role.role,
            uid: role.uid,
            userid: user.uid);
        isUpdateCondition =
            await EventUser.updateConditionUser(data: userRolesModelFirebase);
      } else {
        const _chars =
            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        Random _rnd = Random();

        String getRandomString(int length) =>
            String.fromCharCodes(Iterable.generate(
                length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
        String random = getRandomString(20);
        userRolesModelFirebase = UserRolesModelFirebase(
            condition: event.condition,
            createdDate: timeNow,
            role: "PATIENT",
            uid: random,
            userid: user.uid);
        isUpdateCondition =
            await EventUser.addConditionUser(data: userRolesModelFirebase);
      }

      if (isUpdateCondition) {
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
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
      final UserModelFirebase user = await userRepository.fetchUser();
      final bool isUpdateActive =
      await EventUser.updateActiveUser(myUid: user.uid, status: StringConstant.active);
      bool isUpdateCondition = false;

      final BabyModel baby = await EventUser.checkBabyExist(user.uid!);
      BabyModel? babyModel;
      final df = DateFormat('yyyyMMdd');
      String timeNow = df.format(new DateTime.now());
      if (baby.babyProfileid!.isNotEmpty) {
        babyModel = BabyModel(
          babyDOB: baby.babyDOB,
          babyName:state.name.value,
          babyProfileid: baby.babyProfileid,
          createdDate: timeNow,
          gender: baby.gender,
          lastMenstruationDate: state.date.value,
          userUid: baby.userUid,
          userid: baby.userid,
        );
        isUpdateCondition =
            await EventUser.addBabyUser(data: babyModel);
      } else {
        const _chars =
            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        Random _rnd = Random();

        String getRandomString(int length) =>
            String.fromCharCodes(Iterable.generate(
                length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
        String random = getRandomString(20);
        babyModel = BabyModel(
          babyDOB: "",
          babyName: state.name.value,
          babyProfileid: random,
          createdDate: timeNow,
          gender: "",
          lastMenstruationDate: state.date.value,
          userUid: user.uid,
          userid: user.userid,
        );
        isUpdateCondition =
            await EventUser.addBabyUser(data: babyModel);
      }

      if (isUpdateActive && isUpdateCondition) {
        AppSharedPreference.remove("_userRegister");
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
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
