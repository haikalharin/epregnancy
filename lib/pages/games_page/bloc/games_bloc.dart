import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
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
      yield* _mapFetchGameListEvent(event, state);
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
      ResponseModel<PlayGameResponse> response = await homeRepository.getPointFromGame(event.gameId ?? '');
      PlayGameResponse _responseGame = response.data;
      PlayGameResponse gameEntity = _responseGame.copyWith(
        id: await aesDecryptor(_responseGame.id),
        url: await aesDecryptor(_responseGame.url),
        name: await aesDecryptor(_responseGame.name)
      );
      
      if(response.code == 200) {
        yield state.copyWith(type: 'play-game-success', status: FormzStatus.submissionSuccess, playGameResponse: gameEntity);
      }
    } catch(e) {
      print('error play game : $e');
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'play-game-failed', errorMessage: e.toString());
    }
  }

  Stream<GamesState> _mapFetchGameListEvent(
      FetchGamesEvent event,
      GamesState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'Loading Data', playGameResponse: null);
    try {
      List<GamesResponse> _gameListResponse = await homeRepository.fetchGameList();
      List<GamesResponse> _gameList = [];

      for (var element in _gameListResponse) {
        GamesResponse game = element.copyWith(
          id: await aesDecryptor(element.id),
          name: await aesDecryptor(element.name),
          imageUrl: await aesDecryptor(element.imageUrl),
          coverUrl: await aesDecryptor(element.coverUrl),
          url: await aesDecryptor(element.url),
        );

        _gameList.add(game);
      }

      if(_gameList.isNotEmpty) {
        yield state.copyWith(type: 'Load Data Success', status: FormzStatus.submissionSuccess, gamesResponse: _gameList);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}