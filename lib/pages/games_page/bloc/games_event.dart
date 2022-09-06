part of 'games_bloc.dart';

@immutable
abstract class GamesEvent extends Equatable {
  const GamesEvent();

  @override
  List<Object> get props => [];
}

class FetchGamesEvent extends GamesEvent {
  const FetchGamesEvent();

  @override
  List<Object> get props => [];
}