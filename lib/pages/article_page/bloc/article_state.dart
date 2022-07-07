part of 'article_bloc.dart';

class ArticlePageState {
  final List<ArticleModel>? listArticle;
  final ArticleModel? articleModel;
  final FormzStatus status;
  final String? errorMessage;

  ArticlePageState(
      {
        this.articleModel,
        this.listArticle,
        this.status = FormzStatus.pure,
        this.errorMessage});

  ArticlePageState copyWith(
      {FormzStatus? status,
        ArticleModel? articleModel,
        List<ArticleModel>? listArticle,
        String? errorMessage}) {
    return ArticlePageState(
        status: status ?? this.status,
        articleModel: articleModel ?? this.articleModel,
        listArticle: listArticle ?? this.listArticle,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class ArticlePageInitial extends ArticlePageState {}