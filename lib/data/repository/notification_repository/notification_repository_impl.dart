
import 'package:PregnancyApp/data/model/notification_model/notification_list_model.dart';

import 'package:PregnancyApp/data/model/response_model/response_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  NotificationRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel<NotificationListModel>> fetchNotificationList(int page) async{
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchNotification(page: page);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> readNotification(String? id) async {
    if (await networkInfo.isConnected) {
      Map data = {
        "id": id,
        "read": true
      };

      return remoteDatasource.readNotification(data);
    }
    throw NetworkConnectionException();
  }

}