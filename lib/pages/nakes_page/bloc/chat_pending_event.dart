part of 'chat_pending_bloc.dart';

abstract class ChatPendingEvent extends Equatable {
  const ChatPendingEvent();

  @override
  List<Object> get props => [];
}

class FetchChatPendingByHospitalId extends ChatPendingEvent {
  const FetchChatPendingByHospitalId(this.hospitalId);
  final String? hospitalId;

  @override
  List<Object> get props => [hospitalId ?? ""];
}

class RespondPendingChat extends ChatPendingEvent {
  const RespondPendingChat({required this.hospitalId, required this.fromId});
  final String? hospitalId;
  final String? fromId;

  @override
  List<Object> get props => [];
}