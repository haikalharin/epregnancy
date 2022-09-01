
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';

import '../../model/point_model/checkin_response.dart';
import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();
  Future<UserModelFirebase> fetchUser();
  Future insertUser(UserExampleModel todo);


  Future loginWithGoogle();
  Future login(String userName, String password);

  Future<ResponseModel<UserInfo>> getUserInfo();

  Future<ResponseModel<CheckinResponse>> hitCheckIn(String day);
  Future<List<PointHistory>> fetchPointHistory();


  logout();
}
