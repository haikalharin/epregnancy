import 'dart:async';

import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/repository/home_repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/home_error_exception.dart';
import '../../../common/exceptions/login_error_exception.dart';
import '../../../data/model/article_model/article_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../article_page/event/event_article.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this.homeRepository) : super(HomePageInitial());

  final HomeRepository homeRepository;

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomeFetchDataEvent) {
      yield* _mapHomeFetchUserToState(event, state);
    } else if (event is HomeInitEvent){
      yield _mapHomeInitEventToState(event,state);

    } else if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    }
  }
  Stream<HomePageState> _mapArticleFetchEventToState(
      ArticleFetchEvent event,
      HomePageState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      List<ArticleModel> lisArticleFix =[];
      final List<ArticleModel> lisArticle =
      await EventArticle.fetchAllArticle();
      if (lisArticle.isNotEmpty) {
        for(var i=0; i< 3; i++){
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
    return HomePageState();
  }

  Stream<HomePageState> _mapHomeFetchUserToState(
      HomeFetchDataEvent event,
      HomePageState state,
      ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress, tipe: "listArticle");
    try {

      final UserModelFirebase response = await homeRepository.fetchUser();

      if(response.uid!.isNotEmpty){
        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          user: response,
        );
      }


      else {
        yield state.copyWith(
            status: FormzStatus.submissionFailure);
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
