import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_user.dart';
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
import '../../../../data/firebase/event/event_person.dart';
import '../../../../data/firebase/g_authentication.dart';
import '../../../../data/model/person_model/person_model.dart';
import '../../../../data/shared_preference/app_shared_preference.dart';

import '../model/password.dart';
import '../model/email_address.dart';

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
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    } else if (event is LoginWithGoogleSubmitted) {
      yield* _mapLoginWithGoogleSubmittedToState(event, state);
    } else if (event is LoginSubmittedWithNumberPhone) {
      yield* _mapLoginSubmittedLoginSubmittedWithNumberPhoneToState(
          event, state);
    }
  }

  LoginState _mapPhoneNumberChangedToState(
    LoginPhoneNumberChanged event,
    LoginState state,
  ) {
    final phoneNumber = PhoneValidator.dirty(event.phoneNumber);
    return state.copyWith(
      phoneNumber: phoneNumber,
      status: Formz.validate([phoneNumber]),
    );
  }

  LoginState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final userName = EmailAddressUsername.dirty(event.userName);
    return state.copyWith(
      username: userName,
      status: Formz.validate([userName]),
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.phoneNumber]),
    );
  }

  Stream<LoginState>
      _mapLoginSubmittedLoginSubmittedWithNumberPhoneToState(
    LoginSubmittedWithNumberPhone event,
    LoginState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        // User? user =
        // await userRepository.loginWithGoogle();
        await GAuthentication.signinWithNumerPhone(
            context: event.context,
            codeController: event.codeController,
            phoneNumber: state.phoneNumber.value);
        await Future.delayed(const Duration(seconds: 5));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on LoginErrorException catch (e) {
        print(e);
        yield state.copyWith(status: FormzStatus.submissionFailure);
      } on Exception catch (a) {
        print(a);
        yield state.copyWith(status: FormzStatus.submissionFailure);
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
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      // User? user =
      // await userRepository.loginWithGoogle();
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: state.phoneNumber.value,
      //   password: state.password.value,
      // );
      // await Future.delayed(const Duration(seconds: 5));
      // if (userCredential.user!.uid.isNotEmpty) {
      //   PersonModel person = PersonModel(
      //     phoneNumber: userCredential.user!.email,
      //     name: userCredential.user!.displayName,
      //     photo: userCredential.user!.photoURL,
      //     token: '',
      //     uid: userCredential.user!.uid,
      //   );
      //   EventPerson.addPerson(person);
      //   await userCredential.user!.sendEmailVerification();
      // await AppSharedPreference.setPerson(person);

      UserModelFirebase userModelFirebase =
          await EventUser.checkUser(state.username.value, state.password.value);
      // await Future.delayed(const Duration(seconds: 5));
      if (userModelFirebase.userid!.isNotEmpty) {
        await AppSharedPreference.setUserFirebase(userModelFirebase);
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
      // final response = await userRepository.login(
      //     state.username.value, state.password.value);
      // if (response) {

      else {
        final username = EmailAddressUsername.dirty(state.username.value);
        final password = Password.dirty(state.password.value);
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            username: username,
            password: password);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<LoginState> _mapLoginWithGoogleSubmittedToState(
    LoginWithGoogleSubmitted event,
    LoginState state,
  ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      User? user = await userRepository.loginWithGoogle();
      // UserCredential userCredential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: state.phoneNumber.value,
      //   password: state.password.value,
      // );
      await Future.delayed(const Duration(seconds: 5));

      if (user!.uid.isNotEmpty) {
        PersonModel person = PersonModel(
          phoneNumber: user.email,
          name: user.displayName,
          photo: user.photoURL,
          token: '',
          uid: user.uid,
        );
        EventPerson.addPerson(person);
        await user.sendEmailVerification();
        await AppSharedPreference.setPerson(person);
        // final response = await userRepository.login(
        //     state.username.value, state.password.value);
        // if (response) {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    } on LoginErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
}
