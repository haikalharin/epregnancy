import 'package:PregnancyApp/data/model/login_model/login_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart' as ui;
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../firebase/g_authentication.dart';
import '../../model/baby_model_api/baby_Model_api.dart';
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
  Future<UserModel> fetchUser() async {
    if (await networkInfo.isConnected) {
      UserModel userModel =
          await AppSharedPreference.getUserRegister();
      if (userModel.email!.isNotEmpty) {
        return userModel;
      } else {
        return userModel;
      }
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> register(UserModel user) async {
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
  Future<ResponseModel> updateQuestionerBaby(BabyModelApi baby) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateBaby(baby);
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
  Future<ResponseModel> getBaby(UserModel user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.getBaby(user);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> requestOtp(OtpModel otpModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.requestOtp(otpModel);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> verifyOtp(OtpModel otpModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.verifyOtp(otpModel);
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
  Future<ResponseModel> login(LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
    return remoteDatasource.login(loginModel);
    }
    throw NetworkConnectionException();
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
  @override
  Future<ResponseModel<UserModel>> checkUserExist(String user) async {
    if(await networkInfo.isConnected){
      return remoteDatasource.checkUserExist(user);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> changePassword(String currentPassword, String newPassword) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.getUserInfo();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> changePhotoProfile(String userId, String imgProfile) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.updatePhotoProfile(userId,imgProfile);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> loginNonOtp(LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.login(loginModel);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> forgotPassword (String userName) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.forgotPassword(userName);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

}
