import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../remote_datasource/remote_datasource.dart';

class ChatRepositoryImpl extends ChatRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  ChatRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<List<ChatResponse>> fetchLatestChat() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchLatestChat();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<ChatResponse>> fetchPersonalChatRoom(String toId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchPersonalChatRoom(toId);
    }
    throw NetworkConnectionException();
  }
}