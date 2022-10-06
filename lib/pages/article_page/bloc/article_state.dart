part of 'article_bloc.dart';

class ArticlePageState with FormzMixin {
  final List<ArticleModel>? listArticle;
  final ArticleModel? articleModel;
  final FormzStatus submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;

  ArticlePageState(
      {
        this.articleModel,
        this.listArticle,
        this.type,
        this.isSearch = false,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  ArticlePageState copyWith(
      {FormzStatus? submitStatus,
        ArticleModel? articleModel,
        List<ArticleModel>? listArticle,
        bool? isSearch,
        String? type,
        String? errorMessage}) {
    return ArticlePageState(
        submitStatus: submitStatus ?? this.submitStatus,
        articleModel: articleModel ?? this.articleModel,
        listArticle: listArticle ?? this.listArticle,
        isSearch: isSearch ?? this.isSearch,
        type: type ?? this.type,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ArticlePageInitial extends ArticlePageState {}