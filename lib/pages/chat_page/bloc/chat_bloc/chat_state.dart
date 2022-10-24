part of 'chat_bloc.dart';

class ChatState {
  final List<ChatPendingResponseList>? listChatPending;
  final List<ChatListResponse>? listChatOngoing;
  final List<ChatListResponse?>? listArchiveChatByFrom;
  final List<ChatListResponse?>? listArchiveChatByTo;
  final List<ChatResponse>? listPersonalChatRoom;
  final ChatResponse? sendChatResponse;
  final ChatPendingSendResponse? chatPendingSendResponse;
  final List<Content>? chatPendingPatientResponse;
  final FormzStatus status;
  final String? errorMessage;
  final String? type;

  ChatState(
      {
        this.listChatPending,
        this.listChatOngoing,
        this.listArchiveChatByFrom,
        this.listArchiveChatByTo,
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
        List<ChatListResponse?>? listArchiveChatByFrom,
        List<ChatListResponse?>? listArchiveChatByTo,
        List<ChatResponse>? listPersonalChatRoom,
        ChatResponse? sendChatResponse,
        ChatPendingSendResponse? chatPendingSendResponse,
        List<Content>? chatPendingPatientResponse,
        String? errorMessage,
        String? type
      }) {
    return ChatState(
        status: status ?? this.status,
        listChatPending: listChatPending ?? this.listChatPending,
        listChatOngoing: listChatOngoing ?? this.listChatOngoing,
        listArchiveChatByFrom: listArchiveChatByFrom ?? this.listArchiveChatByFrom,
        listArchiveChatByTo: listArchiveChatByFrom ?? this.listArchiveChatByTo,
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