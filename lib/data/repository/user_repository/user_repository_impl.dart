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
import '../../model/user_visit_model/user_visit_model.dart';
import '../../remote_datasource/remote_datasource.dart';
import '../../shared_preference/app_shared_preference.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  UserRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel<UserModel>> fetchUsers(String name) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchUsers(name);
    }
    throw NetworkConnectionException();
  }

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
  Future<ResponseModel> updateFcmToken(UserModel user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateFcmToken(user);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateHospital(String hospitalId) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateHospital(hospitalId);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateDisclaimer(UserModel user) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateDisclaimer(user);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateQuestionerBaby(BabyModelApi baby,{bool isUpdateStatus = false}) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.updateBaby(baby,isUpdateStatus:isUpdateStatus );
      return responseModel;
    }
    throw NetworkConnectionException();
  }
  @override
  Future<ResponseModel> deleteBaby(BabyModelApi baby) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.deleteBaby(baby);
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
  Future<ResponseModel> requestOtp(Map data) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.requestOtp(data);
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
  Future<ResponseModel<UserModel>> getUserInfo() async {
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
  Future<ResponseModel<PointHistory>> fetchPointHistory() async {
    if(await networkInfo.isConnected){
      return remoteDatasource.fetchPointHistory();
    }
    throw NetworkConnectionException();
  }
  @override
  Future<ResponseModel> checkUserExist(String user, String type) async {
    if(await networkInfo.isConnected){
      return remoteDatasource.checkUserExist(user,type);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> changePassword(String currentPassword, String newPassword) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.changePassword(currentPassword, newPassword);
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
  Future<ResponseModel> forgotPassword (Map data) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.forgotPassword(data);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> checkInWithPin(String hospitalId, String pin) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.pinSubmitCheckIn(hospitalId, pin);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> biodataView(String password) async {
    if (await networkInfo.isConnected) {
      ResponseModel responseModel = await remoteDatasource.biodataView(password);
      return responseModel;
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<UserVisitModel>> fetchUserVisit( int page,int size, String sortBy, String sort) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchUserVisit( page: page,sortBy: sortBy,sort: sort,size:size
      );
    }
    throw NetworkConnectionException();
  }
  @override
  Future<ResponseModel> submitNextVisit(String id,String nextVisitDate,String status) async {
    if (await networkInfo.isConnected) {
      ResponseModel response =
      await remoteDatasource.submitNextVisit(id,nextVisitDate,status);
      return response;
    }
    throw NetworkConnectionException();
  }
}
