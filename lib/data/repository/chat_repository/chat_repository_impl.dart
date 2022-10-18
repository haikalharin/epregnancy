import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
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

  @override
  Future<List<ChatListResponse>> fetchChatList(String fromId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChatListResponse(fromId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ChatPendingPatientResponse>> fetchChatPendingPatient(String fromId, String hospitalId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChatPendingPatient(fromId, hospitalId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ChatResponse>> sendChat(ChatSendRequest _request) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.chatSend(_request);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<ChatPendingResponseList>> fetchChatPendingListByHospitalId(String hospitalId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChatPendingByHospitalId(hospitalId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ChatResponse>> nakesRespondPendingChat(String fromId, String hospitalId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.nakesResponseChatPending(fromId, hospitalId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<ChatListResponse>> fetchArchiveChatByFromIdList(String fromId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchArchiveChatListByFromIdResponse(fromId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<ChatListResponse>> fetchArchiveChatByToIdList(String toId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchArchiveChatListByToIdResponse(toId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<ChatListResponse>> fetchChatListByToId(String toId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChatListByToIdResponse(toId);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<int> endChat(String toId) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.endChat(toId);
    }
    throw NetworkConnectionException();
  }
}