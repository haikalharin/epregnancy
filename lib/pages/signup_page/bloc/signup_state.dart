part of 'signup_bloc.dart';

class SignupState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final PhoneValidator phoneNumber;
  final EmailAddressUsername username;
  final FormzStatus submitStatus;
  final String? errorMessage;
  final bool? isExist;

  SignupState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const EmailAddressUsername.pure(),
        this.userModelFirebase,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage,
        this.isExist = false
      });

  SignupState copyWith(
      {FormzStatus? submitStatus,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        EmailAddressUsername? username,
        String? errorMessage,
        bool? isExist,
      }) {
    return SignupState(
        submitStatus: submitStatus ?? this.submitStatus,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        isExist: isExist ?? this.isExist,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        errorMessage: errorMessage);
  }

  @override
  List<FormzInput> get inputs => [username];
}

class SignupInitial extends SignupState {}
