import 'package:PregnancyApp/data/model/child_model/child_list_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import '../../../data/repository/child_repository/child_repository.dart';

part 'child_list_event.dart';

part 'child_list_state.dart';

class ChildListBloc extends Bloc<ChildListEvent, ChildListBlocState> {
  ChildListBloc(this.childRepository) : super(ChildListStateInitial());

  final ChildRepository childRepository;

  @override
  Stream<ChildListBlocState> mapEventToState(ChildListEvent event) async* {
    if (event is FetchChildListEvent) {
      yield* _mapFetchChildListEvent(event, state);
    }
  }

  Stream<ChildListBlocState> _mapFetchChildListEvent(
    FetchChildListEvent event,
    ChildListBlocState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress, childs: []);
    try {
      ResponseModel<ChildListResponse> response = await childRepository.fetchChildList();
      if(response.code == 200) {
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, childs: response.data);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } catch (e) {
      print("error fetch child : ${e.toString()}");
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }
}
