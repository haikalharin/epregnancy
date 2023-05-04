part of 'home_page_bloc.dart';


enum SortEnum { asc, desc }
@immutable
abstract class HomePageEvent extends Equatable{
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchDataEvent extends HomePageEvent {
  const HomeFetchDataEvent({this.isMidwife =false});
  final bool isMidwife;


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

class FetchListVisitEvent extends HomePageEvent {
  const FetchListVisitEvent( this.page,
      {this.size = 5,
        this.isNextPage = false,
        this.isSearch = false, this.sortBy = 'createdDate', this.sort= SortEnum.desc});

  final String? sortBy;
  final SortEnum? sort;
  final int? page;
  final int? size;
  final bool isNextPage;
  final bool isSearch;

  @override
  List<Object> get props => [];
}

class HomeEventDeleteSchedule extends HomePageEvent {
  const HomeEventDeleteSchedule(this.id);

  final String id;
}


