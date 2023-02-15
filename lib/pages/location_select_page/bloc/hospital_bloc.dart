import 'dart:math';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/members_model/members_summary_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/hospital_repository/hospital_repository.dart';
import 'package:PregnancyApp/pages/members_page/members_page.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/model/members_model/member.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'hospital_event.dart';

part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  HospitalBloc(this.hospitalRepository, this.userRepository)
      : super(HospitalBlocInitialState());
  final HospitalRepository hospitalRepository;
  final UserRepository userRepository;

  @override
  Stream<HospitalState> mapEventToState(HospitalEvent event) async* {
    if (event is FetchHospitalsEvent) {
      yield* _mapFetchHospitalEvent(event, state);
    } else if (event is FetchHospitalsByIdEvent) {
      yield* _mapFetchHospitalByIdEvent(event, state);
    }
    else if (event is ChangeHospitalEvent) {
      yield* _mapChangeHospital(event, state);
    } else if (event is FetchMemberSummaryEvent) {
      yield* _mapMembersSummaryEvent(event, state);
    } else if (event is FetchMembersEvent) {
      yield* _mapMembersEvent(event, state);
    } else if (event is FetchMidwifesEvent) {
      yield* _mapMidwifesEvent(event, state);
    }
  }



  Stream<HospitalState> _mapFetchHospitalEvent(
    FetchHospitalsEvent event,
    HospitalState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress,
        type: 'fetching-hospital',
        hospitals: []);
    try {
      final ResponseModel<HospitalModel> response =
          await hospitalRepository.fetchHospitals(event.name ?? '');

      if (response.code == 200) {
        List<HospitalModel> _hospitalList = response.data ?? [];
        yield state.copyWith(
            type: 'fetch-hospital-success',
            status: FormzStatus.submissionSuccess,
            hospitals: _hospitalList);
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            type: 'fetch-hospital-failed',
            hospitals: []);
      }
    } catch (e) {
      print('hospital failed : $e');
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapMembersSummaryEvent(
    FetchMemberSummaryEvent event,
    HospitalState state,
  ) async* {
    // yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-hospital', hospitals: []);
    try {
      final ResponseModel<MembersSummaryResponse> response =
          await hospitalRepository.fetchMembersSummary();
      MembersSummaryResponse membersSummaryResponse = response.data;
      if (response.code == 200) {
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            midwifeAmount: membersSummaryResponse.totalMidwife.toString(),
            patientAmount: membersSummaryResponse.totalPatient.toString());
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            midwifeAmount: "0",
            patientAmount: "0");
      }
    } catch (e) {
      print('hospital failed : $e');
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapMembersEvent(
    FetchMembersEvent event,
    HospitalState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress,
        type: 'fetching-member',
        members: []);
    try {
      var sort = "asc";
      if (event.sort == SortEnum.desc) {
        sort = "desc";
      }
      ResponseModel response = ResponseModel.dataEmpty();
      if(event.isNextPage){
        yield state.copyWith(
            status: FormzStatus.submissionInProgress,
            type: 'get-next-page-member',
            members: state.members);
       response =
        await hospitalRepository.fetchMembers(
            event.name ?? "",
            state.page + 1,
            event.isPregnant ?? true,
            event.sortBy ?? "name",
            sort);

      } else {
       response =
        await hospitalRepository.fetchMembers(
            event.name ?? "",
            event.page ?? 0,
            event.isPregnant ?? true,
            event.sortBy ?? "name",
            sort);
      }
      List<Member> _members = response.data ?? [];
      List<Member> members = [];
      if(event.isNextPage){
        members = state.members??[];
      }
      for (var element in _members) {
        Member? member = element.copyWith(
          name: await aesDecryptor(element.name),
        );
        members.add(member);
      }
      if (response.code == 200) {
        List<Member> allMembers = List<Member>.from(state.members ?? [])
          ..addAll(members);
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            type: 'fetch-member-success',
            members: members,
            page: response.pagination?.number,
            isSearch: event.isSearch,
            isPregnant: event.isPregnant,
            sort: event.sort,
            sortBy: event.sortBy,
            name: event.name,
            lastPagePatient: response.pagination?.last);
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure, type: 'fetch-member-failed');
      }
    } catch (e) {
      print('members failed : $e');
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapMidwifesEvent(
    FetchMidwifesEvent event,
    HospitalState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress,
        type: 'fetching-midwifes',
        midwifes: []);
    try {
      final ResponseModel<Member> response = await hospitalRepository
          .fetchMidwifes(event.name ?? "", event.page ?? 0);
      List<Member> _midwifes = response.data ?? [];
      List<Member> midwifes = [];
      for (var element in _midwifes) {
        Member? member = element.copyWith(
          name: await aesDecryptor(element.name),
        );
        midwifes.add(member);
      }
      if (response.code == 200) {
        List<Member> allMembers = List<Member>.from(state.midwifes ?? [])
          ..addAll(midwifes);
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            type: 'fetch-midwifes-success',
            midwifes: midwifes,
            lastPageMidwife: response.pagination?.last);
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            type: 'fetch-midwifes-failed');
      }
    } catch (e) {
      print('midwifes failed : $e');
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapFetchHospitalByIdEvent(
    FetchHospitalsByIdEvent event,
    HospitalState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress,
        type: 'fetching-hospital',
        hospitals: []);
    try {
      final ResponseModel<HospitalModel> response =
          await hospitalRepository.fetchHospitalsById(event.id ?? '');

      if (response.code == 200) {
        List<HospitalModel> _hospitalList = response.data ?? [];
        await AppSharedPreference.setHospital(_hospitalList[0]);
        yield state.copyWith(
            type: 'fetch-hospital-success',
            status: FormzStatus.submissionSuccess,
            hospitals: _hospitalList);
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            type: 'fetch-hospital-failed',
            hospitals: []);
      }
    } catch (e) {
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

  Stream<HospitalState> _mapChangeHospital(
    ChangeHospitalEvent event,
    HospitalState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'change-hospital');
    try {
      final ResponseModel response =
          await userRepository.updateHospital(event.id ?? '');

      if (response.code == 200) {
        yield state.copyWith(
            type: 'change-hospital-success',
            status: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            type: 'change-hospital-failed',
            hospitals: []);
      }
    } catch (e) {
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure,
          type: 'Change Hospital Error',
          errorMessage: e.toString());
    }
  }
}
