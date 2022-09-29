part of 'signup_bloc.dart';

class SignupState with FormzMixin {
  final UserModel? userModel;
  final UserRolesModelFirebase? role;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator userName;
  final EmailAddressUsername email;
  final FormzStatus? submitStatus;
  final String? userId;
  final String? errorMessage;
  final bool? isExist;
  final bool? isSurvey;
  final String? type;

  SignupState(
      {this.phoneNumber = const PhoneValidator.pure(),
      this.email = const EmailAddressUsername.pure(),
      this.userName = const MandatoryFieldValidator.pure(),
      this.userModel,
      this.role,
      this.submitStatus = FormzStatus.pure,
      this.userId,
      this.type,
      this.errorMessage,
      this.isExist = false,
      this.isSurvey = false});

  SignupState copyWith({
    FormzStatus? submitStatus,
    PhoneValidator? phoneNumber,
    UserModel? userModel,
    UserRolesModelFirebase? role,
    EmailAddressUsername? email,
    MandatoryFieldValidator? userName,
    String? userId,
    String? errorMessage,
    bool? isExist,
    bool? isSurvey,
    String? type,
  }) {
    return SignupState(
        submitStatus: submitStatus,
        type: type,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        isExist: isExist ?? this.isExist,
        isSurvey: isSurvey ?? this.isSurvey,
        userModel: userModel ?? this.userModel,
        role: role ?? this.role,
        errorMessage: errorMessage,
        userId: userId ?? this.userId);
  }

  @override
  List<FormzInput> get inputs => [userName];
}

class SignupInitial extends SignupState {}
