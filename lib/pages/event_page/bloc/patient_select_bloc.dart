import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'parient_select_state.dart';
part 'patient_select_event.dart';

class PatientSelectBloc extends Bloc<PatientSelectEvent, PatientSelectState> {
  PatientSelectBloc(this.userRepository) : super(PatientSelectBlocInitialState());
  final UserRepository userRepository;

  @override
  Stream<PatientSelectState> mapEventToState(PatientSelectEvent event) async* {
    if(event is FetchPatientEvent) {
      yield* _mapFetchPatientSelectEvent(event, state);
    }
  }

  Stream<PatientSelectState> _mapFetchPatientSelectEvent(
      FetchPatientEvent event,
      PatientSelectState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-users', users: []);
    try {
      final ResponseModel<UserModel> response = await userRepository.fetchUsers(event.name ?? '');
      List<UserModel> _users = response.data ?? [];

      if(response.code == 200) {
        List<UserModel> usersEntity = [];
        for(var user in _users){
          UserModel decryptedUser = user.copyWith(
            id: await aesDecryptor(user.id),
            name: await aesDecryptor(user.name)
          );
          usersEntity.add(decryptedUser);
        }

        yield state.copyWith(type: 'fetch-user-success', status: FormzStatus.submissionSuccess, users: usersEntity);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetch-user-failed', users: []);
      }
    } catch(e) {
      print('user failed : $e');
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }
}