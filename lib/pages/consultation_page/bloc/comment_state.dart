part of 'comment_bloc.dart';

class CommentState {
  final FormzStatus? status;
  final String? type;
  final AddCommentResponse? addCommentResponse;
  final String? errorMessage;
  final List<Comment>? listComment;

  CommentState({this.listComment, this.type, this.status, this.errorMessage, this.addCommentResponse});

  CommentState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        AddCommentResponse? addCommentResponse,
        List<Comment>? listComment}) {
    return CommentState(
        type: type ?? this.type,
        status: status ?? this.status,
        addCommentResponse: addCommentResponse ?? this.addCommentResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        listComment: listComment ?? this.listComment);
  }
}

class CommentBlocInitialState extends CommentState {}