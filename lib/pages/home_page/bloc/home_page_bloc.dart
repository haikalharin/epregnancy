import 'dart:async';

import 'package:PregnancyApp/data/firebase/event/event_event.dart';
import 'package:PregnancyApp/data/model/event_model/event_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:PregnancyApp/utils/string_constans.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/home_error_exception.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/model/baby_model/baby_model.dart';
import '../../../data/model/baby_progress_model/baby_progress_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../data/firebase/event/event_article.dart';
import '../../../utils/function_utils.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this.homeRepository) : super(HomePageInitial());

  final HomeRepository homeRepository;

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
    yield state.copyWith(status: FormzStatus.submissionInProgress);
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

  Stream<HomePageState> _mapArticleFetchEventToState(
    ArticleFetchEvent event,
    HomePageState state,
  ) async* {
    yield state.copyWith(
        status: FormzStatus.submissionInProgress, tipe: "listArticle");
    try {
      List<ArticleModel> lisArticleFix = [];
      final List<ArticleModel> lisArticle =
          await EventArticle.fetchAllArticle();
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
        status: FormzStatus.submissionInProgress, tipe: "listEvent");
    try {
      var days = 0;
      var weeks = 0;
      BabyProgressModel babyProgressModel = BabyProgressModel.empty();
      AppSharedPreference.remove("_userRegister");
      final UserModelFirebase response = await homeRepository.fetchUser();
      final BabyModel myBaby = await AppSharedPreference.getUserBabyirebase();
      final UserRolesModelFirebase role =
          await AppSharedPreference.getUserRoleFirebase();
      if (myBaby.babyProfileid != '') {
        DateTime dateTimeCreatedAt =
            DateTime.parse(myBaby.lastMenstruationDate!);
        DateTime dateTimeNow = DateTime.now();
        final differenceInDays =
            dateTimeNow.difference(dateTimeCreatedAt).inDays;
        weeks = (differenceInDays / 7).floor();
        days = (differenceInDays % 7).floor();
        babyProgressModel = await EventUser.checkBabyProgress(weeks.toString());
        print('$differenceInDays');
      }

      if (response.uid!.isNotEmpty) {
        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          baby: myBaby,
          days: days.toString(),
          weeks: weeks.toString(),
          babyProgressModel: babyProgressModel,
          user: response,
          role: role,
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
