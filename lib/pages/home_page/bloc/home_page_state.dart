part of 'home_page_bloc.dart';

class HomePageState with FormzMixin {
  final UserModel? user;
  final String? role;
  final nb.NewBabyModel? baby;
  final FormzStatus? submitStatus;
  final String? tipe;
  final String? days;
  final String? weeks;
  final String? eventDateString;
  final DateTime? eventDate;
  final SimpleTipResponse? simpleTipResponse;
  final List<ArticleModel>? listArticle;
  final List<EventModel>? listEvent;
  final List<EventModel>? listEventPersonal;
  final ArticleModel? articleModel;
  final int? totalPointsEarned;
  final String? errorMessage;
  final bool? showGuide;
  final bool? isNotHaveSession;

  HomePageState({this.user,
    this.role,
    this.baby,
    this.submitStatus = FormzStatus.pure,
    this.listArticle,
    this.simpleTipResponse,
    this.listEvent,
    this.listEventPersonal,
    this.tipe,
    this.days,
    this.weeks,
    this.eventDateString,
    this.eventDate,
    this.articleModel,
    this.totalPointsEarned,
    this.showGuide,
    this.isNotHaveSession,
    this.errorMessage});

  HomePageState copyWith({FormzStatus? submitStatus,
    UserModel? user,
    String? role,
    nb.NewBabyModel? baby,
    SimpleTipResponse? simpleTipResponse,
    List<ArticleModel>? listArticle,
    List<EventModel>? listEvent,
    List<EventModel>? listEventPersonal,
    ArticleModel? articleModel,
    String? tipe,
    String? days,
    String? weeks,
    String? eventDateString,
    DateTime? eventDate,
    int? totalPointsEarned,
    bool? showGuide,
    bool? isNotHaveSession,
    String? errorMessage}) {
    return HomePageState(
        submitStatus: submitStatus,
        user: user ?? this.user,
        role: role ?? this.role,
        baby: baby ?? this.baby,
        simpleTipResponse: simpleTipResponse ?? this.simpleTipResponse,
        showGuide: showGuide ?? this.showGuide,
        listArticle: listArticle ?? this.listArticle,
        listEvent: listEvent ?? this.listEvent,
        listEventPersonal: listEventPersonal ?? this.listEventPersonal,
        articleModel: articleModel ?? this.articleModel,
        tipe: tipe,
        days: days ?? this.days,
        weeks: weeks ?? this.weeks,
        eventDateString: eventDateString ?? this.eventDateString,
        eventDate: eventDate ?? this.eventDate,
        totalPointsEarned: totalPointsEarned ?? this.totalPointsEarned,
        isNotHaveSession: isNotHaveSession,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class HomePageInitial extends HomePageState {}
