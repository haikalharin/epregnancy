import 'dart:async';
import 'dart:math';

import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/firebase/event/event_article.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../common/exceptions/survey_error_exception.dart';
import '../../../data/firebase/event/event_user.dart';
import '../../../data/model/user_model_firebase/user_model_firebase.dart';
import '../../../data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import '../../../data/repository/user_repository/user_repository.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  ArticlePageBloc(this.userRepository) : super(ArticlePageInitial());

  final UserRepository userRepository;

  @override
  Stream<ArticlePageState> mapEventToState(ArticlePageEvent event) async* {
    if (event is ArticleFetchEvent) {
      yield* _mapArticleFetchEventToState(event, state);
    }
  }

  Stream<ArticlePageState> _mapArticleFetchEventToState(
    ArticleFetchEvent event,
    ArticlePageState state,
  ) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      final List<ArticleModel> lisArticle =
          await EventArticle.fetchCategoriArticle(condition: event.condition);
      if (lisArticle.isNotEmpty) {
        yield state.copyWith(
            listArticle: lisArticle, status: FormzStatus.submissionSuccess);
      }
    } on SurveyErrorException catch (e) {
      print(e);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    } on Exception catch (a) {
      print(a);
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
//

}
