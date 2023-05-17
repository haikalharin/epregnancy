part of 'child_list_bloc.dart';

@immutable
abstract class ChildListEvent extends Equatable {
  const ChildListEvent();

  @override
  List<Object> get props => [];
}

class FetchChildListEvent extends ChildListEvent {
  const FetchChildListEvent();

  @override
  List<Object> get props => [];
}

class AddChildGrowthEvent extends ChildListEvent {
  const AddChildGrowthEvent(
      {this.babyId,
      this.visitDate,
      this.length,
      this.weight,
      this.headCircumference});

  final String? babyId;
  final String? visitDate;
  final double? length;
  final double? weight;
  final double? headCircumference;

  @override
  List<Object> get props => [];
}
