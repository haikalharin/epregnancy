part of 'games_bloc.dart';

class GamesState {
  final FormzStatus? status;
  final String? type;
  final PlayGameResponse? playGameResponse;
  final String? errorMessage;
  final List<GamesResponse>? gamesResponse;

  GamesState(
      {this.gamesResponse, this.type, this.status, this.errorMessage, this.playGameResponse});

  GamesState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        PlayGameResponse? playGameResponse,
        List<GamesResponse>? gamesResponse}) {
    return GamesState(
        type: type ?? this.type,
        status: status ?? this.status,
        playGameResponse: playGameResponse ?? this.playGameResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        gamesResponse: gamesResponse ?? this.gamesResponse);
  }
}

class GamesBlocInitialState extends GamesState {}
