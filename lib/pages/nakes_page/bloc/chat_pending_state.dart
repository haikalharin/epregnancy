part of 'chat_pending_bloc.dart';

class ChatPendingState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final List<ChatPendingResponseList>? chatPendingList;
  final List<ChatResponse>? chatPendingResponseList;

  ChatPendingState(
      {this.chatPendingList, this.type, this.status, this.errorMessage, this.chatPendingResponseList});

  ChatPendingState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        List<ChatPendingResponseList>? chatPendingList,
        List<ChatResponse>? chatPendingResponseList}) {
    return ChatPendingState(
        type: type ?? this.type,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        chatPendingList: chatPendingList ?? this.chatPendingList,
        chatPendingResponseList: chatPendingResponseList ?? this.chatPendingResponseList
    );
  }
}

class ChatPendingBlocInitialState extends ChatPendingState {}