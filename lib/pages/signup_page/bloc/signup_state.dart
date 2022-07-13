part of 'signup_bloc.dart';

class SignupState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserRolesModelFirebase? role;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator userName;
  final EmailAddressUsername email;
  final FormzStatus submitStatus;
  final String? type;
  final String? errorMessage;
  final bool? isExist;

  SignupState({this.phoneNumber = const PhoneValidator.pure(),
    this.email = const EmailAddressUsername.pure(),
    this.userName = const MandatoryFieldValidator.pure(),
    this.userModelFirebase,
    this.role,
    this.submitStatus = FormzStatus.pure,
    this.type,
    this.errorMessage,
    this.isExist = false
  });

  SignupState copyWith({FormzStatus? submitStatus,
    PhoneValidator? phoneNumber,
    UserModelFirebase? userModelFirebase,
     UserRolesModelFirebase? role,
    EmailAddressUsername? email,
    MandatoryFieldValidator? userName,
    String? type,
    String? errorMessage,
    bool? isExist,
  }) {
    return SignupState(
        submitStatus: submitStatus ?? this.submitStatus,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        isExist: isExist ?? this.isExist,
        userModelFirebase: userModelFirebase ?? this.userModelFirebase,
        role: role?? this.role,
        errorMessage: errorMessage,
        type: type ?? this.type
    );
  }

  @override
  List<FormzInput> get inputs => [userName];
}

class SignupInitial extends SignupState {}
