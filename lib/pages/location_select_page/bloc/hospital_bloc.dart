import 'dart:math';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc(this.hospitalRepository, this.userRepository) : super(HospitalBlocInitialState());
  final HospitalRepository hospitalRepository;
  final UserRepository userRepository;

  @override
  Stream<HospitalState> mapEventToState(HospitalEvent event) async* {
    if(event is FetchHospitalsEvent) {
      yield* _mapFetchHospitalEvent(event, state);
    } else if (event is FetchHospitalsByIdEvent) {
      yield* _mapFetchHospitalByIdEvent(event, state);
    } else if (event is ChangeHospitalEvent){
      yield* _mapChangeHospital(event, state);
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
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
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
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapChangeHospital(
      ChangeHospitalEvent event,
      HospitalState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'change-hospital');
    try {
      final ResponseModel response = await userRepository.updateHospital(event.id ?? '');

      if(response.code == 200) {
        yield state.copyWith(type: 'change-hospital-success', status: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'change-hospital-failed', hospitals: []);
      }
    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Change Hospital Error', errorMessage: e.toString());
    }
  }
}