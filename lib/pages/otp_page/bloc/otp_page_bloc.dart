import 'dart:async';

import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/otp_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/repository/user_repository/user_repository.dart';

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
    try{
      // ResponseModel response = await userRepository

    }on OtpErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

}
