part of 'home_page_bloc.dart';

class HomePageState {
  final UserModelFirebase? user;
  final BabyModel? baby;
  final FormzStatus status;
  final String? tipe;
  final List<ArticleModel>? listArticle;
  final ArticleModel? articleModel;
  final String? errorMessage;

  HomePageState(
      {this.user,
      this.baby,
      this.status = FormzStatus.pure,
      this.listArticle,
      this.tipe,
      this.articleModel,
      this.errorMessage});

  HomePageState copyWith(
      {FormzStatus? status,
      UserModelFirebase? user,
      BabyModel? baby,
      List<ArticleModel>? listArticle,
      ArticleModel? articleModel,
      String? tipe,
      String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
        user: user ?? this.user,
        baby: baby ?? this.baby,
        listArticle: listArticle ?? this.listArticle,
        articleModel: articleModel ?? this.articleModel,
        tipe: tipe ?? this.tipe,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class HomePageInitial extends HomePageState {}
