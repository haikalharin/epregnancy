import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

abstract class ArticleRepository {
  Future<List<ArticleModel>> fetchArticle({bool isSearch, String keyword});
  Future<ResponseModel> readArticle(String id);

}
