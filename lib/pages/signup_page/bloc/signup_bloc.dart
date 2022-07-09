import 'package:PregnancyApp/common/exceptions/login_error_exception.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../common/validators/phone_validator.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';
import '../../login_page/model/email_address.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.userRepository) : super(SignupInitial());

  final UserRepository userRepository;

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginInitEvent){
      yield _mapLoginInitEventToState(event,state);

    }
  }

  SignupState _mapLoginInitEventToState(
      LoginInitEvent event, SignupState state) {
    return SignupState();
  }

  SignupState _mapUsernameChangedToState(
      LoginUsernameChanged event,
      SignupState state,
      ) {
    final userName = EmailAddressUsername.dirty(event.userName);
    return state.copyWith(
      username: userName,
      submitStatus: Formz.validate([userName]),
    );
  }

  Stream<SignupState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    SignupState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      UserModelFirebase userModelFirebase =
          await EventUser.checkUserExist(state.username.value);

      if (state.status.isValidated){
        if (userModelFirebase.uid!.isNotEmpty) {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              userModelFirebase: userModelFirebase,
              isExist: true);
          await AppSharedPreference.getUserRegister();
        } else if (userModelFirebase.uid!.isNotEmpty && userModelFirebase.status == StringConstant.inActive) {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              userModelFirebase: userModelFirebase,
              isExist: true);
          await AppSharedPreference.getUserRegister();
        }else {
          await AppSharedPreference.setEmailRegisterUser(state.username.value);
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              isExist: false);
        }
      } else{
        final username = EmailAddressUsername.dirty(state.username.value);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            username: username);
            }

    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

//

}
