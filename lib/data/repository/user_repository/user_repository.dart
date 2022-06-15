
import '../../model/user_example_model/user_example_model.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();

  Future insertUser(UserExampleModel todo);


  Future loginWithGoogle();
  Future login(String userName, String password);



  logout();
}
