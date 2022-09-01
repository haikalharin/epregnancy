part of 'poin_bloc.dart';

class PoinState {
  final String? installDate;
  final List<CheckInEntity>? checkInEntityList;
  final String? today;
  final int? dayForPayload;
  final int? todayIndex;
  final bool? checkInDoneForToday;
  final int? totalPoint;
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;

  PoinState(
      {this.installDate,
      this.checkInDoneForToday,
      this.todayIndex,
      this.today,
        this.dayForPayload,
      this.checkInEntityList,
      this.totalPoint,
      this.status,
      this.type,
      this.errorMessage});

  PoinState copyWith(
      {FormzStatus? status,
      String? installDate,
      bool? checkInDoneForToday,
      int? todayIndex,
        int? dayForPayload,
      String? today,
      int? totalPoint,
      List<CheckInEntity>? checkInEntityList,
      String? type,
      String? errorMessage}) {
    return PoinState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      installDate: installDate ?? this.installDate,
      checkInDoneForToday: checkInDoneForToday ?? this.checkInDoneForToday,
      todayIndex: todayIndex ?? this.todayIndex,
      today: today ?? this.today,
      totalPoint: totalPoint ?? this.totalPoint,
      checkInEntityList: checkInEntityList ?? this.checkInEntityList,
      type: type ?? this.type,
        dayForPayload: dayForPayload ?? this.dayForPayload
    );
  }
}

class PoinStateInitial extends PoinState {}
