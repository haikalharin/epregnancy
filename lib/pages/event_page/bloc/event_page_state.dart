part of 'event_page_bloc.dart';


class EventPageState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final PhoneValidator phoneNumber;
  final MandatoryFieldValidator username;
  final UserRolesModelFirebase? role;
  final Password password;
  final FormzStatus submitStatus;
  final String? errorMessage;

  EventPageState(
      {this.phoneNumber = const PhoneValidator.pure(),
        this.username = const MandatoryFieldValidator.pure(),
        this.password = const Password.pure(),
        this.role,
        this.userModelFirebase,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  EventPageState copyWith(
      {FormzStatus? submitStatus,
        PhoneValidator? phoneNumber,
        UserModelFirebase? userModelFirebase,
        MandatoryFieldValidator? username,
        UserRolesModelFirebase? role,
        Password? password,
        String? errorMessage}) {
    return EventPageState(
        submitStatus: submitStatus ?? this.submitStatus,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
        userModelFirebase: userModelFirebase?? this.userModelFirebase,
        errorMessage: errorMessage);
  }



  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [];
}

class EventPageInitial extends EventPageState {}
