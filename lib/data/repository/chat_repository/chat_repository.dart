
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

import '../../model/chat_model/chat_list_response.dart';

abstract class ChatRepository {
  Future<List<ChatResponse>> fetchLatestChat();
  Future<List<ChatListResponse>> fetchChatList(String fromId);
  Future<List<ChatResponse>> fetchPersonalChatRoom(String toId);

  Future<List<ChatPendingResponseList>> fetchChatPendingList();
  Future<ResponseModel<ChatPendingSendResponse>> sendChatPending(ChatPendingSendRequest _request);
  Future<ResponseModel<ChatResponse>> sendChat(ChatSendRequest _request);
  Future<ResponseModel<ChatPendingPatientResponse>> fetchChatPendingPatient(String fromId, String hospitalId);

}