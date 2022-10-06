part of 'article_bloc.dart';

@immutable
abstract class ArticlePageEvent extends Equatable{
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

class ArticleFetchEvent extends ArticlePageEvent {
  const ArticleFetchEvent(this.condition,{this.keyword ="", this.isSearch = false});

  final String condition;
  final String keyword;
  final bool isSearch;


  @override
  List<Object> get props => [];
}

class ArticleReadEvent extends ArticlePageEvent {
  const ArticleReadEvent(this.id);

  final String id;

  @override
  List<Object> get props => [];
}
class ArticleBackEvent extends ArticlePageEvent {
  const ArticleBackEvent();



  @override
  List<Object> get props => [];
}
