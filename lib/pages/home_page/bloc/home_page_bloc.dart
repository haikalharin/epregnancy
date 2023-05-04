import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_event.dart';
import 'package:PregnancyApp/data/model/baby_progress_model/simple_tip_response.dart';
import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';
import 'package:PregnancyApp/data/repository/article_repository/article_repository.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/event_error_exception.dart';
import '../../../common/exceptions/home_error_exception.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/model/baby_model/baby_model.dart';
import '../../../data/model/baby_model/new_baby_model.dart';
import '../../../data/model/baby_model_api/baby_Model_api.dart';
import '../../../data/model/baby_progress_model/baby_progress_model.dart';
import '../../../data/model/user_info/user_info.dart';
import '../../../data/repository/event_repository/event_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../data/firebase/event/event_article.dart';
import '../../../utils/function_utils.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this.homeRepository, this.userRepository, this.eventRepository,
      this.articleRepository)
      : super(HomePageInitial());

  final HomeRepository homeRepository;
  final UserRepository userRepository;
  final EventRepository eventRepository;
  final ArticleRepository articleRepository;

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomeFetchDataEvent) {
      yield* _mapHomeFetchUserToState(event, state);
    } else if (event is HomeInitEvent) {
      yield _mapHomeInitEventToState(event, state);
    } else if (event is HomeEventDateChanged) {
      yield _mapHomeEventDateChangedEventToState(event, state);
    } else if (event is ArticleHomeFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is EventFetchEvent) {
      yield* _mapEventFetchEventToState(event, state);
    } else if (event is PointFetchEvent) {
      yield* _mapPointFetchEventToState(event, state);
    } else if (event is HomeEventDeleteSchedule) {
      yield* _mapHomeEventDeleteScheduleToState(event, state);
    } else if (event is FetchSimpleTipEvent) {
      yield* _mapFetchSimpleTips(event, state);
    } else if (event is FetchListVisitEvent) {
      yield* _mapFetchListPersonDiscussEventToState(event, state);
    }
  }

  HomePageState _mapHomeEventDateChangedEventToState(
    HomeEventDateChanged event,
    HomePageState state,
  ) {
    final eventDate = event.date;
    return state.copyWith(eventDate: eventDate);
  }

  Stream<HomePageState> _mapEventFetchEventToState(
    EventFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, tipe: "listEvent");
    try {
      List<EventModel> listEventBeforeSort = [];
      ResponseModel<EventModel> responseModel = ResponseModel();
      UserModel person = await AppSharedPreference.getUser();

      List<EventModel> listEvent = [];
      if (event.type == StringConstant.typePersonal) {
        print('midwife status : ${event.isMidwife}');
        if (event.isMidwife == true) {
          responseModel = await eventRepository.fetchEventForMidwife(
              midwifeId: person.id, isPublic: false);
        } else {
          responseModel = await eventRepository.fetchEvent(
              userId: person.id, isPublic: false);
        }
        listEvent = responseModel.data ?? [];
      } else {
        if (event.isMidwife == true) {
          responseModel = await eventRepository.fetchEventForMidwife(
              midwifeId: person.id, isPublic: true);
        } else {
          responseModel = await eventRepository.fetchEvent(
              userId: person.id, isPublic: true);
        }
        listEvent = responseModel.data ?? [];
      }

      if (listEvent.isNotEmpty) {
        listEvent = responseModel.data ?? [];
        listEventBeforeSort = await FunctionUtils.getCheckDate(
            listEvent: listEvent, date: event.date);
        var listEventFix =
            await FunctionUtils.sortDate(listEvent: listEventBeforeSort);
        var outputFormat = DateFormat.yMMMMEEEEd('id');
        var dateTimeString = outputFormat.format(event.date);
        if (listEvent.isNotEmpty) {
          if (event.type == StringConstant.typePublic) {
            yield state.copyWith(
                eventDateString: dateTimeString,
                eventDate: event.date,
                listEvent: listEventFix,
                submitStatus: FormzStatus.submissionSuccess);
          } else {
            yield state.copyWith(
                eventDateString: dateTimeString,
                eventDate: event.date,
                listEventPersonal: listEventFix,
                submitStatus: FormzStatus.submissionSuccess);
          }
        } else {
          yield state.copyWith(
              eventDateString: dateTimeString,
              submitStatus: FormzStatus.submissionFailure);
        }
      } else {
        var outputFormat = DateFormat.yMMMMEEEEd('id');
        var dateTimeString = outputFormat.format(event.date);
        yield state.copyWith(
            eventDateString: dateTimeString,
            eventDate: event.date,
            listEventPersonal: listEventBeforeSort,
            submitStatus: FormzStatus.submissionSuccess);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, isNotHaveSession: false);
    }
  }

  Stream<HomePageState> _mapPointFetchEventToState(
    PointFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        tipe: "fetchtotalPoint");
    try {
      final ResponseModel<UserModel> responseModel =
          await userRepository.getUserInfo();
      UserModel userInfo = responseModel.data;
      UserModel userEntity =
          userInfo.copyWith(name: await aesDecryptor(userInfo.name));
      // await AppSharedPreference.remove(AppSharedPreference.checkIn);
      if (responseModel.code == 200) {
        await AppSharedPreference.setUser(responseModel.data);
        await AppSharedPreference.setBool(
            AppSharedPreference.isShowGuide, false);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            totalPointsEarned: userInfo.totalpointsEarned,
            user: userEntity,
            tipe: "get-info-done");
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure,
          errorMessage: a.toString(),
          isNotHaveSession: false);
    }
  }

  Stream<HomePageState> _mapFetchSimpleTips(
    FetchSimpleTipEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        tipe: "fetch-simple-tips");
    try {
      final ResponseModel<SimpleTipResponse> responseModel =
          await articleRepository.getSimpleTip();
      print("data simple tip : ${responseModel.data.toString()}");
      SimpleTipResponse simpleTipResponse = responseModel.data;

      if (responseModel.code == 200) {
        yield state.copyWith(
            simpleTipResponse: simpleTipResponse,
            tipe: 'simple-tip-success',
            submitStatus: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(
            simpleTipResponse: null,
            tipe: 'simple-tip-failed',
            submitStatus: FormzStatus.submissionFailure);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, isNotHaveSession: false);
    }
  }

  Stream<HomePageState> _mapArticleFetchEventToState(
    ArticleHomeFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, tipe: "listArticle");
    try {
      final ResponseModel responseModel =
          await articleRepository.fetchArticle(0, 'desc', 'createdDate');
      List<ArticleModel> listArticle = responseModel.data ?? [];
      List<ArticleModel> listArticleFix = [];
      // if(event.isNextPage){
      //   members = state.members??[];
      // }
      for (var element in listArticle) {
        listArticleFix.add(element);
      }
      if (responseModel.data.isNotEmpty) {
        yield state.copyWith(
            listArticle: listArticleFix,
            submitStatus: FormzStatus.submissionSuccess);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, isNotHaveSession: false);
    }
  }

  HomePageState _mapHomeInitEventToState(
      HomeInitEvent event, HomePageState state) {
    return HomePageInitial();
  }

  Stream<HomePageState> _mapHomeFetchUserToState(
    HomeFetchDataEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var pregnancyAgeDay = 0;
      var pregnancyAgeWeek = 0;
      NewBabyModel myBaby = const NewBabyModel();

      final UserModel user = await AppSharedPreference.getUser();
      if (!event.isMidwife) {
        ResponseModel response = await homeRepository.getBaby(user);
        if (response.code == 200) {
          myBaby = response.data;
          if (myBaby.baby != null) {
            pregnancyAgeWeek = myBaby.baby?.pregnancyAgeWeek ?? 0;
            pregnancyAgeDay = myBaby.baby?.pregnancyAgeDay ?? 0;
          }
          bool? _showGuide = await AppSharedPreference.getBool(
              AppSharedPreference.isShowGuide);
          print('show guide : $_showGuide');
          await AppSharedPreference.setBabyDataNew(myBaby);
          yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            baby: myBaby,
            days: pregnancyAgeDay.toString(),
            weeks: pregnancyAgeWeek.toString(),
            user: user,
            showGuide: _showGuide ?? true,
            role: user.isPatient == true
                ? StringConstant.patient
                : StringConstant.midwife,
          );
        } else if (response.code == 0) {
          await AppSharedPreference.sessionExpiredEvent();
          yield state.copyWith(
              submitStatus: FormzStatus.submissionFailure,
              isNotHaveSession: false);
        } else {
          yield state.copyWith(baby:const NewBabyModel(),submitStatus: FormzStatus.submissionFailure);
        }
      } else {
        bool? _showGuide =
            await AppSharedPreference.getBool(AppSharedPreference.isShowGuide);
        yield state.copyWith(
          submitStatus: FormzStatus.submissionSuccess,
          user: user,
          showGuide: _showGuide,
          role: user.isPatient == true
              ? StringConstant.patient
              : StringConstant.midwife,
        );
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, isNotHaveSession: false);
    }
  }

//

  Stream<HomePageState> _mapHomeEventDeleteScheduleToState(
    HomeEventDeleteSchedule event,
    HomePageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      final response = await eventRepository.deleteEvent(event.id);

      if (response.code == 200) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            tipe: "deleteSchedule");
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on EventErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure, isNotHaveSession: false);
    }
  }

  Stream<HomePageState> _mapFetchListPersonDiscussEventToState(
      FetchListVisitEvent event,
      HomePageState state,
      ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress,
        tipe: 'fetching-list-discuss',
        listUserVisitModel: []);
    try {
      var sort = "desc";
      if (event.sort == SortEnum.asc) {
        sort = "asc";
      }
      ResponseModel response = ResponseModel.dataEmpty();
      if (event.isNextPage) {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionInProgress,
            tipe: 'get-next-page-list_discuss',
            listUserVisitModel: state.listUserVisitModel);
        response = await userRepository.fetchUserVisit(
            state.page + 1,
            event.size??5,
            event.sortBy ?? "createdDate",
            sort);
      } else {
        response = await userRepository.fetchUserVisit(
            event.page ?? 0,
            event.size??5,
            event.sortBy ?? "createdDate",
            sort);
      }
      List<UserVisitModel> _userVisit = response.data ?? [];
      List<UserVisitModel> listUserVisit = [];
      if (event.isNextPage) {
        listUserVisit = state.listUserVisitModel ?? [];
      }
      for (var element in _userVisit) {
        UserInfoVisit? user = element.user;
        UserInfoVisit? _userVisit = user?.copyWith(
          name: await aesDecryptor(user.name),
        );
        UserVisitModel? userVisit = element.copyWith(
          user: _userVisit,
        );
        listUserVisit.add(userVisit);
      }
      if (response.code == 200) {
        List<UserVisitModel> allMembers = List<UserVisitModel>.from(state.listUserVisitModel ?? [])
          ..addAll(listUserVisit);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            tipe: 'fetch-user-visit-success',
            listUserVisitModel: listUserVisit,
            page: response.pagination?.number,
            isSearch: event.isSearch,
            sort: event.sort,
            sortBy: event.sortBy,
            lastPageListVisit: response.pagination?.last);
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionFailure, tipe: 'fetch-user-visit-failed');
      }
    } catch (e) {
      print('members failed : $e');
      if (e is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(
          submitStatus: FormzStatus.submissionFailure,
          tipe: 'Fetch Data Error',
          errorMessage: e.toString());
    }
  }

}
