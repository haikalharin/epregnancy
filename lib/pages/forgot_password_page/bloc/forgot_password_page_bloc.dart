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
import '../../../utils/string_constans.dart';

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
    } else if (event is ForgotPasswordNewPasswordSubmitted) {
      yield* _mapForgotPasswordNewPasswordSubmittedToState(event, state);
    } else if (event is EmailChangedEvent) {
      yield _mapEmailChangedEventToState(event, state);
    } else if (event is ChangeNewPasswordChangedEvent) {
      yield _mapNewChangedEventToState(event, state);
    } else if (event is ChangeConfirmNewPasswordChangedEvent) {
      yield _mapConfirmNewPasswordChangedEventToState(event, state);
    } else if (event is ForgotPasswordInitEvent) {
      yield _mapForgotPasswordInitEventToState(event, state);
    }
  }

  ForgotPasswordPageState _mapForgotPasswordInitEventToState(
      ForgotPasswordInitEvent event, ForgotPasswordPageState state) {
    return state.copyWith(
        submitStatus: FormzStatus.pure,
        userName: const MandatoryFieldValidator.pure(),
        newPassword: const PasswordValidator.pure(),
        confirmPassword: const ConfirmPasswordValidator.pure(''));

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

  ForgotPasswordPageState _mapNewChangedEventToState(
    ChangeNewPasswordChangedEvent event,
    ForgotPasswordPageState state,
  ) {
    final newPassword = PasswordValidator.dirty(event.newPassword);
    return state.copyWith(
      newPassword: newPassword,
    );
  }

  ForgotPasswordPageState _mapConfirmNewPasswordChangedEventToState(
    ChangeConfirmNewPasswordChangedEvent event,
    ForgotPasswordPageState state,
  ) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
        state.newPassword.value, event.confirmPassword);
    return state.copyWith(
      confirmPassword: confirmPassword,
    );
  }

  Stream<ForgotPasswordPageState> _mapForgotPasswordSubmittedToState(
    ForgotPasswordSubmitted event,
    ForgotPasswordPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var typeMessage = "";
      var type = "";
      if (state.userName.value.contains('@')) {
        typeMessage = "Email";
        type = "email";
      } else {
        typeMessage = "Nomor";
        type = "mobile";
      }
      if (state.status.isValidated) {
        ResponseModel response =
            await userRepository.checkUserExist(state.userName.value,type);

        if (response.code == 200) {
          if (response.message == StringConstant.mobileActive ||
              response.message == StringConstant.emailActive) {
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: 'checkUserExist',
                typeMessage: typeMessage);
          }else{
            yield state.copyWith(
                submitStatus: FormzStatus.submissionFailure,
                typeEvent: 'checkUserExist',
                typeMessage: typeMessage);
          }
        } else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionFailure,
              typeEvent: 'checkUserExist',
              typeMessage: typeMessage);
        }
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            typeEvent: 'checkUserExist',
            typeMessage: typeMessage);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<ForgotPasswordPageState> _mapForgotPasswordNewPasswordSubmittedToState(
    ForgotPasswordNewPasswordSubmitted event,
    ForgotPasswordPageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var typeMessage = "";
      var type = "";
      if (state.userName.value.contains('@')) {
        typeMessage = "Email";
        type = "email";
      } else {
        typeMessage = "Nomor";
        type = "mobile";
      }
      if (state.status.isValidated) {
        var data = {
          'type': type,
          'value': state.userName.value,
          'otp': event.otp,
          'new_password': state.newPassword.value
        };
        ResponseModel response = await userRepository.forgotPassword(data);

        if (response.code == 200) {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              typeEvent: 'submitNewPaassword',
              typeMessage: typeMessage);
        } else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionFailure,
              typeEvent: 'submitNewPaassword',
              typeMessage: typeMessage);
        }
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            typeEvent: 'submitNewPaassword',
            typeMessage: typeMessage);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }
}
