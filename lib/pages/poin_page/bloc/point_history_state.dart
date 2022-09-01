part of 'point_history_bloc.dart';

class PointHistoryState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final List<PointHistory>? pointHistories;

  PointHistoryState(
      {this.pointHistories, this.type, this.status, this.errorMessage});

  PointHistoryState copyWith(
      {FormzStatus? status,
      String? type,
      String? errorMessage,
      List<PointHistory>? pointHistories}) {
    return PointHistoryState(
        type: type ?? this.type,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        pointHistories: pointHistories ?? this.pointHistories);
  }
}

class PointHistoryInitialState extends PointHistoryState {}
