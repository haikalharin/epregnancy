part of 'article_bloc.dart';

class ArticlePageState with FormzMixin {
  final List<ArticleModel>? listArticle;
  final ArticleModel? articleModel;
  final FormzStatus submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;
  final bool last;
  final int page;
  final String keyword;

  ArticlePageState({
    this.articleModel,
    this.listArticle,
    this.type,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage,
    this.last = false,
    this.page = 0,
    this.keyword = '',
  });

  ArticlePageState copyWith(
      {FormzStatus? submitStatus,
      ArticleModel? articleModel,
      List<ArticleModel>? listArticle,
      bool? isSearch,
      String? type,
      bool? last,
      int? page,
      String? keyword,
      String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus ?? this.submitStatus,
        articleModel: articleModel ?? this.articleModel,
        listArticle: listArticle ?? this.listArticle,
        isSearch: isSearch ?? this.isSearch,
        type: type ?? this.type,
        last: last ?? this.last,
        page: page ?? this.page,
        keyword: keyword ?? this.keyword,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends ArticlePageState {}
