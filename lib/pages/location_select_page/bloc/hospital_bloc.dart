import 'dart:math';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
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
      List<HospitalModel> _hospitalList = await hospitalRepository.fetchHospitals(event.name ?? '');
      List<HospitalModel> hospitalList = [];

      for (var element in _hospitalList) {
        HospitalModel _hospital = element.copyWith(
          id: await aesDecryptor(element.id),
          name: await aesDecryptor(element.name),
          address: await aesDecryptor(element.address),
        );
        hospitalList.add(_hospital);
      }

      if(hospitalList.isNotEmpty) {
        yield state.copyWith(type: 'fetch-hospital-success', status: FormzStatus.submissionSuccess, hospitals: hospitalList);
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
      List<HospitalModel> _hospitalList = await hospitalRepository.fetchHospitalsById(event.id ?? '');
      List<HospitalModel> hospitalList = [];
      for (var element in _hospitalList) {
        HospitalModel _hospital = element.copyWith(
          id: await aesDecryptor(element.id),
          name: await aesDecryptor(element.name),
          address: await aesDecryptor(element.address),
          pin: await aesDecryptor(element.pin),
          pinValidStart: await aesDecryptor(element.pinValidStart),
          pinValidEnd: await aesDecryptor(element.pinValidEnd),
        );
        hospitalList.add(_hospital);
      }
      if(hospitalList.isNotEmpty) {
        await AppSharedPreference.setHospital(hospitalList[0]);
        yield state.copyWith(type: 'fetch-hospital-success', status: FormzStatus.submissionSuccess, hospitals: hospitalList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetch-hospital-failed', hospitals: []);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}