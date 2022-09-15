import 'dart:async';

import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
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
      String? otp = await AppSharedPreference.getString(AppSharedPreference.otp);
      UserModel? userModel = await AppSharedPreference.getUserRegister();
      bool isActive = false;
      ResponseModel response =
          await userRepository.loginOtp(OtpModel(otp: event.otp,email: userModel.email));

      if (response.code == 200) {
        if(otp == event.otp) {
          await AppSharedPreference.setUser(response.data);
          await AppSharedPreference.setString(AppSharedPreference.token,userModel.token??'');
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              userInfo: response.data,
              isActive: isActive);
        } else{
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
        }
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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
