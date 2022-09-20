import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
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

  @override
  Future<List<ChatPendingResponseList>> fetchChatPendingList() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChatPendingList();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ChatPendingSendResponse>> sendChatPending(ChatPendingSendRequest _request) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.chatPendingSend(_request);
    }
    throw NetworkConnectionException();
  }
}