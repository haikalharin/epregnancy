part of 'chat_bloc.dart';

class ChatState {
  final List<ChatPendingResponseList>? listChatPending;
  final List<ChatListResponse>? listChatOngoing;
  final ChatPendingSendResponse? chatPendingSendResponse;
  final ChatPendingPatientResponse? chatPendingPatientResponse;
  final FormzStatus status;
  final String? errorMessage;
  final String? type;

  ChatState(
      {
        this.listChatPending,
        this.listChatOngoing,
        this.chatPendingSendResponse,
        this.chatPendingPatientResponse,
        this.type,
        this.status = FormzStatus.pure,
        this.errorMessage});

  ChatState copyWith(
      {FormzStatus? status,
        List<ChatPendingResponseList>? listChatPending,
        List<ChatListResponse>? listChatOngoing,
        ChatPendingSendResponse? chatPendingSendResponse,
        ChatPendingPatientResponse? chatPendingPatientResponse,
        String? errorMessage,
        String? type
      }) {
    return ChatState(
        status: status ?? this.status,
        listChatPending: listChatPending ?? this.listChatPending,
        listChatOngoing: listChatOngoing ?? this.listChatOngoing,
        chatPendingSendResponse: chatPendingSendResponse ?? this.chatPendingSendResponse,
        chatPendingPatientResponse: chatPendingPatientResponse ?? this.chatPendingPatientResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        type:  type ?? this.type);
  }

  @override
  List<Object> get props => [status];
}

class ChatStateIntial extends ChatState {}