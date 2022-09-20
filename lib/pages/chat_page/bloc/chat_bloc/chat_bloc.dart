import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/exceptions/survey_error_exception.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this.chatRepository) : super(ChatStateIntial());

  final ChatRepository chatRepository;

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is FetchChatPendingEvent) {
      yield* _mapFetchPendingChatEventToState(event, state);
    } else if (event is SendChatPendingEvent) {
      yield* _mapSendChatPendingEvent(event, state);
    }
  }

  Stream<ChatState> _mapFetchPendingChatEventToState(
      FetchChatPendingEvent event,
      ChatState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'list-pending');
    try {
      final List<ChatPendingResponseList> listPendingChat = await chatRepository.fetchChatPendingList();
      if (listPendingChat.isNotEmpty) {
        yield state.copyWith(
            listChatPending: listPendingChat, status: FormzStatus.submissionSuccess, type: 'list-pending');
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapSendChatPendingEvent(
      SendChatPendingEvent event,
      ChatState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      final ResponseModel<ChatPendingSendResponse> _response = await chatRepository.sendChatPending(event.chatPendingSendRequest);
      if (_response.code == 200) {
        yield state.copyWith(
            chatPendingSendResponse: _response.data, status: FormzStatus.submissionSuccess, type: 'send-pending');
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
}