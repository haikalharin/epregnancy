
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/last_chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

import '../../model/chat_model/chat_list_response.dart';

abstract class ChatRepository {
  Future<ResponseModel<ChatResponse>> fetchLatestChat();
  Future<ResponseModel<ChatListResponse>> fetchChatList(String fromId);
  Future<ResponseModel<ChatListResponse>> fetchChatListByToId(String toId);
  Future<ResponseModel<ChatListResponse>> fetchArchiveChatByFromIdList(String fromId);
  Future<ResponseModel<ChatListResponse>> fetchArchiveChatByToIdList(String toId);
  Future<ResponseModel<ChatResponse>> fetchPersonalChatRoom(String toId, bool isArchive);
  Future<ResponseModel<ChatResponse>> nakesRespondPendingChat(String fromId, String hospitalId);
  Future<ResponseModel<LastChatResponse>> lastChatDashboard();

  Future<ResponseModel<ChatPendingResponseList>> fetchChatPendingList();
  Future<ResponseModel<ChatPendingResponseList>> fetchChatPendingListByHospitalId(String hospitalId);
  Future<ResponseModel<ChatPendingSendResponse>> sendChatPending(ChatPendingSendRequest _request);
  Future<ResponseModel<ChatResponse>> sendChat(ChatSendRequest _request);
  Future<ResponseModel<ChatPendingPatientResponse>> fetchChatPendingPatient(String fromId, String hospitalId);
  Future<int> endChat(String toId);
}