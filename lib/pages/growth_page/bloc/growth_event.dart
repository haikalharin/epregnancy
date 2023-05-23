part of 'growth_bloc.dart';

@immutable
abstract class GrowthEvent extends Equatable {
  const GrowthEvent();

  @override
  List<Object> get props => [];
}

class FetchGrowthEvent extends GrowthEvent {
  const FetchGrowthEvent(this.id);
  final String? id;

  @override
  List<Object> get props => [];
}