part of 'child_list_bloc.dart';

@immutable
abstract class ChildListEvent extends Equatable{
  const ChildListEvent();

  @override
  List<Object> get props => [];
}

class FetchChildListEvent extends ChildListEvent {
  const FetchChildListEvent();

  @override
  List<Object> get props => [];
}