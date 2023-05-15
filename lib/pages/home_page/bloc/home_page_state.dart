part of 'home_page_bloc.dart';

class HomePageState with FormzMixin {
  final UserModel? user;
  final UserVisitModel? userVisitModel;
  final List<UserVisitModel>? listUserVisitModel;
  final String? role;
  final nb.NewBabyModel? baby;
  final FormzStatus? submitStatus;
  final String? tipe;
  final String? days;
  final String? weeks;
  final String? eventDateString;
  final DateTime? eventDate;
  final HospitalModel? hospitalModel;
  final SimpleTipResponse? simpleTipResponse;
  final List<ArticleModel>? listArticle;
  final List<EventModel>? listEvent;
  final List<EventModel>? listEventPersonal;
  final ArticleModel? articleModel;
  final int? totalPointsEarned;
  final String? errorMessage;
  final bool? showGuide;
  final bool? isNotHaveSession;
  final String? selectedChildId;
  final MyChildDashboard? myChildDashboard;
  final List<BabyChildResponse>? babyChilds;
  final bool? isSearch;
  final bool lastPageListVisit;
  final SortEnum? sort;
  final String? sortBy;
  final int page;
  final MandatoryFieldValidator nextVisitDateString;
  final bool? isFromSubmit;
  final int? totalUnreadNotif;

  HomePageState(
      {this.user,
      this.role,
      this.isFromSubmit = false,
      this.nextVisitDateString = const MandatoryFieldValidator.pure(),
      this.baby,
      this.userVisitModel,
      this.lastPageListVisit = false,
      this.sortBy,
      this.sort,
      this.listUserVisitModel,
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
      this.isSearch = false,
      this.page = 0,
      this.hospitalModel,
      this.selectedChildId,
      this.myChildDashboard,
      this.babyChilds,
      this.errorMessage,
      this.totalUnreadNotif});

  HomePageState copyWith(
      {FormzStatus? submitStatus,
      UserModel? user,
      UserVisitModel? userVisitModel,
      List<UserVisitModel>? listUserVisitModel,
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
      MandatoryFieldValidator? nextVisitDateString,
      String? eventDateString,
      DateTime? eventDate,
      int? totalPointsEarned,
      bool? showGuide,
      bool? isNotHaveSession,
      bool? isSearch,
      int? page,
      bool? lastPageListVisit,
      bool? isFromSubmit,
      SortEnum? sort,
      String? sortBy,
      String? errorMessage,
        HospitalModel? hospitalModel,
        String? selectedChildId,
        MyChildDashboard? myChildDashboard,
        List<BabyChildResponse>? babyChilds,
        int? totalUnreadNotif
      }) {
    return HomePageState(
        submitStatus: submitStatus,
        user: user ?? this.user,
        userVisitModel: userVisitModel ?? this.userVisitModel,
        listUserVisitModel: listUserVisitModel ?? this.listUserVisitModel,
        role: role ?? this.role,
        baby: baby ?? this.baby,
        nextVisitDateString: nextVisitDateString ?? this.nextVisitDateString,
        hospitalModel: hospitalModel ?? this.hospitalModel,
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
        isSearch: isSearch ?? this.isSearch,
        lastPageListVisit: lastPageListVisit ?? this.lastPageListVisit,
        isFromSubmit: isFromSubmit,
        page: page ?? this.page,
        sort: sort ?? this.sort,
        sortBy: sortBy ?? this.sortBy,
        errorMessage: errorMessage,
        selectedChildId: selectedChildId ?? this.selectedChildId,
        myChildDashboard: myChildDashboard ?? this.myChildDashboard,
        babyChilds: babyChilds ?? this.babyChilds,
        totalUnreadNotif: totalUnreadNotif ?? this.totalUnreadNotif
    );
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class HomePageInitial extends HomePageState {}
