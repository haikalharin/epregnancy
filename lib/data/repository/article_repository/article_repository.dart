import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/baby_progress_model/simple_tip_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

abstract class ArticleRepository {
  Future<ResponseModel> fetchArticle(int page, String sort, String sortBy,
      { String title = '', String category = ''});

  Future<ResponseModel> readArticle(String id);
  Future<ResponseModel<SimpleTipResponse>> getSimpleTip();
}
