import 'package:PregnancyApp/data/model/notification_model/notification_list_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

abstract class NotificationRepository {
  Future<ResponseModel<NotificationListModel>> fetchNotificationList(int page);
}