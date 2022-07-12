part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashscreenEvent extends Equatable{
  const SplashscreenEvent();

  @override
  List<Object> get props => [];
}

class SplashscreenCheckUserExist extends SplashscreenEvent {
  const SplashscreenCheckUserExist();



  @override
  List<Object> get props => [];
}