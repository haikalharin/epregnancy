import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../data/model/chat_model/chat_response.dart';

part 'chat_pending_event.dart';
part 'chat_pending_state.dart';

class ChatPendingBloc extends Bloc<ChatPendingEvent, ChatPendingState> {
  ChatPendingBloc(this.chatRepository) : super(ChatPendingBlocInitialState());
  final ChatRepository chatRepository;

  @override
  Stream<ChatPendingState> mapEventToState(ChatPendingEvent event) async* {
    if(event is FetchChatPendingByHospitalId) {
      yield* _mapFetchChatPendingEvent(event, state);
    } else if (event is RespondPendingChat) {
      yield* _mapRespondPendingChat(event, state);
    }
  }

  Stream<ChatPendingState> _mapFetchChatPendingEvent(
      FetchChatPendingByHospitalId event,
      ChatPendingState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-chat-pending-loading', chatPendingList: []);
    try {
      List<ChatPendingResponseList> chatPendingList = await chatRepository.fetchChatPendingListByHospitalId(event.hospitalId ?? '');
      if(chatPendingList.isNotEmpty) {
        yield state.copyWith(type: 'fetching-chat-pending-success', status: FormzStatus.submissionSuccess, chatPendingList: chatPendingList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetching-chat-pending-failed', chatPendingList: []);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }

  Stream<ChatPendingState> _mapRespondPendingChat(
      RespondPendingChat event,
      ChatPendingState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'responding-pending-chat-loading', chatPendingResponseList: []);
    try {
      ResponseModel<ChatResponse> _chatList = await chatRepository.nakesRespondPendingChat(event.fromId!, event.hospitalId!);
      if(_chatList.code == 200) {
        List<ChatResponse> chatList = await chatRepository.fetchPersonalChatRoom(_chatList.data.toId!, false);
        yield state.copyWith(type: 'responding-pending-chat-success', status: FormzStatus.submissionSuccess, chatPendingResponseList: chatList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'responding-pending-chat-failed', chatPendingResponseList: []);
      }
    } catch(e) {
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'responding-pending-chat-error', errorMessage: e.toString());
    }
  }
}