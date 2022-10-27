import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/validators/confirmPassword_validator.dart';
import '../../../common/validators/password_validator.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this.userRepository) : super(ChangePasswordInitial());
  final UserRepository userRepository;

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is ChangePasswordSubmitted) {
      yield* _mapChangePasswordSubmittedToState(event, state);
    } else if (event is ChangeCurrentPasswordChanged) {
      yield _mapChangeCurrentPasswordChanged(event, state);
    } else if (event is ChangeNewPasswordChanged) {
      yield _mapChangePasswordChangedToState(event, state);
    } else if (event is ChangeConfirmNewPasswordChanged) {
      yield _mapChangeConfirmPasswordChangedToState(event, state);
    } else if (event is ChangeInitEvent) {
      yield _mapChangeInitEventToState(event, state);
    }
  }

  ChangePasswordState _mapChangeInitEventToState(
      ChangeInitEvent event, ChangePasswordState state) {
    return ChangePasswordState();
  }

  ChangePasswordState _mapChangeCurrentPasswordChanged(
    ChangeCurrentPasswordChanged event,
    ChangePasswordState state,
  ) {
    final currentPassword = PasswordValidator.dirty(event.currentPassword);
    return state.copyWith(
      currentPassword: currentPassword,
    );
  }

  ChangePasswordState _mapChangePasswordChangedToState(
    ChangeNewPasswordChanged event,
    ChangePasswordState state,
  ) {
    final newPassword = PasswordValidator.dirty(event.newPassword);
    return state.copyWith(
      newPassword: newPassword,
    );
  }

  ChangePasswordState _mapChangeConfirmPasswordChangedToState(
    ChangeConfirmNewPasswordChanged event,
    ChangePasswordState state,
  ) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
        state.newPassword.value, event.confirmPassword);
    return state.copyWith(confirmPassword: confirmPassword);
  }

  Stream<ChangePasswordState> _mapChangePasswordSubmittedToState(
    ChangePasswordSubmitted event,
    ChangePasswordState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      ResponseModel response = await userRepository.changePassword(state.currentPassword.value,state.newPassword.value);

      if(response.code == 200){
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, type: 'change-password-success');
      } else{
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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

//

}
