import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
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

  Stream<SurveyPageState> _mapSurveyAddDataToState(SurveyAddDataEvent event,
      SurveyPageState state,) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      final UserModelFirebase user = await userRepository.fetchUser();
      final bool isUpdateActive = await EventUser.updateActiveUser(
          myUid: user.uid, status: 'Active');
      final bool isUpdateCondition = await EventUser.updateConditionUser(
          myUid: user.uid, condition: event.condition);

      if(isUpdateActive && isUpdateCondition){
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