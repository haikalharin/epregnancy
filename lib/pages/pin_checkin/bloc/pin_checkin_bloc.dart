import 'dart:async';

import 'package:PregnancyApp/common/configurations/configurations.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
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
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'pin_checkin_event.dart';

part 'pin_checkin_state.dart';

class PinCheckInBloc extends Bloc<PinCheckInEvent, PinCheckInState> {
  PinCheckInBloc(this.userRepository) : super(PinCheckInStateInitial());

  final UserRepository userRepository;

  @override
  Stream<PinCheckInState> mapEventToState(PinCheckInEvent event) async* {
    if (event is PinSubmitted) {
      yield* _mapPinCheckInEventToState(event, state);
    }
  }

  Stream<PinCheckInState> _mapPinCheckInEventToState(
      PinSubmitted event,
      PinCheckInState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      HospitalModel? hospitalModel = await AppSharedPreference.getHospital();
      ResponseModel response = await userRepository.checkInWithPin(hospitalModel.id!, event.pin!);
      if (response.code == 200) {
        yield state.copyWith(
          submitStatus: FormzStatus.submissionSuccess,isGetPoint: response.data['is_get_point']);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on OtpErrorException catch (e) {
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
