import 'package:PregnancyApp/data/model/article_model/article_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/pages/article_page/bloc/article_bloc.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/event/event_article.dart';
import '../../remote_datasource/remote_datasource.dart';
import '../../shared_preference/app_shared_preference.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  ArticleRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<List<ArticleModel>> fetchArticle({bool isSearch = false, String keyword = "", String category = ""}) async {
    if (await networkInfo.isConnected) {
      if(isSearch){
        return remoteDatasource.searchArticle(isSearch, keyword);
      } else {
        return remoteDatasource.fetchArticle(category);
      }
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> readArticle(String id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.readArticle(id);
    }
    throw NetworkConnectionException();
  }
}
