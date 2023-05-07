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

class ResetBaby extends HomePageEvent {
  const ResetBaby();


  @override
  List<Object> get props => [];
}

class HomeFetchBabyChildsEvent extends HomePageEvent {
  const HomeFetchBabyChildsEvent();

  @override
  List<Object> get props => [];
}

class SetHospitalEvent extends HomePageEvent {
  const SetHospitalEvent(this.hospitalModel);
  final HospitalModel? hospitalModel;

  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomePageEvent {
  const HomeInitEvent();


  @override
  List<Object> get props => [];
}

class ArticleHomeFetchEvent extends HomePageEvent {
  const ArticleHomeFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchSimpleTipEvent extends HomePageEvent {
  const FetchSimpleTipEvent();

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


