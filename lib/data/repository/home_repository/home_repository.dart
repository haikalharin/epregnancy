import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/games_model/play_game_response.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

import '../../model/response_model/response_model.dart';
import '../../model/user_model_api/user_model.dart';

abstract class HomeRepository {
  Future<UserModelFirebase> fetchUser();
  Future <ResponseModel>getBaby(UserModel UserModel);
  Future <ResponseModel>fetchListArticle();

  Future <ResponseModel>fetchBabyChilds();
  Future <ResponseModel>fetchChildForDashBoard(String id);

  Future<ResponseModel<GamesResponse>> fetchGameList();
  Future<ResponseModel<PlayGameResponse>> getPointFromGame(String gameId);

}
