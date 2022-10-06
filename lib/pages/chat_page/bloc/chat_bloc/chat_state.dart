part of 'chat_bloc.dart';

class ChatState {
  final List<ChatPendingResponseList>? listChatPending;
  final List<ChatListResponse>? listChatOngoing;
  final List<ChatListResponse>? listArchiveChat;
  final List<ChatResponse>? listPersonalChatRoom;
  final ChatResponse? sendChatResponse;
  final ChatPendingSendResponse? chatPendingSendResponse;
  final ChatPendingPatientResponse? chatPendingPatientResponse;
  final FormzStatus status;
  final String? errorMessage;
  final String? type;

  ChatState(
      {
        this.listChatPending,
        this.listChatOngoing,
        this.listArchiveChat,
        this.sendChatResponse,
        this.listPersonalChatRoom,
        this.chatPendingSendResponse,
        this.chatPendingPatientResponse,
        this.type,
        this.status = FormzStatus.pure,
        this.errorMessage});

  ChatState copyWith(
      {FormzStatus? status,
        List<ChatPendingResponseList>? listChatPending,
        List<ChatListResponse>? listChatOngoing,
        List<ChatListResponse>? listArchiveChat,
        List<ChatResponse>? listPersonalChatRoom,
        ChatResponse? sendChatResponse,
        ChatPendingSendResponse? chatPendingSendResponse,
        ChatPendingPatientResponse? chatPendingPatientResponse,
        String? errorMessage,
        String? type
      }) {
    return ChatState(
        status: status ?? this.status,
        listChatPending: listChatPending ?? this.listChatPending,
        listChatOngoing: listChatOngoing ?? this.listChatOngoing,
        listArchiveChat: listArchiveChat ?? this.listArchiveChat,
        listPersonalChatRoom: listPersonalChatRoom ?? this.listPersonalChatRoom,
        chatPendingSendResponse: chatPendingSendResponse ?? this.chatPendingSendResponse,
        sendChatResponse: sendChatResponse ?? this.sendChatResponse,
        chatPendingPatientResponse: chatPendingPatientResponse ?? this.chatPendingPatientResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        type:  type ?? this.type);
  }

  @override
  List<Object> get props => [status];
}

class ChatStateIntial extends ChatState {}