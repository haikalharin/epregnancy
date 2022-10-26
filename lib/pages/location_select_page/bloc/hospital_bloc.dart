import 'dart:math';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../data/shared_preference/app_shared_preference.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc(this.hospitalRepository) : super(HospitalBlocInitialState());
  final HospitalRepository hospitalRepository;

  @override
  Stream<HospitalState> mapEventToState(HospitalEvent event) async* {
    if(event is FetchHospitalsEvent) {
      yield* _mapFetchHospitalEvent(event, state);
    } else if (event is FetchHospitalsByIdEvent) {
      yield* _mapFetchHospitalByIdEvent(event, state);
    }
  }

  Stream<HospitalState> _mapFetchHospitalEvent(
      FetchHospitalsEvent event,
      HospitalState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-hospital', hospitals: []);
    try {
      final ResponseModel<HospitalModel> response = await hospitalRepository.fetchHospitals(event.name ?? '');

      if(response.code == 200) {
        List<HospitalModel> _hospitalList = response.data ?? [];
        yield state.copyWith(type: 'fetch-hospital-success', status: FormzStatus.submissionSuccess, hospitals: _hospitalList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetch-hospital-failed', hospitals: []);
      }
    } catch(e) {
      print('hospital failed : $e');
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapFetchHospitalByIdEvent(
      FetchHospitalsByIdEvent event,
      HospitalState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-hospital', hospitals: []);
    try {
      final ResponseModel<HospitalModel> response = await hospitalRepository.fetchHospitalsById(event.id ?? '');

      if(response.code == 200) {
        List<HospitalModel> _hospitalList = response.data ?? [];
        await AppSharedPreference.setHospital(_hospitalList[0]);
        yield state.copyWith(type: 'fetch-hospital-success', status: FormzStatus.submissionSuccess, hospitals: _hospitalList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetch-hospital-failed', hospitals: []);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}