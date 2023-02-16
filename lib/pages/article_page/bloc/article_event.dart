part of 'article_bloc.dart';

@immutable
abstract class ArticlePageEvent extends Equatable {
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

class ArticleFetchEvent extends ArticlePageEvent {
  const ArticleFetchEvent(this.condition, this.page,
      {this.keyword = '',
      this.isSearch = false,
      this.isNextPage = false,
      this.sortBy = 'createdDate',
      this.sort = SortEnum.asc});

  final String? sortBy;
  final SortEnum? sort;
  final int? page;
  final bool isNextPage;
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
