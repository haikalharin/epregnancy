import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../common/constants/app_constants.dart';
import '../../../common/exceptions/home_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/injector/injector.dart';
import '../../../data/model/point_model/checkin_entity.dart';
import '../../../data/model/point_model/checkin_response.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/date_formatter.dart';
import '../../home_page/bloc/home_page_bloc.dart';

part 'poin_event.dart';

part 'poin_state.dart';

class PoinBloc extends Bloc<PoinEvent, PoinState> {
  PoinBloc(this.userRepository) : super(PoinStateInitial());
  final UserRepository userRepository;

  @override
  Stream<PoinState> mapEventToState(PoinEvent event) async* {
    if (event is PoinInitialEvent) {
      yield* _mapPoinStateCheckIn(event, state);
    } else if (event is PoinCheckInEvent) {
      yield* _mapCheckInEventResult(event, state);
    }
  }

  Stream<PoinState> _mapCheckInEventResult(
    PoinCheckInEvent event,
    PoinState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: "check-in-event");
    List<CheckInEntity>? _currentEntityList = state.checkInEntityList;
    try {
      ResponseModel<CheckinResponse> checkInResponse =
          await userRepository.hitCheckIn(event.day.toString());
      int pointEarn = 0;
      int currentPoint = state.totalPoint ?? 0;


      if (checkInResponse.code == 200) {
        pointEarn = checkInResponse.data.pointsEarned;
        int newTotalPoint = currentPoint + pointEarn;
        _currentEntityList![state.todayIndex!].done = true;

        // sync point_model value in homescreen
        Injector.resolve<HomePageBloc>().add(const PointFetchEvent());

        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            totalPoint: newTotalPoint,
            checkInDoneForToday: true,
            checkInEntityList: _currentEntityList);
      }
    } catch(e) {
      yield state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.toString());
    }
  }

  Stream<PoinState> _mapPoinStateCheckIn(
    PoinInitialEvent event,
    PoinState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: "check-in initial");
    try {
      String? installDate =
          await AppSharedPreference.getString(AppConstants.installDateKey);
      DateTime startDate =
          DateFormatter.dateFormatForCheckinFilter.parse(installDate ?? DateTime.now().toString());
      String today =
          DateFormatter.dateFormatForCheckinFilter.format(DateTime.now());
      bool checkInDoneForToday = false;
      List<Checkin>? _checkIns = [];
      UserModel _userInfo = await AppSharedPreference.getUser();
      _checkIns = _userInfo.checkins;

      //generate 7 day from install date for hari ke checkin
      final _checkinDateList = List<CheckInEntity>.generate(7, (i) {
        String _plusDate = DateFormatter.dateFormatForCheckinFilter
            .format(startDate.add(Duration(days: i)));
        bool hasCheckIn = _checkIns!.any((e) => e.date == _plusDate || e.day == i + 1);
        if (hasCheckIn) {
          return CheckInEntity(done: true, date: _plusDate, day: i + 1);
        } else {
          return CheckInEntity(done: false, date: _plusDate, day: i + 1);
        }
      });
      int? dayForPayload;
      int? todayIndex = _checkinDateList
          .indexWhere((element) => (element.date == today.toString()));
      if (todayIndex != -1) {
        if (_checkinDateList[todayIndex].done == true) {
          checkInDoneForToday = true;
        } else {
          dayForPayload = _checkinDateList[todayIndex].day;
        }
      }

      yield state.copyWith(
        status: FormzStatus.submissionSuccess,
        today: today,
        todayIndex: todayIndex,
        checkInEntityList: _checkinDateList,
        type: 'check-in-state',
        checkInDoneForToday: checkInDoneForToday,
        installDate: installDate,
        totalPoint: event.currentPoint,
        dayForPayload: dayForPayload,
      );
    } on PointErrorException catch (e) {
      print(e);
      yield state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: "Terjadi Kesalahan, Silahkan Coba Lagi");
    }
  }
}
