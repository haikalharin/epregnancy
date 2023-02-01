import 'package:PregnancyApp/data/model/consultation_model/add_comment_response.dart';
import 'package:PregnancyApp/data/model/consultation_model/consultation_model.dart';
import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/consultation_repository/consultation_repository.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/pages/navbar_page/bottom_nav.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/model/games_model/play_game_response.dart';
import '../../../data/model/user_model_api/user_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(this.consultationRepo) : super(CommentBlocInitialState());
  final ConsultationRepository consultationRepo;

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if(event is AddCommentEvent) {
      yield* _addComment(event, state);
    } else if (event is CommentEventInitialized) {
      yield* _commentInitalized(event, state);
    } else if (event is DeleteCommentEvent){
      yield* _deleteComment(event, state);
    }
  }

  Stream<CommentState> _commentInitalized(
      CommentEventInitialized event,
      CommentState state,
      ) async* {
    List<Comment>? comments = [];

    for(var element in event.listComment!){
      User? user = element.user?.copyWith(
        name: await aesDecryptor(element.user?.name)
        id: await aesDecryptor(element.user?.id)
      );

      Comment comment = element.copyWith(
        user: user
      );

      comments.add(comment);
    }

    yield state.copyWith(listComment: comments, status: FormzStatus.submissionSuccess);
  }

  Stream<CommentState> _addComment(
      AddCommentEvent event,
      CommentState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'loading',);
    try {
      ResponseModel response  = await consultationRepo.addComment(event.postId, event.comment);
      List<Comment>? comments = event.listComment;
      UserModel _userInfo = await AppSharedPreference.getUser();
      User user = User(
        id: _userInfo.id,
        name: _userInfo.name,
        imageUrl:  _userInfo.imageUrl
      );

      if(response.code == 200) {
        Comment newComment = Comment(
          id: response.data.id,
          user: user,
          message: event.comment
        );
        comments?.add(newComment);
        yield state.copyWith(type: 'add-comment-success', status: FormzStatus.submissionSuccess, listComment: comments);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Error Add Comment', errorMessage: response.message);
      }
    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(status: FormzStatus.submissionFailure, errorMessage: e.message);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Error Add Comment', errorMessage: e.toString());
      }
    }
  }

  Stream<CommentState> _deleteComment(
      DeleteCommentEvent event,
      CommentState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, type: 'loading',);
    try {
      ResponseModel response  = await consultationRepo.deletePostComment(event.postId);
      int? indexDelete = state.listComment?.indexWhere((element) => element.id == event.postId);

      // print("first id  : ${state.listComment?[index].id}");
      // print("event id  : ${event.postId}");
      List<Comment>? comments = state.listComment?.where((element) => state.listComment?.indexOf(element) != indexDelete).toList();
      // List<Comment>? comments = event.listComment;
      if(response.code == 200) {
        // comments?.removeAt(indexDelete!);
        yield state.copyWith(type: 'delete-comment-success', status: FormzStatus.submissionSuccess, listComment: comments);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Error Delete Comment', errorMessage: response.message);
      }
    } catch(e) {
      if( e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(status: FormzStatus.submissionFailure, errorMessage: e.message);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, type: 'Error Delete Comment ${e.toString()}', errorMessage: e.toString());
      }
    }
  }
}