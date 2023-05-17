part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationFetchEvent extends NotificationEvent {
  const NotificationFetchEvent(this.page, {this.isNextPage = false});
  final int? page;
  final bool isNextPage;

  @override
  List<Object> get props => [];
}

class NotificationReadEvent extends NotificationEvent {
  const NotificationReadEvent(this.id);
  final String id;

  @override
  List<Object> get props => [];
}
