import 'package:PregnancyApp/common/validators/mandatory_field_validator.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../../common/validators/phone_validator.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/validators/email_address_username_validator.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/otp_model/otp_model.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.userRepository) : super(SignupInitial());

  final UserRepository userRepository;

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupSubmitted) {
      yield* _mapSignupSubmittedToState(event, state);
    } else if (event is SignupUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is SignupUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is SignupPhoneNumberChanged) {
      yield _mapSignupPhoneNumberChangedToState(event, state);
    } else if (event is SignupInitEvent) {
      yield _mapSignupInitEventToState(event, state);
    } else if (event is RequestOtp) {
      yield* _mapRequestOtpToState(event, state);
    }
  }

  SignupState _mapSignupInitEventToState(
      SignupInitEvent event, SignupState state) {
    return state.copyWith(
        submitStatus: FormzStatus.pure,
        userName: const MandatoryFieldValidator.pure(),
        phoneNumber: const PhoneValidator.pure(),
        email: const EmailAddressUsernameValidator.pure());
  }

  SignupState _mapSignupPhoneNumberChangedToState(
    SignupPhoneNumberChanged event,
    SignupState state,
  ) {
    final phoneNumber = PhoneValidator.dirty(event.phoneNumber);

    return state.copyWith(
        phoneNumber: phoneNumber,
        userName: MandatoryFieldValidator.dirty(phoneNumber.value));
  }

  SignupState _mapUsernameChangedToState(
    SignupUsernameChanged event,
    SignupState state,
  ) {
    final email = EmailAddressUsernameValidator.dirty(event.email);
    return state.copyWith(
      email: email,
      userName: MandatoryFieldValidator.dirty(email.value),
    );
  }

  Stream<SignupState> _mapSignupSubmittedToState(
    SignupSubmitted event,
    SignupState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      if (state.email.valid && state.phoneNumber.valid) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            errorMessage:
                'Pilih salah satu meode Signup email atau nomor telfon');
      } else if (state.email.valid || state.phoneNumber.valid) {
        var data =
            state.email.valid ? state.email.value : state.phoneNumber.value;
        final response = await userRepository.checkUserExist(data);
        UserModel userModel = response.data;
        if (response.code == 200) {
          if (response.message == StringConstant.active) {
            // if (userModel.isPregnant == true ||
            //     userModel.isHaveBaby == true ||
            //     userModel.isPlanningPregnancy == true) {
            //   await AppSharedPreference.setUsernameRegisterUser(data);
            //   await AppSharedPreference.setUserRegister(userModel);
            //   yield state.copyWith(
            //       submitStatus: FormzStatus.submissionSuccess,
            //       userModel: userModel,
            //       userId: data,
            //       isExist: true,
            //       isSurvey: true);
            // } else {
            //   await AppSharedPreference.setUserRegister(userModel);
            //   await AppSharedPreference.setUsernameRegisterUser(data);
            //   yield state.copyWith(
            //       submitStatus: FormzStatus.submissionSuccess,
            //       userModel: userModel,
            //       userId: data,
            //       isExist: true,
            //       isSurvey: false);
            // }
            yield state.copyWith(
                submitStatus: FormzStatus.submissionFailure,
                errorMessage: "Username sudah terdaftar",
                phoneNumber: PhoneValidator.pure(),
                email: EmailAddressUsernameValidator.pure());
          } else {
            await AppSharedPreference.setUsernameRegisterUser(data);
            yield state.copyWith(
                submitStatus: FormzStatus.submissionSuccess,
                userId: data,
                isExist: false,
                type: 'toDisclaimer');
          }
        } else {
          yield state.copyWith(
              submitStatus: FormzStatus.submissionFailure,
              phoneNumber: PhoneValidator.dirty(),
          email: EmailAddressUsernameValidator.dirty());
        }
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure,
            errorMessage: 'Masukan nomor telfon atau email anda');
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<SignupState> _mapRequestOtpToState(
    RequestOtp event,
    SignupState state,
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

//

}
