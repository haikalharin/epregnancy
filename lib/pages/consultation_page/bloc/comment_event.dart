part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class AddCommentEvent extends CommentEvent {
  const AddCommentEvent({required this.postId, required this.comment, this.listComment});

  final String postId;
  final String comment;
  final List<Comment>? listComment;

  @override
  List<Object> get props => [];
}

class CommentEventInitialized extends CommentEvent {
  const CommentEventInitialized({this.listComment});

  final List<Comment>? listComment;

  @override
  List<Object> get props => [];
}
