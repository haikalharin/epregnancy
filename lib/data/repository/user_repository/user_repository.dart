
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_mode_api/UserModelApi.dart';

import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();
  Future<UserModelApi> fetchUser();
  Future insertUser(UserExampleModel todo);
  Future <ResponseModel>register(UserModelApi userModelApi);


  Future loginWithGoogle();
  Future login(String userName, String password);



  logout();
}
