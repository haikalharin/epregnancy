part of 'point_history_bloc.dart';

@immutable
abstract class PointHistoryEvent extends Equatable {
  const PointHistoryEvent();

  @override
  List<Object> get props => [];
}

class FetchPointHistoryEvent extends PointHistoryEvent {
  const FetchPointHistoryEvent();

  @override
  List<Object> get props => [];
}