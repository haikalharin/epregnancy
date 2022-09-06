import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

abstract class HomeRepository {
  Future<UserModelFirebase> fetchUser();

  Future<List<GamesResponse>> fetchGameList();

}
