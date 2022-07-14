part of 'home_page_bloc.dart';

class HomePageState {
  final UserModelFirebase? user;
  final BabyModel? baby;
  final BabyProgressModel? babyProgressModel;
  final FormzStatus status;
  final String? tipe;
  final String? days;
  final String? weeks;
  final List<ArticleModel>? listArticle;
  final ArticleModel? articleModel;
  final String? errorMessage;

  HomePageState(
      {this.user,
      this.baby,
      this.babyProgressModel,
      this.status = FormzStatus.pure,
      this.listArticle,
      this.tipe,
      this.days,
      this.weeks,
      this.articleModel,
      this.errorMessage});

  HomePageState copyWith(
      {FormzStatus? status,
      UserModelFirebase? user,
      BabyModel? baby,
        BabyProgressModel? babyProgressModel,
      List<ArticleModel>? listArticle,
      ArticleModel? articleModel,
      String? tipe,
      String? days,
      String? weeks,
      String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
        user: user ?? this.user,
        baby: baby ?? this.baby,
        babyProgressModel: babyProgressModel ?? this.babyProgressModel,
        listArticle: listArticle ?? this.listArticle,
        articleModel: articleModel ?? this.articleModel,
        tipe: tipe ?? this.tipe,
        days: days ?? this.days,
        weeks: weeks ?? this.weeks,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class HomePageInitial extends HomePageState {}
