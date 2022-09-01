part of 'poin_bloc.dart';

@immutable
abstract class PoinEvent extends Equatable {
  const PoinEvent();

  @override
  List<Object> get props => [];
}

class PoinInitialEvent extends PoinEvent {
  const PoinInitialEvent(this.currentPoint);
  final int? currentPoint;

  @override
  List<Object> get props => [];
}

class PoinCheckInEvent extends PoinEvent {
  const PoinCheckInEvent(this.day);
  final int? day;

  @override
  List<Object> get props => [];
}
