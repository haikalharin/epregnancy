import 'dart:async';

import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/utils/date_formatter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/constants/app_constants.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashScreenInitial());

  @override
  Stream<SplashscreenState> mapEventToState(SplashscreenEvent event) async* {
   if (event is SplashscreenCheckUserExist) {
      yield* _mapSplashScreenCheckUserExistToState(event, state);
    }
  }

  Stream<SplashscreenState> _mapSplashScreenCheckUserExistToState(
      SplashscreenCheckUserExist event,
      SplashscreenState state,
      ) async* {

    final userModelFirebase = await AppSharedPreference.getUserFirebase();
    final String? installDate = await AppSharedPreference.getString(AppConstants.installDateKey);
    installDate == null ? await AppSharedPreference.setString(AppConstants.installDateKey, DateFormatter.dateFormatForCheckinFilter.format(DateTime.now())): null;
    await Future.delayed(      const Duration(seconds: 2));
      if(userModelFirebase.uid != ''){
        final UserRolesModelFirebase role =
        await EventUser.checkRoleExist(userModelFirebase.uid ?? "");
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            isExist: true,
            role: role);
      } else{
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            isExist: false);
      }

  }
}
