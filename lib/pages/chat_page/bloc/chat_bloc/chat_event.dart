part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent extends Equatable{
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class DisposeChatBlocEvent extends ChatEvent {
  const DisposeChatBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchChatPendingEvent extends ChatEvent {
  const FetchChatPendingEvent();
  @override
  List<Object> get props => [];
}

class FetchChatPendingPatientEvent extends ChatEvent {
  const FetchChatPendingPatientEvent();

  @override
  List<Object> get props => [];
}

class FetchChatOngoingEvent extends ChatEvent {
  const FetchChatOngoingEvent();
  @override
  List<Object> get props => [];
}

class FetchArchiveChatEvent extends ChatEvent {
  const FetchArchiveChatEvent();
  @override
  List<Object> get props => [];
}

class FetchPersonalChatRoom extends ChatEvent {
  const FetchPersonalChatRoom(this.toId, this.isArchive);
  final bool? isArchive;
  final String? toId;

  @override
  List<Object> get props => [];
}

class SendChatPendingEvent extends ChatEvent {
  final ChatPendingSendRequest chatPendingSendRequest;
  const SendChatPendingEvent(this.chatPendingSendRequest);

  @override
  List<Object> get props => [];
}

class SendChatEvent extends ChatEvent {
  final ChatSendRequest chatPendingSendRequest;
  const SendChatEvent(this.chatPendingSendRequest);

  @override
  List<Object> get props => [];
}

class EndChatEvent extends ChatEvent {
  final String? toId;
  const EndChatEvent(this.toId);

  @override
  List<Object> get props => [];
}