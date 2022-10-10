part of 'event_page_bloc.dart';

@immutable
abstract class EventPageEvent extends Equatable{
  const EventPageEvent();

  @override
  List<Object> get props => [];
}


class EventInitEvent extends EventPageEvent {
  const EventInitEvent(this.type);
final String type;

  @override
  List<Object> get props => [];
}


class EventScheduleNameChanged extends EventPageEvent {
  const EventScheduleNameChanged(this.scheduleName);
  final String scheduleName;
  @override
  List<Object> get props => [];
}
class EventDescriptionChanged extends EventPageEvent {
  const EventDescriptionChanged(this.desc);
  final String desc;
  @override
  List<Object> get props => [];
}
class EventDateStartChanged extends EventPageEvent {
  const EventDateStartChanged(this.dateStart);
  final DateTime dateStart;
  @override
  List<Object> get props => [];
}
class EventDateEndChanged extends EventPageEvent {
  const EventDateEndChanged(this.dateEnd);
  final DateTime dateEnd;
  @override
  List<Object> get props => [];
}

class EventTimeChanged extends EventPageEvent {
  const EventTimeChanged(this.timeStart);
  final TimeOfDay timeStart;
  @override
  List<Object> get props => [];
}

class EventlistScheduleTimeChanged extends EventPageEvent {
  const EventlistScheduleTimeChanged(this.time, this.index);
  final String time;
  final int index;
  @override
  List<Object> get props => [];
}


class EventTimeNotificationChanged extends EventPageEvent {
  const EventTimeNotificationChanged(this.time);
  final TimeOfDay time;
  @override
  List<Object> get props => [];
}

class EventTotalConsumeChanged extends EventPageEvent {
  const EventTotalConsumeChanged(this.totalConsume);
  final String totalConsume;
  @override
  List<Object> get props => [];
}

class EventDaysChanged extends EventPageEvent {
  const EventDaysChanged(this.days);
  final String days;
  @override
  List<Object> get props => [];
}


class EventAddSubmitted extends EventPageEvent {
  const EventAddSubmitted();
}

class EventDisposeEvent extends EventPageEvent {
  const EventDisposeEvent();
}


