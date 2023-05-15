import 'dart:async';

import 'package:PregnancyApp/data/model/notification_model/notification_list_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/notification_repository/notification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.notificationRepository)
      : super(NotificationStateInitial());

  final NotificationRepository notificationRepository;

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is NotificationFetchEvent) {
      yield* _mapNotificationFetchEventToState(event, state);
    }
  }

  Stream<NotificationState> _mapNotificationFetchEventToState(
    NotificationFetchEvent event,
    NotificationState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        type: event.isNextPage
            ? 'get-next-page-notification'
            : 'fetching-notifications');
    try {
      ResponseModel<NotificationListModel>? response;

      if (event.isNextPage) {
        response = await notificationRepository.fetchNotificationList((event.page ?? 0) + 1);
      } else {
        response = await notificationRepository.fetchNotificationList(event.page ?? 0);
      }

      List<NotificationListModel> listNotification = response.data ?? [];
      List<NotificationListModel> listNotificationFix = [];

      if (event.isNextPage) {
        listNotificationFix = state.listNotification ?? [];
      }

      for (var element in listNotification) {
        listNotificationFix.add(element);
      }

      if (listNotificationFix.isNotEmpty) {
        yield state.copyWith(
            listNotification: listNotificationFix,
            submitStatus: FormzStatus.submissionSuccess,
            page: response.pagination?.number,
            last: response.pagination?.last,
            type: 'fetch-notifications-success');
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listNotification: [],
            type: 'notification-is-empty');
      }
    } on Exception catch (a) {
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure,
          type: 'fetch-notifications-failed');
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }
}
