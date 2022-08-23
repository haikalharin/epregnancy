import 'dart:math';

import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../common/validators/phone_validator.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/validators/confirmPassword_validator.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../common/validators/password_validator.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';
import '../../Signup_page/model/email_address.dart';

part 'signup_questionnaire_event.dart';

part 'signup_questionnaire_state.dart';

class SignUpQuestionnaireBloc
    extends Bloc<SignUpQuestionnaireEvent, SignUpQuestionnaireState> {
  SignUpQuestionnaireBloc(this.userRepository)
      : super(SignUpQuestionnaireInitial());

  final UserRepository userRepository;

  @override
  Stream<SignUpQuestionnaireState> mapEventToState(
      SignUpQuestionnaireEvent event) async* {
    if (event is SignupSubmitted) {
      yield* _mapSignupSubmittedToState(event, state);
    } else if (event is SignupFirstnameChanged) {
      yield _mapSignupFirstnameChangedToState(event, state);
    } else if (event is SignupSecondnameChanged) {
      yield _mapSignupSecondnameChangedToState(event, state);
    } else if (event is SignupPasswordChanged) {
      yield _mapSignupPasswordChangedToState(event, state);
    } else if (event is SignupConfirmPasswordChanged) {
      yield _mapSignupConfirmPasswordChangedToState(event, state);
    } else if (event is SignupDateChanged) {
      yield _mapSignupDateChangedToState(event, state);
    } else if (event is SignupInitEvent) {
      yield _mapSignupInitEventToState(event, state);
    }
  }

  SignUpQuestionnaireState _mapSignupInitEventToState(
      SignupInitEvent event, SignUpQuestionnaireState state) {
    return SignUpQuestionnaireState();
  }

  SignUpQuestionnaireState _mapSignupFirstnameChangedToState(
    SignupFirstnameChanged event,
    SignUpQuestionnaireState state,
  ) {
    final firstName = MandatoryFieldValidator.dirty(event.firstName);
    return state.copyWith(
      firstName: firstName,
      submitStatus: Formz.validate([firstName]),
    );
  }

  SignUpQuestionnaireState _mapSignupSecondnameChangedToState(
    SignupSecondnameChanged event,
    SignUpQuestionnaireState state,
  ) {
    final secondName = MandatoryFieldValidator.dirty(event.secondName);
    return state.copyWith(
      secondName: secondName,
      submitStatus: Formz.validate([secondName]),
    );
  }

  SignUpQuestionnaireState _mapSignupPasswordChangedToState(
    SignupPasswordChanged event,
    SignUpQuestionnaireState state,
  ) {
    final password = PasswordValidator.dirty(event.password);
    return state.copyWith(
      password: password,
      submitStatus: Formz.validate([password]),
    );
  }

  SignUpQuestionnaireState _mapSignupConfirmPasswordChangedToState(
    SignupConfirmPasswordChanged event,
    SignUpQuestionnaireState state,
  ) {
    final confirmPassword = ConfirmPasswordValidator.dirty(
        state.password.value, event.confirmPassword);
    return state.copyWith(
        confirmPassword: confirmPassword,
        submitStatus: Formz.validate([confirmPassword]));
  }

  SignUpQuestionnaireState _mapSignupDateChangedToState(
    SignupDateChanged event,
    SignUpQuestionnaireState state,
  ) {
    final date = MandatoryFieldValidator.dirty(event.date);
    return state.copyWith(
      date: date,
      submitStatus: Formz.validate([date]),
    );
  }

  Stream<SignUpQuestionnaireState> _mapSignupSubmittedToState(
    SignupSubmitted event,
    SignUpQuestionnaireState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      String email = "";
      String phoneNumber = "";
      var userid = await AppSharedPreference.getUsernameRegisterUser();
      if (userid.contains('@')){
        email = userid;
      } else{
        phoneNumber = userid;
      }
      UserModelFirebase userModelFirebase = UserModelFirebase.empty();
      if (state.status.isValidated) {
        final UserModelFirebase userExist =
            await EventUser.checkUserExist(userid);
        final df = DateFormat('yyyyMMdd');
        String timeNow = df.format(new DateTime.now());
        if (userExist.userid!.isEmpty) {
          const _chars =
              'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
          Random _rnd = Random();

          String getRandomString(int length) =>
              String.fromCharCodes(Iterable.generate(length,
                  (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

          String random = getRandomString(28);

          userModelFirebase = UserModelFirebase(
              createdDate: timeNow,
              email: email,
              name: " ${state.firstName.value} ${state.secondName.value}",
              status: StringConstant.inActive,
              uid: random,
              userid: userid,
              mobilePhone: phoneNumber,
              password: state.password.value,
              birthDate: state.date.value);
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              userModelFirebase: userModelFirebase);
        } else {
          userModelFirebase = UserModelFirebase(
              createdDate: timeNow,
              email: userExist.email,
              name: userExist.name,
              status: userExist.status,
              uid: userExist.uid,
              userid: userid,
              mobilePhone: userExist.mobilePhone,
              password: userExist.password,
              birthDate: userExist.birthDate);
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              userModelFirebase: userModelFirebase);
        }
        EventUser.addUser(userModelFirebase);
        await Future.delayed(const Duration(seconds: 2));
        await AppSharedPreference.setUserRegister(userModelFirebase);
        await AppSharedPreference.setUserFirebase(userModelFirebase);
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            firstName: state.firstName,
            secondName: state.secondName,
            password: state.password,
            confirmPassword: state.confirmPassword,
            date: state.date);
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
