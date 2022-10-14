part of 'login_bloc.dart';

class LoginState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserModel? userModel;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator username;
  final UserRolesModelFirebase? role;
  final Password password;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? typeEvent;
  final bool? isActive;
  final bool? isExist;
  final bool? isSurvey;
  final String? userId;
  final String? type;
  final String? subType;

  LoginState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const MandatoryFieldValidator.pure(),
        this.password = const Password.pure(),
        this.role,
        this.isActive,
        this.userModelFirebase,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage,
        this.userModel,
        this.userId,
        this.type,
        this.subType,
  this.isExist = false,
  this.isSurvey = false,
      this.typeEvent});

  LoginState copyWith(
      {FormzStatus? submitStatus,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        UserModel? userModel,
        MandatoryFieldValidator? username,
        UserRolesModelFirebase? role,
        Password? password,
        String? userId,
        bool? isActive,
        String? errorMessage,
        String? typeEvent,
        bool? isExist,
        bool? isSurvey,
        String? type,
        String? subType,
      }) {
    return LoginState(
        submitStatus: submitStatus,
        type: type,
        subType: subType,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        userModel: userModel?? this.userModel,
        typeEvent: typeEvent,
        isActive: isActive ?? this.isActive,
        userId: userId ?? this.userId,
        isExist: isExist ?? this.isExist,
        isSurvey: isSurvey ?? this.isSurvey,
        errorMessage: errorMessage);
  }



  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [username, password];
}

class LoginInitial extends LoginState {}
