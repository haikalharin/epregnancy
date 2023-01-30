import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/firebase/event/event_article.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/article_repository/article_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/article_error_exception.dart';
import '../../../common/exceptions/server_error_exception.dart';
import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../utils/string_constans.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  ArticlePageBloc(this.articleRepository) : super(ArticlePageInitial());

  final ArticleRepository articleRepository;

  @override
  Stream<ArticlePageState> mapEventToState(ArticlePageEvent event) async* {
    if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    } else if (event is ArticleReadEvent) {
      yield* _mapArticleReadEventToState(event, state);
    } else if (event is ArticleBackEvent) {
      yield _mapArticleBackEventToState(event, state);
    }
  }

  ArticlePageState _mapArticleBackEventToState(
    ArticleBackEvent event,
    ArticlePageState state,
  ) {
    return state.copyWith(
      isSearch: false,
    );
  }

  Stream<ArticlePageState> _mapArticleFetchEventToState(
    ArticleFetchEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      var category = "";
      if (event.condition == StringConstant.pregnant) {
        category = "Kehamilan";
      } else if (event.condition == StringConstant.notPregnant) {
        category = "Tidak Hamil";
      } else if (event.condition == StringConstant.postMaternity) {
        category = "Memiliki Bayi";
      }
      final List<ArticleModel> listArticle =
          await articleRepository.fetchArticle(
              isSearch: event.isSearch,
              keyword: event.keyword,
              category: category);
      if (listArticle.isNotEmpty) {
        yield state.copyWith(
            listArticle: listArticle,
            submitStatus: FormzStatus.submissionSuccess,
            isSearch: event.isSearch);
      } else {
        yield state.copyWith(
            submitStatus: FormzStatus.submissionSuccess,
            listArticle: [],
            isSearch: event.isSearch);
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<ArticlePageState> _mapArticleReadEventToState(
    ArticleReadEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(submitStatus: FormzStatus.submissionInProgress);
    try {
      final ResponseModel response =
          await articleRepository.readArticle(event.id);
      if (response.code == 200) {
        yield state.copyWith(submitStatus: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    } on ArticleErrorException catch (e) {
      print(e);
      yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      if (a is UnAuthorizeException) {
        await AppSharedPreference.sessionExpiredEvent();
        // yield state.copyWith(submitStatus: FormzStatus.submissionFailure, errorMessage: a.message);
      } else {
        yield state.copyWith(submitStatus: FormzStatus.submissionFailure);
      }
    }
  }
//

}
