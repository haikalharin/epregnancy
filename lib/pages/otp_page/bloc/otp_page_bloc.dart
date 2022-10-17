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

import '../../../common/exceptions/otp_error_exception.dart';
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
      if(Configurations.mode == StringConstant.prod) {
        bool isActive = false;
        ResponseModel response =
        await userRepository.verifyOtp(
            OtpModel(otp: event.otp, type: otpModel.type,value: otpModel.value));

        if (response.code == 200) {

            await AppSharedPreference.setString(
                AppSharedPreference.token, userModel.token ?? '');
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                userInfo: response.data,);
        } else {
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
        }
      } else{
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            userInfo:userModel);
      }
    } on OtpErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
