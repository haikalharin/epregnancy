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


