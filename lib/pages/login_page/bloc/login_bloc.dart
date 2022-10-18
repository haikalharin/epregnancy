import 'dart:async';

import 'package:PregnancyApp/data/model/login_model/login_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../common/exceptions/login_error_exception.dart';
import '../../../../common/validators/phone_validator.dart';
import '../../../../data/firebase/event/event_person_example.dart';
import '../../../../data/firebase/g_authentication.dart';
import '../../../../data/model/person_model/person_model.dart';
import '../../../../data/shared_preference/app_shared_preference.dart';

import '../../../common/services/auth_service.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../utils/string_constans.dart';
import '../../example_dashboard_chat_page/login_example_page/model/username.dart';
import '../model/password.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.userRepository) : super(LoginInitial());

  final UserRepository userRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPhoneNumberChanged) {
      yield _mapPhoneNumberChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginDispose) {
      yield _mapLoginDispose(event, state);
    } else if (event is LoginInitDataChanged) {
      yield* _mapLoginInitDataChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if (event is LoginRequestOtp) {
      yield* _mapLoginRequestOtpToState(event, state);
    } else if (event is LoginWithGoogleSubmitted) {
      yield* _mapLoginWithGoogleSubmittedToState(event, state);
    } else if (event is LoginSubmittedWithNumberPhone) {
      yield* _mapLoginSubmittedLoginSubmittedWithNumberPhoneToState(
          event, state);
    }
  }

  LoginState _mapLoginDispose(
    LoginDispose event,
    LoginState state,
  ) {
    return LoginState();
  }

  Stream<LoginState> _mapLoginInitDataChangedToState(
    LoginInitDataChanged event,
    LoginState state,
  ) async* {
    final userNameData = await AppSharedPreference.getUsernameRegisterUser();
    final userName = MandatoryFieldValidator.dirty(userNameData);

    yield state.copyWith(username: userName);
  }

  LoginState _mapPhoneNumberChangedToState(
    LoginPhoneNumberChanged event,
    LoginState state,
  ) {
    final phoneNumber = PhoneValidator.dirty(event.phoneNumber);
    return state.copyWith(
      phoneNumber: phoneNumber,
    );
  }

  LoginState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final userName = MandatoryFieldValidator.dirty(event.userName);
    return state.copyWith(username: userName);
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
    );
  }

  Stream<LoginState> _mapLoginSubmittedLoginSubmittedWithNumberPhoneToState(
    LoginSubmittedWithNumberPhone event,
    LoginState state,
  ) async* {
    if (state.submitStatus!.isValidated) {
      yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
      try {
        // User? user =
        // await userRepository.loginWithGoogle();
        await GAuthentication.signinWithNumerPhone(
            context: event.context,
            codeController: event.codeController,
            phoneNumber: state.phoneNumber.value);
        await Future.delayed(const Duration(seconds: 5));
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
      } on LoginErrorException catch (e) {
        print(e);
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      } on Exception catch (a) {
        print(a);
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } else {
      final phoneNumber = PhoneValidator.dirty(state.phoneNumber.value);
      yield state.copyWith(phoneNumber: phoneNumber);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      // temporary
      ResponseModel response = await userRepository.loginNonOtp(LoginModel(
          username: state.username.value, password: state.password.value));
      UserModel userModel = response.data ?? const UserModel() ;

      if (response.code == 200) {
        await AppSharedPreference.setUserRegister(response.data);
        await AppSharedPreference.setString(
            AppSharedPreference.token, userModel.token ?? '');
        await AppSharedPreference.setUser(userModel);
        if(userModel.isMidwife == true && userModel.hospitalModel != null) {
          print('hospital model : ${userModel.hospitalModel?.name}');
          await AppSharedPreference.setHospital(userModel.hospitalModel!);
        }

        bool isActive = false;
        if (userModel.isPatient == true) {
          if (userModel.isHaveBaby != false ||
              userModel.isPregnant != false ||
              userModel.isPlanningPregnancy != false) {
            isActive = true;
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: StringConstant.submitLogin,
                userModel: response.data,
                isActive: isActive);
          } else {
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: StringConstant.submitLogin,
                userModel: response.data,
                isActive: isActive);
          }
        }else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              typeEvent: StringConstant.submitLogin,
              userModel: response.data, isActive: true);
        }
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<LoginState> _mapLoginRequestOtpToState(
    LoginRequestOtp event,
    LoginState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var type = '';
      if (state.userId!.contains('@')) {
        type = 'email';
      } else {
        type = 'mobile';
      }
      ResponseModel response = await userRepository
          .requestOtp(OtpModel(value: state.userId, type: type));
      OtpModel otpModel = response.data;
      if (response.code == 200) {
        await AppSharedPreference.setOtp(otpModel);
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<LoginState> _mapLoginWithGoogleSubmittedToState(
    LoginWithGoogleSubmitted event,
    LoginState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      await FirebaseAuth.instance.signOut();
      final User? user = await GAuthentication.signInWithGoogle();
      if (user != null) {
        var data = user.email??"";
        final response = await userRepository.checkUserExist(data);
        UserModel userModel = response.data;
        if (response.code == 200) {
          if (response.message == StringConstant.active) {
            if (userModel.isPregnant == true ||
                userModel.isHaveBaby == true ||
                userModel.isPlanningPregnancy == true) {
              await AppSharedPreference.setUsernameRegisterUser(data);
              await AppSharedPreference.setUserRegister(userModel);
              yield state.copyWith(
                  submitStatus: FormzStatus.submissionSuccess,
                  userModel: userModel,
                  typeEvent: StringConstant.signUpGoogle,
                  userId: data,
                  isExist: true,
                  isSurvey: true);
            } else {
              await AppSharedPreference.setUserRegister(userModel);
              await AppSharedPreference.setUsernameRegisterUser(data);
              yield state.copyWith(
                  submitStatus: FormzStatus.submissionSuccess,
                  typeEvent: StringConstant.signUpGoogle,
                  userModel: userModel,
                  userId: data,
                  isExist: true,
                  isSurvey: false);
            }
          } else {
            await AppSharedPreference.setUsernameRegisterUser(data);
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: StringConstant.signUpGoogle,
                userId: data,
                isExist: false,
                type: 'toRequestOtp');
          }
        } else {
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure,                  typeEvent: StringConstant.signUpGoogle,
          );
        }
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure,                  typeEvent: StringConstant.signUpGoogle,
        );
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure,                  typeEvent: StringConstant.signUpGoogle,
      );
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure,                  typeEvent: StringConstant.signUpGoogle,
      );
    }
  }
}
