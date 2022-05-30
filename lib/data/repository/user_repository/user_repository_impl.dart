
import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../model/user_model/user_model.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  UserRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<List<UserModel>> fetchUserList() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchUserList();
    }
    throw NetworkConnectionException();
  }

  @override
  Future insertUser(UserModel todo) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future login(String userName, String password) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.login(userName, password);
    }
    throw NetworkConnectionException();
  }

}
