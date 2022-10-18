import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/exceptions/survey_error_exception.dart';
import '../../../../data/model/hospital_model/hospital_model.dart';
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
    } else if (event is SendChatEvent) {
      yield* _mapSendChatEvent(event, state);
    } else if (event is EndChatEvent) {
      yield* _mapEndChatEvent(event, state);
    } else if (event is FetchChatOngoingEvent) {
      yield* _mapFetchChatOngoingEventToState(event, state);
    } else if (event is FetchArchiveChatEvent) {
      yield* _mapFetchArchiveChat(event, state);
    } else if (event is FetchChatPendingPatientEvent) {
      yield* _mapFetchChatPendingPatient(event, state);
    } else if (event is FetchPersonalChatRoom) {
      yield* _mapFetchPersonalChatRoom(event, state);
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
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'list-pending');
    try {
      final List<ChatPendingResponseList> listPendingChat =
          await chatRepository.fetchChatPendingList();
      if (listPendingChat.isNotEmpty) {
        yield state.copyWith(
            listChatPending: listPendingChat,
            status: FormzStatus.submissionSuccess,
            type: 'list-pending');
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
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetch-ongoing-loading');
    try {
      final UserModel user = await AppSharedPreference.getUser();
      final List<ChatListResponse> listChatOngoing =
          await chatRepository.fetchChatListByToId(user.id ?? '');
      List<ChatListResponse> listChatOngoingAfterFilter = [];
      for (var element in listChatOngoing) {
        String? _fromId = element.fromId;
        if (listChatOngoingAfterFilter
            .map((item) => item.fromId)
            .contains(_fromId)) {
          print('Already exists!');
        } else {
          listChatOngoingAfterFilter.add(element);
        }
      }
      if (listChatOngoingAfterFilter.isNotEmpty) {
        listChatOngoingAfterFilter.reversed;
        yield state.copyWith(
            listChatOngoing: listChatOngoingAfterFilter,
            status: FormzStatus.submissionSuccess,
            type: 'list-ongoing-success');
      } else {
        yield state.copyWith(status: FormzStatus.submissionSuccess, type: 'list-ongoing-empty', listChatOngoing: []);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapFetchPersonalChatRoom(
    FetchPersonalChatRoom event,
    ChatState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'chat-room-loading');
    try {
      final List<ChatResponse> _response =
          await chatRepository.fetchPersonalChatRoom(event.toId!);
      if (_response.isNotEmpty) {
        yield state.copyWith(
            listPersonalChatRoom: _response,
            status: FormzStatus.submissionSuccess,
            type: 'chat-room-success');
      } else {
        yield state.copyWith(
            listPersonalChatRoom: _response,
            status: FormzStatus.submissionSuccess,
            type: 'chat-room-empty');
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapSendChatEvent(
    SendChatEvent event,
    ChatState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'send-chat-loading');
    try {
      final ResponseModel<ChatResponse> _response =
          await chatRepository.sendChat(event.chatPendingSendRequest);
      if (_response.code == 200) {
        yield state.copyWith(
            sendChatResponse: _response.data,
            status: FormzStatus.submissionSuccess,
            type: 'send-chat-success');
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapEndChatEvent(
      EndChatEvent event,
      ChatState state,
      ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'end-chat-loading');
    try {
      final int _response = await chatRepository.endChat(event.toId!);
      if (_response == 200) {
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            type: 'end-chat-success');
      } else {
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            type: 'end-chat-failed');
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
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'send-pending-loading');
    try {
      final ResponseModel<ChatPendingSendResponse> _response =
          await chatRepository.sendChatPending(event.chatPendingSendRequest);
      if (_response.code == 200) {
        yield state.copyWith(
            chatPendingSendResponse: _response.data,
            status: FormzStatus.submissionSuccess,
            type: 'send-pending-success');
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
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'fetch-active-chat');
    try {
      List<ChatResponse>? personalChatRoomList = [];
      final UserModel user = await AppSharedPreference.getUser();
      final HospitalModel _hospital = await AppSharedPreference.getHospital();
      final List<ChatListResponse> listChatOngoing =
          await chatRepository.fetchChatList(user.id ?? '');
      final ResponseModel<ChatPendingPatientResponse> _response =
          await chatRepository.fetchChatPendingPatient(
              user.id ?? '', _hospital.id ?? '');
      ChatPendingPatientResponse _chatPendingPatientResponse = _response.data;
      if (listChatOngoing.isNotEmpty) {
        String? toId;
        if (listChatOngoing[0].fromId == user.id) {
          toId = listChatOngoing[0].toId;
        } else {
          toId = listChatOngoing[0].fromId;
        }
        personalChatRoomList =
            await chatRepository.fetchPersonalChatRoom(toId!);
      }

      if (_chatPendingPatientResponse.content?.length != 0 ||
          listChatOngoing.isNotEmpty) {
        yield state.copyWith(
            chatPendingPatientResponse: _response.data,
            listChatOngoing: listChatOngoing,
            listPersonalChatRoom: personalChatRoomList,
            status: FormzStatus.submissionSuccess,
            type: 'fetch-active-chat-success');
      } else {
        yield state.copyWith(
            type: 'fetch-active-chat-failed',
            status: FormzStatus.submissionFailure);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<ChatState> _mapFetchArchiveChat(
    FetchArchiveChatEvent event,
    ChatState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, type: 'archive-chat-loading');
    try {
      final UserModel user = await AppSharedPreference.getUser();
      List<ChatListResponse?> _archiveByFrom = [];
      List<ChatListResponse?> _archiveByTo = [];
      final List<ChatListResponse> listArchiveChatByFromId =
          await chatRepository.fetchArchiveChatByFromIdList(user.id ?? '');
      final List<ChatListResponse> listArchiveChatByToId =
          await chatRepository.fetchArchiveChatByToIdList(user.id ?? '');

      if (listArchiveChatByFromId.length != 0){
        String? toId;
        for (var element in listArchiveChatByFromId) {
          String? _fromId = user.id == element.fromId ? element.fromId : element.toId;
          if(toId != element.toId){
            toId = element.toId;
          }

          if ((_archiveByFrom.singleWhere((it) => it?.fromId == _fromId && it?.toId == toId,
              orElse: () => null)) != null) {
            print('Already exists!');
          } else {
            _archiveByFrom.add(element);
          }
        }
      }

      if (listArchiveChatByToId.length != 0){
        String? fromId;
        for (var element in listArchiveChatByToId) {
          String? _toId = user.id == element.toId ? element.toId : element.fromId;
          if(fromId != element.fromId){
            fromId = element.toId;
          }
          if ((_archiveByTo.singleWhere((it) => it?.fromId == _toId && it?.toId == fromId,
              orElse: () => null)) != null) {
            print('Already exists!');
          } else {
            _archiveByTo.add(element);
          }
        }
      }

      print('byto lenght : ${_archiveByTo.length}');
      print('byfrom lenght : ${_archiveByFrom.length}');

      if (_archiveByTo.isNotEmpty || _archiveByFrom.isNotEmpty) {
        yield state.copyWith(
            listArchiveChatByFrom: _archiveByFrom,
            listArchiveChatByTo: _archiveByTo,
            status: FormzStatus.submissionSuccess,
            type: 'archive-chat-success');
      } else {
        yield state.copyWith(
            type: 'archive-chat--failed',
            listArchiveChatByFrom: [],
            listArchiveChatByTo: [],
            status: FormzStatus.submissionFailure);
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
