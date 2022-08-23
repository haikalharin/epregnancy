part of 'event_page_bloc.dart';

class EventPageState with FormzMixin {
  final UserModelFirebase? userModelFirebase;
  final UserRolesModelFirebase? role;
  final MandatoryFieldValidator consulType;
  final MandatoryFieldValidator scheduleName;
  final MandatoryFieldValidator description;
  final MandatoryFieldValidator dateStartString;
  final MandatoryFieldValidator dateEndString;
  final MandatoryFieldValidator timeString;
  final MandatoryFieldValidator timeNotficationString;
  final MandatoryFieldValidator totalConsume;
  final MandatoryFieldValidator days;
  final List<String> listScheduleTime;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final TimeOfDay? time;
  final TimeOfDay? timeNotfication;
  final FormzStatus submitStatus;
  final String? errorMessage;

  EventPageState(
      {this.scheduleName = const MandatoryFieldValidator.pure(),
      this.consulType = const MandatoryFieldValidator.pure(),
      this.description = const MandatoryFieldValidator.pure(),
      this.dateStartString = const MandatoryFieldValidator.pure(),
      this.dateEndString = const MandatoryFieldValidator.pure(),
      this.timeString = const MandatoryFieldValidator.pure(),
      this.timeNotficationString = const MandatoryFieldValidator.pure(),
      this.totalConsume = const MandatoryFieldValidator.pure(),
      this.days = const MandatoryFieldValidator.pure(),
      this.listScheduleTime = const [],
      this.time,
      this.timeNotfication,
      this.dateStart,
      this.dateEnd,
      this.userModelFirebase,
      this.role,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage});

  EventPageState copyWith(
      {FormzStatus? submitStatus,
      MandatoryFieldValidator? consulType,
      MandatoryFieldValidator? scheduleName,
      UserModelFirebase? userModelFirebase,
      UserRolesModelFirebase? role,
      MandatoryFieldValidator? description,
      MandatoryFieldValidator? dateStartString,
      MandatoryFieldValidator? dateEndString,
      MandatoryFieldValidator? timeString,
      MandatoryFieldValidator? timeNotficationString,
      MandatoryFieldValidator? totalConsume,
      MandatoryFieldValidator? days,
      List<String>? listScheduleTime,
      DateTime? dateStart,
      DateTime? dateEnd,
      TimeOfDay? time,
      TimeOfDay? timeNotfication,
      String? errorMessage}) {
    return EventPageState(
        submitStatus: submitStatus ?? this.submitStatus,
        scheduleName: scheduleName ?? this.scheduleName,
        consulType: consulType ?? this.consulType,
        description: description ?? this.description,
        totalConsume: totalConsume ?? this.totalConsume,
        listScheduleTime: listScheduleTime ?? this.listScheduleTime,
        days: days ?? this.days,
        time: time ?? this.time,
        timeNotfication: timeNotfication ?? this.timeNotfication,
        timeString: timeString ?? this.timeString,
        timeNotficationString:
            timeNotficationString ?? this.timeNotficationString,
        dateStart: dateStart ?? this.dateStart,
        dateStartString: dateStartString ?? this.dateStartString,
        dateEnd: dateEnd ?? this.dateEnd,
        role: role ?? this.role,
        dateEndString: dateEndString ?? this.dateEndString,
        userModelFirebase: userModelFirebase ?? this.userModelFirebase,
        errorMessage: errorMessage);
  }

  @override
  List<FormzInput> get inputs =>
      consulType.value == StringConstant.consumeMedicine
          ? [scheduleName, dateStartString, dateEndString, totalConsume, days]
          : [scheduleName, description, dateStartString, timeString];
}

class EventPageInitial extends EventPageState {}
