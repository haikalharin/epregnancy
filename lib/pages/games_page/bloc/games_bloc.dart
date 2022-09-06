import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'games_event.dart';

part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc(this.homeRepository) : super(GamesBlocInitialState());
  final HomeRepository homeRepository;

  @override
  Stream<GamesState> mapEventToState(GamesEvent event) async* {
    if(event is FetchGamesEvent) {
      yield* _mapFetchHistoryPoint(event, state);
    }
  }

  Stream<GamesState> _mapFetchHistoryPoint(
      FetchGamesEvent event,
      GamesState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'Loading Data');
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