import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/exceptions/survey_error_exception.dart';
import '../../../../data/model/user_model_api/user_model.dart';
import '../../../../data/shared_preference/app_shared_preference.dart';

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
    } else if (event is FetchChatOngoingEvent) {
      yield* _mapFetchChatOngoingEventToState(event, state);
    } else if (event is FetchChatPendingPatientEvent) {
      yield* _mapFetchChatPendingPatient(event, state);
    } else if (event is DisposeChatBlocEvent) {
      yield ChatState().copyWith(
        type: 'dispose',
        status: FormzStatus.submissionCanceled,
        errorMessage: '',
        chatPendingPatientResponse: null,
        chatPendingSendResponse: null,
        listChatOngoing: null,
        listChatPending: null,
      );
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
      } else {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapFetchChatOngoingEventToState(
      FetchChatOngoingEvent event,
      ChatState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      final UserModel user = await AppSharedPreference.getUser();
      final List<ChatListResponse> listChatOngoing = await chatRepository.fetchChatList(user.id ?? '');
      if (listChatOngoing.isNotEmpty) {
        yield state.copyWith(
            listChatOngoing: listChatOngoing, status: FormzStatus.submissionSuccess, type: 'list-ongoing-success');
      } else {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
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
    yield state.copyWith(status: FormzStatus.submissionInProgress, type:  'send-pending-loading');
    try {
      final ResponseModel<ChatPendingSendResponse> _response = await chatRepository.sendChatPending(event.chatPendingSendRequest);
      if (_response.code == 200) {
        yield state.copyWith(
            chatPendingSendResponse: _response.data, status: FormzStatus.submissionSuccess, type: 'send-pending-success');
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapFetchChatPendingPatient(
      FetchChatPendingPatientEvent event,
      ChatState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetch-active-chat');
    try {
      final UserModel user = await AppSharedPreference.getUser();
      final List<ChatListResponse> listChatOngoing = await chatRepository.fetchChatList(user.id ?? '');
      final ResponseModel<ChatPendingPatientResponse> _response = await chatRepository.fetchChatPendingPatient(user.id ?? '', "452245cb-9f61-41eb-98af-5b8fea270201");
      ChatPendingPatientResponse _chatPendingPatientResponse = _response.data;
      if (_chatPendingPatientResponse.content?.length != 0 || listChatOngoing.isNotEmpty) {
        yield state.copyWith(
            chatPendingPatientResponse: _response.data, listChatOngoing: listChatOngoing, status: FormzStatus.submissionSuccess, type: 'fetch-active-chat-success');
      } else {
        yield state.copyWith(type: 'fetch-active-chat-failed', status: FormzStatus.submissionFailure);
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