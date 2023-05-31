part of 'notification_bloc.dart';

class NotificationState with FormzMixin {
  final List<NotificationListModel>? listNotification;
  final NotificationListModel? notificationListModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool last;
  final int page;

  NotificationState({
    this.listNotification,
    this.notificationListModel,
    this.type,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.last = false,
    this.page = 0,
  });

  NotificationState copyWith(
      {FormzStatus? submitStatus,
        NotificationListModel? notificationListModel,
        List<NotificationListModel>? listNotification,
        String? type,
        bool? last,
        int? page,
        String? errorMessage}) {
    return NotificationState(
        submitStatus: submitStatus,
        notificationListModel: notificationListModel ?? this.notificationListModel,
        listNotification: listNotification ?? this.listNotification,
        type: type,
        last: last ?? this.last,
        page: page ?? this.page,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class NotificationStateInitial extends NotificationState {}
