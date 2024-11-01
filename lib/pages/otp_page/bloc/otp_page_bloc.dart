import 'dart:async';

import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/otp_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'otp_page_event.dart';

part 'otp_page_state.dart';

class OtpPageBloc extends Bloc<OtpPageEvent, OtpPageState> {
  OtpPageBloc(this.userRepository) : super(OtpPageInitial());

  final UserRepository userRepository;

  @override
  Stream<OtpPageState> mapEventToState(OtpPageEvent event) async* {
    if (event is OtpNumberChanged) {
      yield* _mapOtpPageEventToState(event, state);
    } else if (event is RequestResendOtp) {
      yield* _mapResendOtp(event, state);
    }
  }

  Stream<OtpPageState> _mapResendOtp(
    RequestResendOtp event,
    OtpPageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, typeEvent: "sendOtp");
    try {
      var type = '';
      if (event.userId!.contains('@')) {
        type = 'email';
      } else {
        type = 'mobile';
      }
      var data = {
        'type': type,
        'value': event.userId,
      };
      ResponseModel response = await userRepository.requestOtp(data);
      OtpModel otpModel = OtpModel(otp: "", type: type, value: event.userId);
      if (response.code == 200) {
        await AppSharedPreference.setOtp(otpModel);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            otpResendSuccess: true);
      } else {
        OtpModel responseData = response.data;
        var lastTimeSendOtp = responseData.createdDate;

        var time = 0;
        if (lastTimeSendOtp != null) {
          DateTime lastDate = DateTime.parse(lastTimeSendOtp);
          DateTime lastDateAfterAdd = lastDate.add(const Duration(hours: 1));
          int differentTime =
              lastDateAfterAdd.difference(DateTime.now()).inSeconds;
          if (differentTime > 0) {
            time = differentTime;
          }
        }

        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            otpResendSuccess: false,
            differentTime: time,
            errorMessage: response.message);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<OtpPageState> _mapOtpPageEventToState(
    OtpNumberChanged event,
    OtpPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModel? userModel = await AppSharedPreference.getUserRegister();
      OtpModel? otpModel = await AppSharedPreference.getOtp();

      bool isActive = false;
      ResponseModel response = await userRepository.verifyOtp(
          OtpModel(otp: event.otp, type: otpModel.type, value: otpModel.value));
      if (response.code == 200) {
        // await AppSharedPreference.setUser(response.data);
        // await AppSharedPreference.setString(
        //     AppSharedPreference.token, userModel.token ?? '');
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            otp: event.otp,
            otpResendSuccess: false);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on OtpErrorException catch (e) {
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
