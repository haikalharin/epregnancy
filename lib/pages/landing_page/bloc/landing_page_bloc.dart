import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/model/otp_model/otp_model.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc(this.userRepository) : super(LandingPageInitial());

  final UserRepository userRepository;

  @override
  Stream<LandingPageState> mapEventToState(LandingPageEvent event) async* {
    if (event is LoginRequest) {
      yield* _mapLoginRequestToState(event, state);
    }
  }

  Stream<LandingPageState> _mapLoginRequestToState(
      LoginRequest event,
      LandingPageState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel? userRegister = await AppSharedPreference.getUserRegister();
      if(userRegister.id != null){
        UserModel? user = await AppSharedPreference.getUserRegister();
        await AppSharedPreference.setUser(user);
        await AppSharedPreference.remove("_userRegister");
        UserModel? userLogin = await AppSharedPreference.getUser();
        if(userLogin.id != null){
          yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
        }
      } else{
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }

    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }


}

