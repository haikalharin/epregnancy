import 'package:PregnancyApp/data/baby_model_api/baby_Model_api.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model_api.dart';

import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart' as ui;
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/g_authentication.dart';
import '../../model/response_model/response_model.dart';
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
  Future<UserModelApi> fetchUser() async {
    if (await networkInfo.isConnected) {
      UserModelApi userModelApi =
          await AppSharedPreference.getUserRegister();
      if (userModelApi.email!.isNotEmpty) {
        return userModelApi;
      } else {
        return UserModelApi.empty();
      }
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> register(UserModelApi user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.register(user);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateQuestioner(SignupQuestRequest user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateUser(user);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> saveQuestionerBaby(BabyModelApi baby) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.saveBaby(baby);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> getBaby(UserModelApi user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.getBaby(user);
      return responseModel;
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
      User? user = await GAuthentication.signInWithGoogle();
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
