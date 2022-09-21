part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent extends Equatable{
  const ChatEvent();

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

class SendChatPendingEvent extends ChatEvent {
  final ChatPendingSendRequest chatPendingSendRequest;
  const SendChatPendingEvent(this.chatPendingSendRequest);

  @override
  List<Object> get props => [];
}