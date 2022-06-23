
import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();
  Future<UserModelFirebase> fetchUser();
  Future insertUser(UserExampleModel todo);


  Future loginWithGoogle();
  Future login(String userName, String password);



  logout();
}
