import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../data/model/games_model/play_game_response.dart';

part 'games_event.dart';

part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc(this.homeRepository) : super(GamesBlocInitialState());
  final HomeRepository homeRepository;

  @override
  Stream<GamesState> mapEventToState(GamesEvent event) async* {
    if(event is FetchGamesEvent) {
      yield* _mapFetchHistoryPoint(event, state);
    } else if (event is PlayGameEvent){
      yield* _mapPlayGameEvent(event, state);
    }
  }

  Stream<GamesState> _mapPlayGameEvent(
      PlayGameEvent event,
      GamesState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'play-game-loading', playGameResponse: null);
    try {
      ResponseModel<PlayGameResponse> responseGame = await homeRepository.getPointFromGame(event.gameId ?? '');
      if(responseGame.code == 200) {
        yield state.copyWith(type: 'play-game-success', status: FormzStatus.submissionSuccess, playGameResponse: responseGame.data);
      }
    } catch(e) {
      print('error play game : $e');
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'play-game-failed', errorMessage: e.toString());
    }
  }

  Stream<GamesState> _mapFetchHistoryPoint(
      FetchGamesEvent event,
      GamesState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'Loading Data', playGameResponse: null);
    try {
      List<GamesResponse> _gameList = await homeRepository.fetchGameList();
      if(_gameList.isNotEmpty) {
        yield state.copyWith(type: 'Load Data Success', status: FormzStatus.submissionSuccess, gamesResponse: _gameList);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}