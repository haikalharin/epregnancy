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
import '../../../../common/validators/email_validator.dart';
import '../../../../common/validators/phone_validator.dart';
import '../../../../data/firebase/event/event_person.dart';
import '../../../../data/firebase/g_authentication.dart';
import '../../../../data/model/person_model/person_model.dart';
import '../../../../data/shared_preference/app_shared_preference.dart';

import '../model/password.dart';
import '../model/username.dart';

part 'login_example_event.dart';

part 'login_example_state.dart';

class LoginExampleBloc extends Bloc<LoginExampleEvent, LoginExampleState> {
  LoginExampleBloc(this.userRepository) : super(LoginInitial());

  final UserRepository userRepository;

  @override
  Stream<LoginExampleState> mapEventToState(LoginExampleEvent event) async* {
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

  LoginExampleState _mapPhoneNumberChangedToState(
    LoginPhoneNumberChanged event,
    LoginExampleState state,
  ) {
    final phoneNumber = PhoneValidator.dirty(event.phoneNumber);
    return state.copyWith(
      phoneNumber: phoneNumber,
      status: Formz.validate([phoneNumber]),
    );
  }

  LoginExampleState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginExampleState state,
  ) {
    final userName = Username.dirty(event.userName);
    return state.copyWith(
      username: userName,
      status: Formz.validate([userName]),
    );
  }

  LoginExampleState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginExampleState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.phoneNumber]),
    );
  }

  Stream<LoginExampleState>
      _mapLoginSubmittedLoginSubmittedWithNumberPhoneToState(
    LoginSubmittedWithNumberPhone event,
    LoginExampleState state,
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

  Stream<LoginExampleState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginExampleState state,
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
        final username = Username.dirty(state.username.value);
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

  Stream<LoginExampleState> _mapLoginWithGoogleSubmittedToState(
    LoginWithGoogleSubmitted event,
    LoginExampleState state,
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
