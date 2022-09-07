part of 'login_bloc.dart';

class LoginState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserModel? userModel;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator username;
  final UserRolesModelFirebase? role;
  final Password password;
  final FormzStatus submitStatus;
  final String? errorMessage;
  final String? typeEvent;
  final bool? isActive;

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
      this.typeEvent});

  LoginState copyWith(
      {FormzStatus? submitStatus,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        UserModel? userModel,
        MandatoryFieldValidator? username,
        UserRolesModelFirebase? role,
        Password? password,
        bool? isActive,
        String? errorMessage,
        String? typeEvent,
      }) {
    return LoginState(
        submitStatus: submitStatus ?? this.submitStatus,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        userModel: userModel?? this.userModel,
        typeEvent: typeEvent ?? this.typeEvent,
        isActive: isActive ?? this.isActive,
        errorMessage: errorMessage);
  }



  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [];
}

class LoginInitial extends LoginState {}
