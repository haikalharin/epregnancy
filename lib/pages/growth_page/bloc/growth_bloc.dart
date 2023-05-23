import 'package:PregnancyApp/data/model/growth_model/growth_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/child_repository/child_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'growth_event.dart';

part 'growth_state.dart';

class GrowthBloc extends Bloc<GrowthEvent, GrowthState> {
  GrowthBloc(this.childRepository) : super(GrowthBlocInitialState());
  final ChildRepository childRepository;

  @override
  Stream<GrowthState> mapEventToState(GrowthEvent event) async* {
    if(event is FetchGrowthEvent) {
      yield* _mapFetchGrowthListEvent(event, state);
    }
  }

  Stream<GrowthState> _mapFetchGrowthListEvent(
      FetchGrowthEvent event,
      GrowthState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'Loading Data', growths: []);
    try {
      ResponseModel<GrowthModel> response  = await childRepository.fetchAllGrowth(event.id!);
      if(response.code == 200){
        List<GrowthModel> _growthResponseLise = response.data ?? [];
        if(_growthResponseLise.isNotEmpty) {
          yield state.copyWith(type: 'Load Data Success', status: FormzStatus.submissionSuccess, growths: _growthResponseLise);
        } else {
          yield state.copyWith(type: 'Load Data Success But Empty', status: FormzStatus.submissionSuccess, growths: []);
        }
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: response.code.toString());
      }
    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());

      }
    }
  }
}