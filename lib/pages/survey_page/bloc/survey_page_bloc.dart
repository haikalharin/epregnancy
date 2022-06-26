import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/pages/chat_page/event/event_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/repository/user_repository/user_repository.dart';

part 'survey_page_event.dart';

part 'survey_page_state.dart';

class SurveyPageBloc extends Bloc<SurveyPageEvent, SurveyPageState> {
  SurveyPageBloc(this.userRepository) : super(SurveyPageInitial());

  final UserRepository userRepository;

  @override
  Stream<SurveyPageState> mapEventToState(SurveyPageEvent event) async* {
    if (event is SurveyAddDataEvent) {
      yield* _mapSurveyAddDataToState(event, state);
    }
  }

  Stream<SurveyPageState> _mapSurveyAddDataToState(
    SurveyAddDataEvent event,
    SurveyPageState state,
  ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      final UserModelFirebase user = await userRepository.fetchUser();
      final bool isUpdateActive =
          await EventUser.updateActiveUser(myUid: user.uid, status: 'Active');
      bool isUpdateCondition= false;

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
        const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        Random _rnd = Random();

        String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
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

      if (isUpdateActive && isUpdateCondition) {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
//

}
