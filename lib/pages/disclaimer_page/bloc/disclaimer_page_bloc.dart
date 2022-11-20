import 'dart:async';

import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/user_model_api/signup_quest_request.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/article_repository/article_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'disclaimer_page_event.dart';

part 'disclaimer_page_state.dart';

class DisclaimerPageBloc
    extends Bloc<DisclaimerPageEvent, DisclaimerPageState> {
  DisclaimerPageBloc(this.userRepository) : super(DisclaimerPageInitial());

  final UserRepository userRepository;

  @override
  Stream<DisclaimerPageState> mapEventToState(
      DisclaimerPageEvent event) async* {
    if (event is DisclaimerAddDataEvent) {
      yield* _mapDisclaimerAddDataEventEventToState(event, state);
    }
  }

  Stream<DisclaimerPageState> _mapDisclaimerAddDataEventEventToState(
    DisclaimerAddDataEvent event,
    DisclaimerPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel user = await AppSharedPreference.getUser();

      ResponseModel response = await userRepository
          .updateDisclaimer(UserModel(id: user.id ?? "", isAgree: true));

      if (response.code == 200) {
        UserModel userModel = response.data;
        await AppSharedPreference.setUserRegister(response.data);
        // await AppSharedPreference.setString(AppSharedPreference.token,userModel.token??'');
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, userModel: user, type: 'submit');
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
}
