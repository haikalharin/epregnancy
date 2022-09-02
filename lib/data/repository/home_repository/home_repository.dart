import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';

import '../../model/response_model/response_model.dart';
import '../../model/user_model_api/user_model_api.dart';

abstract class HomeRepository {
  Future<UserModelFirebase> fetchUser();
  Future <ResponseModel>getBaby(UserModelApi userModelApi);


}
