import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'point_history_event.dart';

part 'point_history_state.dart';

class PointHistoryBloc extends Bloc<PointHistoryEvent, PointHistoryState> {
   PointHistoryBloc(this.userRepository) : super(PointHistoryInitialState());
  final UserRepository userRepository;

   @override
  Stream<PointHistoryState> mapEventToState(PointHistoryEvent event) async* {
    if(event is FetchPointHistoryEvent) {
      yield* _mapFetchHistoryPoint(event, state);
    }
  }

  Stream<PointHistoryState> _mapFetchHistoryPoint(
      FetchPointHistoryEvent event,
      PointHistoryState state,
      ) async* {
     yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'Loading Data');
     try {
       List<PointHistory> _pointHistoryResponse = await userRepository.fetchPointHistory();
       if(_pointHistoryResponse.isNotEmpty) {
         yield state.copyWith(type: 'Load Data Success', status: FormzStatus.submissionSuccess, pointHistories: _pointHistoryResponse);
       }
     } catch(e) {
       yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
     }
  }
}