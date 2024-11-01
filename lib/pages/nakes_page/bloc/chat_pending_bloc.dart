import 'package:PregnancyApp/data/model/chat_model/chat_pending_response_list.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/chat_repository/chat_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/model/chat_model/chat_response.dart';
import '../../../data/model/chat_model/last_chat_response.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'chat_pending_event.dart';
part 'chat_pending_state.dart';

class ChatPendingBloc extends Bloc<ChatPendingEvent, ChatPendingState> {
  ChatPendingBloc(this.chatRepository) : super(ChatPendingBlocInitialState());
  final ChatRepository chatRepository;

  @override
  Stream<ChatPendingState> mapEventToState(ChatPendingEvent event) async* {
    if(event is FetchLastChatEvent) {
      yield* _mapFetchLastChatEvent(event, state);
    } else if (event is RespondPendingChat) {
      yield* _mapRespondPendingChat(event, state);
    } else if(event is FetchChatPendingByHospitalId){
      yield* _mapFetchChatPendingByHospitalIdEvent(event, state);
    }
  }

  Stream<ChatPendingState> _mapFetchLastChatEvent(
      FetchLastChatEvent event,
      ChatPendingState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-last-chat-loading', lastChatResponse: null);
    try {

      ResponseModel<LastChatResponse> _lastChat = await chatRepository.lastChatDashboard();
      print('last chat response : ${_lastChat.code}');
      if(_lastChat.code == 200) {
        print('last chat success');
        LastChatResponse lastChatResponse = _lastChat.data;
        print('unread count up : ${lastChatResponse.unreadMessage}');

        From? _form = lastChatResponse.chat?.from?.copyWith(
          name: await aesDecryptor(lastChatResponse.chat?.from?.name),
        );

        From? from = _form;

        Chat chat = Chat(message: lastChatResponse.chat?.message, from: from, createdDate: lastChatResponse.chat?.createdDate);

        LastChatResponse _lastChatResponse = LastChatResponse(unreadMessage: lastChatResponse.unreadMessage, chat: chat);
        // ResponseModel<ChatPendingResponseList> response = await chatRepository.fetchChatPendingListByHospitalId(event.hospitalId ?? '');
        // List<ChatPendingResponseList> _chatPendingList = response.data ?? [];
        // List<ChatPendingResponseList> chatPendingList = [];
        // if(_chatPendingList.length != 0){
        //   for(var element in _chatPendingList){
        //     FromChatPendingResponseLIst? from = element.from?.copyWith(
        //       name: await aesDecryptor(element.from?.name)
        //     );
        //
        //     ChatPendingResponseList pending = element.copyWith(
        //       from: from,
        //     );
        //
        //     chatPendingList.add(pending);
        //   }
        // }
        print('unread count : ${_lastChatResponse.unreadMessage}');

        yield state.copyWith(type: 'fetching-last-chat-success',
            status: FormzStatus.submissionSuccess,
            lastChatResponse: _lastChatResponse);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetching-last-chat-failed', lastChatResponse: null);}

      } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Fetch Data Error', errorMessage: e.toString());
    }
  }

  Stream<ChatPendingState> _mapFetchChatPendingByHospitalIdEvent(
      FetchChatPendingByHospitalId event,
      ChatPendingState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'fetching-chat-pending-loading', lastChatResponse: null);
    try {

      // ResponseModel<LastChatResponse> _lastChat = await chatRepository.lastChatDashboard();
      // print('last chat response : ${_lastChat.code}');
      // if(_lastChat.code == 200) {
      //   print('last chat success');
      //   LastChatResponse lastChatResponse = _lastChat.data;
      //   print('unread count up : ${lastChatResponse.unreadMessage}');

        // From? _form = lastChatResponse.chat?.from?.copyWith(
        //   name: await aesDecryptor(lastChatResponse.chat?.from?.name),
        // );

        // From? from = _form;

        // Chat chat = Chat(message: lastChatResponse.chat?.message, from: from, createdDate: lastChatResponse.chat?.createdDate);

        // LastChatResponse _lastChatResponse = LastChatResponse(unreadMessage: lastChatResponse.unreadMessage, chat: chat);
        ResponseModel<ChatPendingResponseList> response = await chatRepository.fetchChatPendingListByHospitalId(event.hospitalId ?? '');
        List<ChatPendingResponseList> _chatPendingList = response.data ?? [];
        List<ChatPendingResponseList> chatPendingList = [];
        if(response.code == 200){

        if(_chatPendingList.length != 0){
          for(var element in _chatPendingList){
            FromChatPendingResponseLIst? from = element.from?.copyWith(
              name: await aesDecryptor(element.from?.name)
            );

            ChatPendingResponseList pending = element.copyWith(
              from: from,
            );

            chatPendingList.add(pending);
          }
        }
        // print('unread count : ${_lastChatResponse.unreadMessage}');

        yield state.copyWith(type: 'fetching-chat-pending-success',
            status: FormzStatus.submissionSuccess,
            chatPendingList: chatPendingList);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'fetching-chat-pending-failed', lastChatResponse: null);}

    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
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

        if(_chatList.code == 200){
          // old API
        String toId = _chatList.data.toId;
        final ResponseModel<ChatResponse> response = await chatRepository.fetchPersonalChatRoom(toId, false);
        List<ChatResponse> chatList = response.data ?? [];
        List<ChatResponse> chats = [];

        for(var element in chatList) {
          FromChatResponse? from = element.from?.copyWith(
            id: await aesDecryptor(element.from?.id),
            name: await aesDecryptor(element.from?.name),
          );

          FromChatResponse? to = element.to?.copyWith(
            id: await aesDecryptor(element.to?.id),
            name: await aesDecryptor(element.to?.name),
          );

          ChatResponse chat = element.copyWith(
            from: from,
            to: to,
          );

          chats.add(chat);
        }

        yield state.copyWith(type: 'responding-pending-chat-success', status: FormzStatus.submissionSuccess, chatPendingResponseList: chats);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'responding-pending-chat-failed', chatPendingResponseList: []);
      }
    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(status: FormzStatus.submissionFailure, type: 'responding-pending-chat-error', errorMessage: e.toString());
    }
  }
}