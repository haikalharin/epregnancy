
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart' as ui;
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/g_authentication.dart';
import '../../model/point_model/checkin_response.dart';
import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';
import '../../remote_datasource/remote_datasource.dart';
import '../../shared_preference/app_shared_preference.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  UserRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<List<UserExampleModel>> fetchUserList() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchUserList();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<UserModelFirebase> fetchUser() async {
    if (await networkInfo.isConnected) {
      UserModelFirebase userModelFirebase =
      await AppSharedPreference.getUserRegister();
      if (userModelFirebase.uid!.isNotEmpty) {
        return userModelFirebase;
      } else {
        return UserModelFirebase.empty();
      }
    }
    throw NetworkConnectionException();
  }

  @override
  Future insertUser(UserExampleModel todo) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future loginWithGoogle() async {
    if (await networkInfo.isConnected) {
    User? user =
      await GAuthentication.signInWithGoogle();
    return user;
    }
    throw NetworkConnectionException();
  }
  @override
  Future login(String userName, String password) async {
    // if (await networkInfo.isConnected) {
      return remoteDatasource.login(userName, password);
    // }
    // throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ui.UserInfo>> getUserInfo() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.getUserInfo();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<CheckinResponse>> hitCheckIn(String day) async {
    if(await networkInfo.isConnected){
      return remoteDatasource.hitCheckInToday(day);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<List<PointHistory>> fetchPointHistory() async {
    if(await networkInfo.isConnected){
      return remoteDatasource.fetchPointHistory();
    }
    throw NetworkConnectionException();
  }

}
