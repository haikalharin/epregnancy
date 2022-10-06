import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/login_error_exception.dart';
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
    if (event is LoginRequestOtp) {
      yield* _mapLoginRequestOtpToState(event, state);
    }
  }

  Stream<LandingPageState> _mapLoginRequestOtpToState(
      LoginRequestOtp event,
      LandingPageState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      // UserModel user = await AppSharedPreference.getUserRegister();
      // ResponseModel response = await userRepository
      //     .requestOtp(OtpModel(email:user.email));
      // OtpModel otpModel = response.data;
      // if (response.code == 200) {
      //   await AppSharedPreference.setString(
      //       AppSharedPreference.otp, otpModel.otp ?? '');
      //   yield state.copyWith(
      //       submitStatus: FormzStatus.submissionSuccess);
      // } else {
      //   yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      // }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }


}

