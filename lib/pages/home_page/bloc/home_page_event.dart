part of 'home_page_bloc.dart';



@immutable
abstract class HomePageEvent extends Equatable{
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchDataEvent extends HomePageEvent {
  const HomeFetchDataEvent();


  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomePageEvent {
  const HomeInitEvent();


  @override
  List<Object> get props => [];
}

class ArticleFetchEvent extends HomePageEvent {
  const ArticleFetchEvent();

  @override
  List<Object> get props => [];
}

class PointFetchEvent extends HomePageEvent {
  const PointFetchEvent();

  @override
  List<Object> get props => [];
}

class EventFetchEvent extends HomePageEvent {
  const EventFetchEvent(this.type, this.date, {this.isMidwife = false});
  final String type;
  final DateTime date;
  final bool isMidwife;
  @override
  List<Object> get props => [];
}

class EventFetchEventPersonal extends HomePageEvent {
  const EventFetchEventPersonal(this.type, this.date);
  final String type;
  final DateTime date;
  @override
  List<Object> get props => [];
}

class HomeEventDateChanged extends HomePageEvent {
  const HomeEventDateChanged(this.date);
  final DateTime date;
  @override
  List<Object> get props => [];
}

class HomeEventDeleteSchedule extends HomePageEvent {
  const HomeEventDeleteSchedule(this.id);

  final String id;
}


