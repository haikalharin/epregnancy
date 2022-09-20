
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

abstract class ChatRepository {
  Future<List<ChatResponse>> fetchLatestChat();
  Future<List<ChatResponse>> fetchPersonalChatRoom(String toId);

  Future<List<ChatPendingResponseList>> fetchChatPendingList();
  Future<ResponseModel<ChatPendingSendResponse>> sendChatPending(ChatPendingSendRequest _request);

}