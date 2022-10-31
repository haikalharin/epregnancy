import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_event.dart';
import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
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
  HomePageBloc(this.homeRepository, this.userRepository, this.eventRepository, this.articleRepository) : super(HomePageInitial());

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
    } else if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is EventFetchEvent) {
      yield* _mapEventFetchEventToState(event, state);
    } else if (event is PointFetchEvent) {
      yield* _mapPointFetchEventToState(event, state);
    }  else if (event is HomeEventDeleteSchedule) {
      yield* _mapHomeEventDeleteScheduleToState(event, state);
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
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress,tipe: "listEvent");
    try {
      List<EventModel> listEventBeforeSort = [];
      ResponseModel<EventModel> responseModel = ResponseModel();
      UserModel person = await AppSharedPreference.getUser();

      List<EventModel> listEvent = [];
      if (event.type == StringConstant.typePersonal) {
        responseModel = await eventRepository.fetchEvent(userId: person.id,isPublic: false );
        listEvent = responseModel.data??[];
      } else {
        responseModel = await eventRepository.fetchEvent(userId: person.id, isPublic: true);
        listEvent = responseModel.data?? [];
      }

      if (listEvent.isNotEmpty) {
        listEventBeforeSort = await FunctionUtils.getCheckDate(
            listEvent: listEvent, date: event.date);
        var listEventFix =
            await FunctionUtils.sortDate(listEvent: listEventBeforeSort);
        var outputFormat = DateFormat.yMMMMd('id');
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
        var outputFormat = DateFormat.yMMMMd('id');
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
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<HomePageState> _mapPointFetchEventToState(
      PointFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, tipe: "fetchtotalPoint");
    try {
      final ResponseModel<UserModel> responseModel = await userRepository.getUserInfo();
      UserModel userInfo = responseModel.data;
      // await AppSharedPreference.remove(AppSharedPreference.checkIn);
      if(responseModel.code == 200) {
        // await AppSharedPreference.setUserInfo(userInfo.data);
        await AppSharedPreference.setBool(AppSharedPreference.isShowGuide, false);
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess, totalPointsEarned: userInfo.totalpointsEarned);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (a) {
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.toString());
    }
  }

  Stream<HomePageState> _mapArticleFetchEventToState(
      ArticleFetchEvent event,
      HomePageState state,
      ) async* {
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress, tipe: "listArticle");
    try {
      List<ArticleModel> lisArticleFix = [];
      final List<ArticleModel> lisArticle = await articleRepository.fetchArticle();
      if (lisArticle.isNotEmpty) {
        yield state.copyWith(
            listArticle: lisArticle, submitStatus: FormzStatus.submissionSuccess);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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
    yield state.copyWith(
        submitStatus: FormzStatus.submissionInProgress);
    try {
      var days = 0;
      var weeks = 0;


      final UserModel user = await AppSharedPreference.getUser();
      ResponseModel response = await homeRepository.getBaby(user);
      final myBaby = response.data;


      BabyProgressModel babyProgressModel = BabyProgressModel.empty();
      if(myBaby.length != 0){
      if (myBaby?.last.id != '') {
          DateTime dateTimeCreatedAt =
              DateTime.parse(myBaby.last.lastMenstruationDate!);
          DateTime dateTimeNow = DateTime.now();
          final differenceInDays =
              dateTimeNow.difference(dateTimeCreatedAt).inDays;
          weeks = (differenceInDays / 7).floor();
          days = (differenceInDays % 7).floor();
          babyProgressModel = await EventUser.checkBabyProgress(weeks.toString());
          print('$differenceInDays');
        }}
      babyProgressModel = await EventUser.checkBabyProgress(weeks.toString());
      final UserRolesModelFirebase role =
          await AppSharedPreference.getUserRoleFirebase();
      if (response.code == 200) {
        bool? _showGuide = await AppSharedPreference.getBool(AppSharedPreference.isShowGuide);
        print('show guide : $_showGuide');
        yield state.copyWith(
          submitStatus: FormzStatus.submissionSuccess,
          baby: myBaby,
          days: days.toString(),
          weeks: weeks.toString(),
          babyProgressModel: babyProgressModel,
          user: user,
          showGuide: _showGuide ?? true,
          role: user.isPatient == true
              ? StringConstant.patient
              : StringConstant.midwife,
        );
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
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

      if (response.code == 200){
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess, tipe: "deleteSchedule");
      } else{
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }



    } on EventErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      if( a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      }
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    }

  }

}
