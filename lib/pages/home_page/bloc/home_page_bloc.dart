import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_event.dart';
import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/home_error_exception.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/model/baby_model/baby_model.dart';
import '../../../data/model/baby_model_api/baby_Model_api.dart';
import '../../../data/model/baby_progress_model/baby_progress_model.dart';
import '../../../data/model/user_info/user_info.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../data/firebase/event/event_article.dart';
import '../../../utils/function_utils.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this.homeRepository, this.userRepository) : super(HomePageInitial());

  final HomeRepository homeRepository;
  final UserRepository userRepository;

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
    yield state.copyWith(status: FormzStatus.submissionInProgress,tipe: "listEvent");
    try {
      List<EventModel> listEventBeforeSort = [];
      UserModelFirebase person = await AppSharedPreference.getUserFirebase();
      List<EventModel> listEvent = [];
      if (event.type == StringConstant.typePersonal) {
        listEvent = await EventEvent.fetchCategoriEventPersonal(
            type: event.type, userId: person.uid);
      } else {
        listEvent = await EventEvent.fetchCategoriEvent(
            type: event.type, userId: person.uid);
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
                status: FormzStatus.submissionSuccess);
          } else {
            yield state.copyWith(
                eventDateString: dateTimeString,
                eventDate: event.date,
                listEventPersonal: listEventFix,
                status: FormzStatus.submissionSuccess);
          }
        } else {
          yield state.copyWith(
              eventDateString: dateTimeString,
              status: FormzStatus.submissionFailure);
        }
      } else {
        var outputFormat = DateFormat.yMMMMd('id');
        var dateTimeString = outputFormat.format(event.date);
        yield state.copyWith(
            eventDateString: dateTimeString,
            eventDate: event.date,
            listEventPersonal: listEventBeforeSort,
            status: FormzStatus.submissionSuccess);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

  Stream<HomePageState> _mapPointFetchEventToState(
      PointFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, tipe: "fetchtotalPoint");
    try {
      final ResponseModel<UserInfo> userInfo = await userRepository.getUserInfo();
      await AppSharedPreference.remove(AppSharedPreference.checkIn);
      if(userInfo.code == 200) {
        await AppSharedPreference.setUserInfo(userInfo.data);
        yield state.copyWith(
            status: FormzStatus.submissionSuccess, totalPointsEarned: userInfo.data.totalPointsEarned);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure, errorMessage: e.message);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure, errorMessage: a.toString());
    }
  }

  Stream<HomePageState> _mapArticleFetchEventToState(
      ArticleFetchEvent event,
      HomePageState state,
      ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, tipe: "listArticle");
    try {
      List<ArticleModel> lisArticleFix = [];
      final List<ArticleModel> lisArticle = await EventArticle.fetchAllArticle();
      if (lisArticle.isNotEmpty) {
        for (var i = 0; i < 3; i++) {
          lisArticleFix.add(lisArticle[i]);
        }
        yield state.copyWith(
            listArticle: lisArticleFix, status: FormzStatus.submissionSuccess);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
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
        status: FormzStatus.submissionInProgress);
    try {
      var days = 0;
      var weeks = 0;
      UserModel? userRegister = await AppSharedPreference.getUserRegister();
      if(userRegister.id != null){
        UserModel? user = await AppSharedPreference.getUserRegister();
        await AppSharedPreference.setUser(user);
        await AppSharedPreference.remove("_userRegister");
      }

      final UserModel user = await AppSharedPreference.getUser();
      ResponseModel response = await homeRepository.getBaby(user);
      final myBaby = response.data;
      BabyProgressModel babyProgressModel = BabyProgressModel.empty();
      if(myBaby.length != 0){
      if (myBaby.last.id != '') {
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
        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          baby: myBaby,
          days: days.toString(),
          weeks: weeks.toString(),
          babyProgressModel: babyProgressModel,
          user: user,
          role: user.isPatient == true
              ? StringConstant.patient
              : StringConstant.midwife,
        );
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    } on HomeErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
//

}
