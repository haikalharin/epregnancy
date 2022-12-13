import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/validators/confirmPassword_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../common/validators/password_validator.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'forgot_password_page_event.dart';

part 'forgot_password_page_state.dart';

class ForgotPasswordPageBloc
    extends Bloc<ForgotPasswordPageEvent, ForgotPasswordPageState> {
  ForgotPasswordPageBloc(this.userRepository)
      : super(ForgotPasswordPageInitial());

  final UserRepository userRepository;

  @override
  Stream<ForgotPasswordPageState> mapEventToState(
      ForgotPasswordPageEvent event) async* {
    if (event is ForgotPasswordSubmitted) {
      yield* _mapForgotPasswordSubmittedToState(event, state);
    } else if (event is EmailChangedEvent) {
      yield _mapEmailChangedEventToState(event, state);
    } else if (event is ChangeNewPasswordChanged) {
    } else if (event is ChangeConfirmNewPasswordChanged) {
    } else if (event is ForgotPasswordInitEvent) {
      yield _mapForgotPasswordInitEventToState(event, state);
    }
  }

  ForgotPasswordPageState _mapForgotPasswordInitEventToState(
      ForgotPasswordInitEvent event, ForgotPasswordPageState state) {
    return ForgotPasswordPageState();
  }

  ForgotPasswordPageState _mapEmailChangedEventToState(
      EmailChangedEvent event,
      ForgotPasswordPageState state,
      ) {
    final userName = MandatoryFieldValidator.dirty(event.userName);
    return state.copyWith(
      userName: userName,
    );
  }

  Stream<ForgotPasswordPageState> _mapForgotPasswordSubmittedToState(
      ForgotPasswordSubmitted event,
      ForgotPasswordPageState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var typeMessage = "";
      if (state.userName.value.contains('@')) {
        typeMessage = "Email";
      } else {
        typeMessage = "Nomor";
      }
      if(state.status.isValidated) {

        ResponseModel response = await userRepository.forgotPassword(
            state.userName.value);

        if (response.code == 200) {
          yield state.copyWith(submitStatus: FormzStatus.submissionSuccess,typeMessage: typeMessage);
        } else {
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure, typeMessage: typeMessage);
        }
      } else{
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, typeMessage: typeMessage );
      }

    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

}
