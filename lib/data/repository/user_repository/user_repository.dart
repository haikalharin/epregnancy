
import '../../model/user_model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchUserList();

  Future insertUser(UserModel todo);


  Future login(String userName, String password);



  logout();
}
