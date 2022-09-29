import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc(this.hospitalRepository) : super(HospitalBlocInitialState());
  final HospitalRepository hospitalRepository;

  @override
  Stream<HospitalState> mapEventToState(HospitalEvent event) async* {
    if(event is FetchHospitalsEvent) {
      yield* _mapFetchHospitalEvent(event, state);
    }
  }

  Stream<HospitalState> _mapFetchHospitalEvent(
      FetchHospitalsEvent event,
      HospitalState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-hospital', hospitals: []);
    try {
      List<HospitalModel> hospitalList = await hospitalRepository.fetchHospitals(event.name ?? '');
      if(hospitalList.isNotEmpty) {
        yield state.copyWith(type: 'fetch-hospital-success', status: FormzStatus.submissionSuccess, hospitals: hospitalList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetch-hospital-failed', hospitals: []);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}