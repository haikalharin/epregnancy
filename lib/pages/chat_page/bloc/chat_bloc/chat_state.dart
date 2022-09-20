part of 'chat_bloc.dart';

class ChatState {
  final List<ChatPendingResponseList>? listChatPending;
  final ChatPendingSendResponse? chatPendingSendResponse;
  final FormzStatus status;
  final String? errorMessage;
  final String? type;

  ChatState(
      {
        this.listChatPending,
        this.chatPendingSendResponse,
        this.type,
        this.status = FormzStatus.pure,
        this.errorMessage});

  ChatState copyWith(
      {FormzStatus? status,
        List<ChatPendingResponseList>? listChatPending,
        ChatPendingSendResponse? chatPendingSendResponse,
        String? errorMessage,
        String? type
      }) {
    return ChatState(
        status: status ?? this.status,
        listChatPending: listChatPending ?? this.listChatPending,
        chatPendingSendResponse: chatPendingSendResponse ?? this.chatPendingSendResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        type:  type ?? this.type);
  }

  @override
  List<Object> get props => [status];
}

class ChatStateIntial extends ChatState {}