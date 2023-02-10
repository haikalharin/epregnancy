import 'dart:async';
import 'dart:io';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/login_model/login_model.dart';
import 'package:PregnancyApp/data/model/login_model/login_response_data.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:PregnancyApp/main_default.dart';
import 'package:PregnancyApp/utils/secure.dart';
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

import '../../../common/exceptions/server_error_exception.dart';
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
    } else if (event is LoginSubmittedFromRegister){
      yield* _mapLoginSubmittedFromRegisterToState(event, state);
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
        if( a is UnAuthorizeException) {
          // AppSharedPreference.sessionExpiredEvent();
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
        } else {
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
        }
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
      var token;
      if(Platform.isAndroid){
         token = await firebaseService.messaging.getDeviceToken();
         print("fcmTokenDevice : $token");
      } else {
         token = "ios";
      }
      ResponseModel response = await userRepository.loginNonOtp(LoginModel(
          username: state.username.value, password: state.password.value, fcmToken: token ?? ""));
      LoginResponseData? loginResponseData;
      if (response.code == 200) {
        loginResponseData = response.data;
        // set jwt token
        await AppSharedPreference.setString(AppSharedPreference.token, loginResponseData!.token!.accessToken!);
        final ResponseModel<UserModel> userInfoResponse = await userRepository.getUserInfo();
        UserModel _userModel = userInfoResponse.data;
        UserModel userModel = _userModel.copyWith(
          name: await aesDecryptor(_userModel.name),
        );
        await AppSharedPreference.setUser(_userModel);
        await AppSharedPreference.remove("_userRegister");
        // await AppSharedPreference.setUser(userModel);no
        if(loginResponseData.user?.hospital != null) {
          print('hospital model : ${loginResponseData.user?.hospital}');
          HospitalModel hospitalModel = HospitalModel(
              id: loginResponseData.user?.hospital?.id,
              alias: loginResponseData.user?.hospital?.alias,
              name: loginResponseData.user?.hospital?.name,
              address: loginResponseData.user?.hospital?.address,
              city: loginResponseData.user?.hospital?.city,
              country: "",
              postalCode: loginResponseData.user?.hospital?.postalCode,
              phone: loginResponseData.user?.hospital?.phone,
              email: loginResponseData.user?.hospital?.email,
              latitude: 0.0,
              longitude: 0.0, status: "",
              imageUrl: loginResponseData.user?.hospital?.imageUrl,
              coverUrl: "", isDelete: false, createdBy: "", createdFrom: "", createdDate: "", modifiedBy: "",
              modifiedFrom: "", modifiedDate: "", pin: 0, pinValidStart: "", pinValidEnd: "");
          await AppSharedPreference.setHospital(hospitalModel);
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
                userModel: userModel,
                isActive: isActive);
          } else {
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: StringConstant.submitLogin,
                userModel: userModel,
                isActive: isActive);
          }
        }else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              typeEvent: StringConstant.submitLogin,
              userModel: userModel, isActive: true);
        }
      } else if (response.code == 500) {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: "Maaf Terjadi Kesalahan, Silahkan Coba Lagi");
      } else {
        print('response message : ${response.message}');
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: response.message);
      }
    } on LoginErrorException catch (e) {
      print("login error exception" + e.toString());
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (error) {
      print("error login bloc : ${error.toString()}");
      if( error is UnAuthorizeException) {
        // AppSharedPreference.sessionExpiredEvent();
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: error.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<LoginState> _mapLoginSubmittedFromRegisterToState(
      LoginSubmittedFromRegister event,
      LoginState state,
      ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      // temporary
      var token;
      if(Platform.isAndroid){
        token = await firebaseService.messaging.getDeviceToken();
      } else {
        token = "ios";
      }
      ResponseModel response = await userRepository.loginNonOtp(LoginModel(
          username: event.username, password: event.password, fcmToken: token));
      LoginResponseData? loginResponseData;
      if (response.code == 200) {
        loginResponseData = response.data;
        // set jwt token
        await AppSharedPreference.setString(AppSharedPreference.token, loginResponseData!.token!.accessToken!);
        final ResponseModel<UserModel> userInfoResponse = await userRepository.getUserInfo();
        UserModel _userModel = userInfoResponse.data;
        UserModel userModel = _userModel.copyWith(
          name: await aesDecryptor(_userModel.name),
        );
        await AppSharedPreference.setUser(_userModel);
        await AppSharedPreference.remove("_userRegister");
        // await AppSharedPreference.setUser(userModel);no
        if(loginResponseData.user?.hospital != null) {
          print('hospital model : ${loginResponseData.user?.hospital}');
          HospitalModel hospitalModel = HospitalModel(
              id: loginResponseData.user?.hospital?.id,
              alias: loginResponseData.user?.hospital?.alias,
              name: loginResponseData.user?.hospital?.name,
              address: loginResponseData.user?.hospital?.address,
              city: loginResponseData.user?.hospital?.city,
              country: "",
              postalCode: loginResponseData.user?.hospital?.postalCode,
              phone: loginResponseData.user?.hospital?.phone,
              email: loginResponseData.user?.hospital?.email,
              latitude: 0.0,
              longitude: 0.0, status: "",
              imageUrl: loginResponseData.user?.hospital?.imageUrl,
              coverUrl: "", isDelete: false, createdBy: "", createdFrom: "", createdDate: "", modifiedBy: "",
              modifiedFrom: "", modifiedDate: "", pin: 0, pinValidStart: "", pinValidEnd: "");
          await AppSharedPreference.setHospital(hospitalModel);
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
                userModel: userModel,
                isActive: isActive);
          } else {
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                typeEvent: StringConstant.submitLogin,
                userModel: userModel,
                isActive: isActive);
          }
        }else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
              typeEvent: StringConstant.submitLogin,
              userModel: userModel, isActive: true);
        }
      } else if (response.code == 500) {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: "Maaf Terjadi Kesalahan, Silahkan Coba Lagi");
      } else {
        print('response message : ${response.message}');
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: response.message);
      }
    } on LoginErrorException catch (e) {
      print("login error exception" + e.toString());
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (error) {
      if( error is UnAuthorizeException) {
        // AppSharedPreference.sessionExpiredEvent();
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: error.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
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
      var data = {
        'type': type,
        'value':  state.userId,
      };
      ResponseModel response = await userRepository
          .requestOtp(data);
      OtpModel otpModel = OtpModel(otp: "",type: type,value: state.userId);
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
      if( a is UnAuthorizeException) {
        // AppSharedPreference.sessionExpiredEvent();
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
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
        final response = await userRepository.checkUserExist(data,"email");
        UserModel userModel = response.data;
        if (response.code == 200) {
          if (response.message == StringConstant.emailActive) {
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
      if( a is UnAuthorizeException) {
        // AppSharedPreference.sessionExpiredEvent();
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure,                  typeEvent: StringConstant.signUpGoogle,);
      }
    }
  }
}
