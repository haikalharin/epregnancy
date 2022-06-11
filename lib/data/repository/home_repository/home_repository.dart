import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

abstract class HomeRepository {
  Future<UserModelFirebase> fetchUser();

}
