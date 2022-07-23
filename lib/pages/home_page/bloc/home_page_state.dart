part of 'home_page_bloc.dart';

class HomePageState {
  final UserModelFirebase? user;
  final UserRolesModelFirebase? role;
  final BabyModel? baby;
  final BabyProgressModel? babyProgressModel;
  final FormzStatus status;
  final String? tipe;
  final String? days;
  final String? weeks;
  final String? eventDateString;
  final DateTime? eventDate;
  final List<ArticleModel>? listArticle;
  final List<EventModel>? listEvent;
  final ArticleModel? articleModel;
  final String? errorMessage;

  HomePageState({this.user,
    this.role,
    this.baby,
    this.babyProgressModel,
    this.status = FormzStatus.pure,
    this.listArticle,
    this.listEvent,
    this.tipe,
    this.days,
    this.weeks,
    this.eventDateString,
    this.eventDate,
    this.articleModel,
    this.errorMessage});

  HomePageState copyWith({FormzStatus? status,
    UserModelFirebase? user,
    UserRolesModelFirebase? role,
    BabyModel? baby,
    BabyProgressModel? babyProgressModel,
    List<ArticleModel>? listArticle,
    List<EventModel>? listEvent,
    ArticleModel? articleModel,
    String? tipe,
    String? days,
    String? weeks,
    String? eventDateString,
    DateTime? eventDate,
    String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
        user: user ?? this.user,
        role: role ?? this.role,
        baby: baby ?? this.baby,
        babyProgressModel: babyProgressModel ?? this.babyProgressModel,
        listArticle: listArticle ?? this.listArticle,
        listEvent: listEvent ?? this.listEvent,
        articleModel: articleModel ?? this.articleModel,
        tipe: tipe ?? this.tipe,
        days: days ?? this.days,
        weeks: weeks ?? this.weeks,
        eventDateString: eventDateString ?? this.eventDateString,
        eventDate: eventDate ?? this.eventDate,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class HomePageInitial extends HomePageState {}
