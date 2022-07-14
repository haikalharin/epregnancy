part of 'article_bloc.dart';

@immutable
abstract class ArticlePageEvent extends Equatable{
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

class ArticleFetchEvent extends ArticlePageEvent {
  const ArticleFetchEvent(this.condition);

  final String condition;

  @override
  List<Object> get props => [];
}
