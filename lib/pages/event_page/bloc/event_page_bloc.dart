import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/utils/extension.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/event_error_exception.dart';
import '../../../common/validators/mandatory_field_validator.dart';
import '../../../common/validators/phone_validator.dart';
import '../../../data/firebase/event/event_event.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../data/repository/event_repository/event_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../example_dashboard_chat_page/login_example_page/model/password.dart';

part 'event_page_event.dart';

part 'event_page_state.dart';

class EventPageBloc extends Bloc<EventPageEvent, EventPageState> {
  EventPageBloc(this.eventRepository) : super(EventPageInitial());

  final EventRepository eventRepository;

  @override
  Stream<EventPageState> mapEventToState(EventPageEvent event) async* {
    if (event is EventScheduleNameChanged) {
      yield _mapEventUsernameChangedToState(event, state);
    } else if (event is EventDescriptionChanged) {
      yield _mapEventDescriptionChangedToState(event, state);
    } else if (event is EventDateStartChanged) {
      yield _mapEventDateStartChangedToState(event, state);
    } else if (event is EventDateEndChanged) {
      yield _mapEventDateEndChangedToState(event, state);
    } else if (event is EventTimeChanged) {
      yield _mapEventTimeChangedToState(event, state);
    } else if (event is EventTimeNotificationChanged) {
      yield _mapEventTimeNotificationChangedToState(event, state);
    } else if (event is EventTotalConsumeChanged) {
      yield _mapEventTotalConsumeChangedEvent(event, state);
    } else if (event is EventDaysChanged) {
      yield _mapEventDaysChangedEvent(event, state);
    } else if (event is EventlistScheduleTimeChanged) {
      yield _mapEventlistScheduleTimeChangedEvent(event, state);
    } else if (event is EventInitEvent) {
      yield _mapEventInitEvent(event, state);
    } else if (event is EventAddSubmitted) {
      yield* _mapEventAddSubmittedToState(event, state);
    }
  }

  EventPageState _mapEventInitEvent(
    EventInitEvent event,
    EventPageState state,
  ) {
    var timeNotfication = TimeOfDay(hour: 0, minute: 30).toTimerNotif();
    final timeNotficationString =
        MandatoryFieldValidator.dirty(timeNotfication);

    final consulType = MandatoryFieldValidator.dirty(event.type);
    return EventPageState(
        timeNotfication: TimeOfDay(hour: 0, minute: 30),
        timeNotficationString: timeNotficationString,
        consulType: consulType);
  }

  EventPageState _mapEventTotalConsumeChangedEvent(
    EventTotalConsumeChanged event,
    EventPageState state,
  ) {
    int data = 0;
    List<NotificationModel>? listScheduleTime = [];
    TimeOfDay time = TimeOfDay(hour: 09, minute: 00);
    if (event.totalConsume != null && event.totalConsume != "") {
      data = int.parse(event.totalConsume);
    }
    for (var i = 0; i < data; i++) {
      if (i > 0) {
        time = TimeOfDay(hour: time.hour + 4, minute: 00);
        if (time.hour > 24) {
          time = TimeOfDay(hour: time.hour % 24, minute: 00);
        } else {
          time = time;
        }
      }
      var timeFix = time.to24hours();
      listScheduleTime.add(NotificationModel(time: "$timeFix:00"));
    }
    final totalconsume = MandatoryFieldValidator.dirty(event.totalConsume);
    return state.copyWith(
        listScheduleTime: listScheduleTime, totalConsume: totalconsume);
  }

  EventPageState _mapEventDaysChangedEvent(
    EventDaysChanged event,
    EventPageState state,
  ) {
    final days = MandatoryFieldValidator.dirty(event.days);
    return state.copyWith(days: days);
  }

  EventPageState _mapEventlistScheduleTimeChangedEvent(
    EventlistScheduleTimeChanged event,
    EventPageState state,
  ) {
    List<NotificationModel>? listScheduleTime = [];
    listScheduleTime = state.listScheduleTime;
    // listScheduleTime[event.index] = event.time;
    return state.copyWith(listScheduleTime: listScheduleTime);
  }

  EventPageState _mapEventUsernameChangedToState(
    EventScheduleNameChanged event,
    EventPageState state,
  ) {
    final scheduleName = MandatoryFieldValidator.dirty(event.scheduleName);
    return state.copyWith(scheduleName: scheduleName);
  }

  EventPageState _mapEventDescriptionChangedToState(
    EventDescriptionChanged event,
    EventPageState state,
  ) {
    final description = MandatoryFieldValidator.dirty(event.desc);
    return state.copyWith(description: description);
  }

  EventPageState _mapEventDateStartChangedToState(
    EventDateStartChanged event,
    EventPageState state,
  ) {
    final df = DateFormat.yMMMMd('id');
    var date = df.format(event.dateStart);
    final dateStartString = MandatoryFieldValidator.dirty(date);

    return state.copyWith(
        dateStart: event.dateStart, dateStartString: dateStartString);
  }

  EventPageState _mapEventDateEndChangedToState(
    EventDateEndChanged event,
    EventPageState state,
  ) {
    final df = DateFormat.yMMMMd('id');
    var date = df.format(event.dateEnd);
    final dateEndString = MandatoryFieldValidator.dirty(date);

    return state.copyWith(dateEnd: event.dateEnd, dateEndString: dateEndString);
  }

  EventPageState _mapEventTimeChangedToState(
    EventTimeChanged event,
    EventPageState state,
  ) {
    var time = event.timeStart.to24hours();
    final timeString = MandatoryFieldValidator.dirty(time);
    return state.copyWith(time: event.timeStart, timeString: timeString);
  }

  EventPageState _mapEventTimeNotificationChangedToState(
    EventTimeNotificationChanged event,
    EventPageState state,
  ) {
    var timeNotfication = event.time.toTimerNotif();
    final timeNotficationString =
        MandatoryFieldValidator.dirty(timeNotfication);
    return state.copyWith(
        timeNotfication: event.time,
        timeNotficationString: timeNotficationString);
  }

  Stream<EventPageState> _mapEventAddSubmittedToState(
    EventAddSubmitted event,
    EventPageState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
      try {
        UserModel person = await AppSharedPreference.getUser();
        final df = DateFormat('yyyy-MM-dd');
        var dateStart = df.format(state.dateStart ?? DateTime.now());
        var dateEnd = df.format(state.dateEnd ?? DateTime.now());

        var hour = state.timeNotfication!.hour.toString().length == 1
            ? "0${state.timeNotfication!.hour}"
            : state.timeNotfication!.hour.toString();
        var minute = state.timeNotfication!.minute.toString().length == 1
            ? "0${state.timeNotfication!.hour}"
            : state.timeNotfication!.minute.toString();

        var hourToMinute = state.timeNotfication!.hour * 60;
        int total = state.timeNotfication!.minute + hourToMinute;
        String time = "${state.timeString.value}:00";
        String fullDate = "$dateStart $time";
        DateTime tempDate =
        new DateFormat("yyyy-MM-dd hh:mm:ss").parse(fullDate);

        DateTime fixDate = DateTime(tempDate.year, tempDate.month,
            tempDate.day, tempDate.hour, tempDate.minute - total);


        ResponseModel response = ResponseModel();
        if (state.consulType.value == StringConstant.consumeMedicine) {
          response = await eventRepository.saveEvent(EventModel(
            userId: person.id,
            type: state.consulType.value,
            title: state.scheduleName.value,
            startDate: dateStart,
            endDate: dateEnd,
            medicineTakenDays: int.parse(state.days.value),
            medicineTakenTimes: int.parse(state.totalConsume.value),
            medicineUnit: "tablet",
            remindBefore: "00:05:00",
            status: "active",
            notifications: state.listScheduleTime,
          ));
        } else {

          String remindBefore = "$hour:$minute:00";
          print('remind before : $remindBefore');
          response = await eventRepository.saveEvent(EventModel(
            userId: person.id,
            type: state.consulType.value,
            title: state.scheduleName.value,
            description: state.description.value,
            time: "${state.timeString.value}:00",
            startDate: dateStart,
            endDate: dateStart,
            date: dateStart,
            remindBefore: remindBefore.toString(),
            status: "active",
          ));
        }
        if (response.code == 200) {
          var scheduledNotificationDateTime =
              DateTime.now().millisecondsSinceEpoch - 120 * 1000;
          var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'your other channel id',
            'your other channel name',
          );
          var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
          NotificationDetails platformChannelSpecifics =
              new NotificationDetails(
                  android: androidPlatformChannelSpecifics,
                  iOS: iOSPlatformChannelSpecifics);
          final FlutterLocalNotificationsPlugin
              flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          await flutterLocalNotificationsPlugin.schedule(
              0,
              state.scheduleName.value,
              state.description.value,
              fixDate,
              platformChannelSpecifics);

          yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            role: person.isPatient == true
                ? StringConstant.patient
                : StringConstant.midwife,
          );
        } else {
          yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
        }
      } on EventErrorException catch (e) {
        print(e);
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      } on Exception catch (a) {
        print(a);
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } else {
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
