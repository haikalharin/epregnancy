import 'package:PregnancyApp/data/model/chat_model/chat_list_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_pending_send_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/chat_model/chat_send_request.dart';
import 'package:PregnancyApp/data/model/chat_model/patient/chat_pending_patient_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
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
      final List<ChatPendingResponseList> _listPendingChat = await chatRepository.fetchChatPendingList();
      List<ChatPendingResponseList> listPendingChat = [];

      for(var element in _listPendingChat) {
        FromChatPendingResponseLIst? _from = element.from?.copyWith(
          id: await aesDecryptor(element.from?.id),
          name: await aesDecryptor(element.from?.name),
          imageUrl: await aesDecryptor(element.from?.imageUrl),
        );

        FromChatPendingResponseLIst? from = _from?.copyWith(
            imageUrl: _from.imageUrl == null || _from.imageUrl!.contains("http") ? _from.imageUrl : await aesDecryptor(_from.imageUrl)
        );

        Hospital? _hospital = element.hospital?.copyWith(
          id: await aesDecryptor(element.hospital?.id),
          alias: await aesDecryptor(element.hospital?.alias),
          name: await aesDecryptor(element.hospital?.name),
          address: await aesDecryptor(element.hospital?.address),
          imageUrl: await aesDecryptor(element.hospital?.imageUrl),
        );

        Hospital? hospital = _hospital?.copyWith(
            imageUrl: _hospital.imageUrl == null || _hospital.imageUrl!.contains("http") ? _hospital.imageUrl : await aesDecryptor(_hospital.imageUrl)
        );

        ChatPendingResponseList _content = element.copyWith(
            id: await aesDecryptor(element.id),
            fromId: await aesDecryptor(element.fromId),
            hospitalId: await aesDecryptor(element.hospitalId),
            from: from,
            hospital: hospital
        );
        listPendingChat.add(_content);
      }
      // todo
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
      final List<ChatListResponse> listChatOngoing = await chatRepository.fetchChatListByToId(user.id ?? '');
      List<ChatListResponse> onGoingChats = [];

      if(listChatOngoing.length != 0){
        for(var onGoingChat in listChatOngoing){
          FromChatListResponse? _from = onGoingChat.from?.copyWith(
            id: await aesDecryptor(onGoingChat.from?.id),
            name: await aesDecryptor(onGoingChat.from?.name),
            imageUrl: onGoingChat.from?.imageUrl == null ? onGoingChat.from?.imageUrl : await aesDecryptor(onGoingChat.from?.imageUrl),
          );

          FromChatListResponse? from = _from?.copyWith(
            imageUrl: _from.imageUrl == null || _from.imageUrl!.contains("http") ? _from.imageUrl : await aesDecryptor(_from.imageUrl)
          );

          FromChatListResponse? _to = onGoingChat.to?.copyWith(
            id: await aesDecryptor(onGoingChat.to?.id),
            name: await aesDecryptor(onGoingChat.to?.name),
            imageUrl: onGoingChat.to?.imageUrl == null ? onGoingChat.to?.imageUrl :await aesDecryptor(onGoingChat.to?.imageUrl),
          );

          FromChatListResponse? to = _to?.copyWith(
              imageUrl: _to.imageUrl == null || _to.imageUrl!.contains("http") ? _to.imageUrl : await aesDecryptor(_to.imageUrl)
          );

          ChatListResponse data = onGoingChat.copyWith(
            from: from,
            to: to,
            id: await aesDecryptor(onGoingChat.id),
            imageUrl: onGoingChat.imageUrl == null || onGoingChat.imageUrl!.contains("http") ? onGoingChat.imageUrl :await aesDecryptor(onGoingChat.imageUrl),
            fromId: await aesDecryptor(onGoingChat.fromId),
            toId: await aesDecryptor(onGoingChat.toId),
          );
          onGoingChats.add(data);
        }
      }


      List<ChatListResponse> listChatOngoingAfterFilter = [];
      for (var element in onGoingChats) {
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
      final List<ChatResponse> _response = await chatRepository.fetchPersonalChatRoom(event.toId!, event.isArchive!);
      List<ChatResponse> _chats = [];

      for(var chat in _response){
        FromChatResponse? _from = chat.from?.copyWith(
          id: await aesDecryptor(chat.from?.id),
          name: await aesDecryptor(chat.from?.name),
          username: await aesDecryptor(chat.from?.username),
          imageUrl: chat.from?.imageUrl != null ? await aesDecryptor(chat.from?.imageUrl) : null,
        );

        FromChatResponse? from = _from?.copyWith(
          imageUrl: _from.imageUrl == null || _from.imageUrl!.contains("http") ? _from.imageUrl : await aesDecryptor(_from.imageUrl)
        );

        FromChatResponse? _to = chat.to?.copyWith(
          id: await aesDecryptor(chat.to?.id),
          name: await aesDecryptor(chat.to?.name),
          username: await aesDecryptor(chat.to?.username),
          imageUrl: chat.to?.imageUrl != null ? await aesDecryptor(chat.from?.imageUrl) : null,
        );

        FromChatResponse? to = _to?.copyWith(
            imageUrl: _to.imageUrl == null || _to.imageUrl!.contains("http") ? _to.imageUrl : await aesDecryptor(_to.imageUrl)
        );

        ChatResponse _chat = chat.copyWith(
          from: from,
          to: to,
          id: await aesDecryptor(chat.id),
          fromId: await aesDecryptor(chat.fromId),
          toId: await aesDecryptor(chat.toId),
          imageUrl: chat.imageUrl != null ? await aesDecryptor(chat.imageUrl) : null,
        );

        _chats.add(_chat);
      }

      if (_chats.isNotEmpty) {
        yield state.copyWith(
            listPersonalChatRoom: _chats,
            status: FormzStatus.submissionSuccess,
            type: 'chat-room-success');
      } else {
        yield state.copyWith(
            listPersonalChatRoom: _chats,
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
      final ResponseModel<ChatPendingSendResponse> _response = await chatRepository.sendChatPending(event.chatPendingSendRequest);
      ChatPendingSendResponse _chatPendingSendResponse = _response.data;

      if (_response.code == 200) {
        ChatPendingSendResponse chatPendingSendResponse = _chatPendingSendResponse.copyWith(
          id: await aesDecryptor(_chatPendingSendResponse.id),
          toId: await aesDecryptor(_chatPendingSendResponse.toId),
          fromId: await aesDecryptor(_chatPendingSendResponse.fromId),
        );

        yield state.copyWith(
            chatPendingSendResponse: chatPendingSendResponse,
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
      final List<ChatListResponse> listChatOngoing = await chatRepository.fetchChatList(user.id ?? '');

      final ResponseModel<ChatPendingPatientResponse> _response = await chatRepository.fetchChatPendingPatient(user.id ?? '', _hospital.id ?? '');

      ChatPendingPatientResponse _chatPendingPatientResponse = _response.data;
      ChatPendingPatientResponse? chatPendingPatientResponse;

      if (listChatOngoing.isNotEmpty) {
        String? fromId = await aesDecryptor(listChatOngoing[0].fromId);
        String? toId;
        if (fromId == user.id) {
          toId = await aesDecryptor(listChatOngoing[0].toId);
        } else {
          toId = await aesDecryptor(listChatOngoing[0].fromId);
        }
        personalChatRoomList = await chatRepository.fetchPersonalChatRoom(toId, false);
      }

      List<Content> _chatPending = [];
      if(_chatPendingPatientResponse.content?.length != 0){

        for(var element in _chatPendingPatientResponse.content ?? []) {
          ChatPendingPatientFrom? _from = element.from?.copyWith(
            id: await aesDecryptor(element.from?.id),
            name: await aesDecryptor(element.from?.name),
            imageUrl: await aesDecryptor(element.from?.imageUrl),
          );

          ChatPendingPatientFrom? from = _from?.copyWith(
              imageUrl: _from.imageUrl == null || _from.imageUrl!.contains("http") ? _from.imageUrl : await aesDecryptor(_from.imageUrl)
          );

          ChatPendingPatientHospital? _hospital = element.hospital?.copyWith(
            id: await aesDecryptor(element.hospital?.id),
            alias: await aesDecryptor(element.hospital?.alias),
            name: await aesDecryptor(element.hospital?.name),
            address: await aesDecryptor(element.hospital?.address),
            imageUrl: await aesDecryptor(element.hospital?.imageUrl),
          );

          ChatPendingPatientHospital? hospital = _hospital?.copyWith(
              imageUrl: _hospital.imageUrl == null || _hospital.imageUrl!.contains("http") ? _hospital.imageUrl : await aesDecryptor(_hospital.imageUrl)
          );

          Content _content = element.copyWith(
              id: await aesDecryptor(element.id),
              fromId: await aesDecryptor(element.fromId),
              hospitalId: await aesDecryptor(element.hospitalId),
              from: from,
              hospital: hospital
          );
          _chatPending.add(_content);
        }
      }

      if (_chatPendingPatientResponse.content?.length != 0 || listChatOngoing.isNotEmpty) {

        yield state.copyWith(
            chatPendingPatientResponse: _chatPending,
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
      final UserModel _user = await AppSharedPreference.getUser();
      UserModel user = _user.copyWith(
        imageUrl: _user.imageUrl != null || !_user.imageUrl!.contains("http") ? await aesDecryptor(_user.imageUrl) : _user.imageUrl
      );

      List<ChatListResponse?> _archiveByFrom = [];
      List<ChatListResponse?> _archiveByTo = [];

      List<ChatListResponse> archiveList = [];
      final List<ChatListResponse> listArchiveChatByFromId = await chatRepository.fetchArchiveChatByFromIdList(user.id ?? '');

      for(var archive in listArchiveChatByFromId){
        FromChatListResponse? _from = archive.from?.copyWith(
          id: await aesDecryptor(archive.from?.id),
          name: await aesDecryptor(archive.from?.name),
          username: await aesDecryptor(archive.from?.username),
          imageUrl: archive.from?.imageUrl != null ? await aesDecryptor(archive.from?.imageUrl) : null,
        );

        FromChatListResponse? from = _from?.copyWith(
          imageUrl: _from.imageUrl == null || _from.imageUrl!.contains("http") ? _from.imageUrl : await aesDecryptor(_from.imageUrl),
        );

        FromChatListResponse? _to = archive.to?.copyWith(
          id: await aesDecryptor(archive.to?.id),
          name: await aesDecryptor(archive.to?.name),
          username: await aesDecryptor(archive.to?.username),
          imageUrl: archive.to?.imageUrl != null ? await aesDecryptor(archive.from?.imageUrl) : null,
        );

        FromChatListResponse? to = _to?.copyWith(
          imageUrl: _to.imageUrl == null || _to.imageUrl!.contains("http") ? _to.imageUrl : await aesDecryptor(_to.imageUrl),
        );


        ChatListResponse _archiveChat = archive.copyWith(
          imageUrl: archive.imageUrl != null ? await aesDecryptor(archive.imageUrl): null,
          id: await aesDecryptor(archive.id),
          fromId: await aesDecryptor(archive.fromId),
          toId: await aesDecryptor(archive.toId),
          from: from,
          to: to
        );

        archiveList.add(_archiveChat);
      }
      // final List<ChatListResponse> listArchiveChatByToId =
      //     await chatRepository.fetchArchiveChatByToIdList(user.id ?? '');

      if (archiveList.length != 0){
        String? toId;
        for (var element in archiveList) {
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

      // if (listArchiveChatByToId.length != 0){
      //   String? fromId;
      //   for (var element in listArchiveChatByToId) {
      //     String? _toId = user.id == element.toId ? element.toId : element.fromId;
      //     if(fromId != element.fromId){
      //       fromId = element.toId;
      //     }
      //     if ((_archiveByTo.singleWhere((it) => it?.fromId == _toId && it?.toId == fromId,
      //         orElse: () => null)) != null) {
      //       print('Already exists!');
      //     } else {
      //       _archiveByTo.add(element);
      //     }
      //   }
      // }

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
