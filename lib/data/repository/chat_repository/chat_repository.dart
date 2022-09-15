
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';

abstract class ChatRepository {
  Future<List<ChatResponse>> fetchLatestChat();
  Future<List<ChatResponse>> fetchPersonalChatRoom(String toId);

}