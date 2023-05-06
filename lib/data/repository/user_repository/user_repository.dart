
import 'package:PregnancyApp/data/model/login_model/login_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';
import 'package:PregnancyApp/data/model/user_visit_model/user_visit_model.dart';

import '../../model/baby_model_api/baby_Model_api.dart';
import '../../model/point_model/checkin_response.dart';
import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();
  Future<UserModel> fetchUser();
  Future insertUser(UserExampleModel todo);
  Future <ResponseModel>register(UserModel userModel);
  Future <ResponseModel>updateQuestioner(SignupQuestRequest userModel);
  Future <ResponseModel>updateFcmToken(UserModel userModel);
  Future <ResponseModel>updateHospital(String hospitalId);
  Future <ResponseModel>updateDisclaimer(UserModel userModel);
  Future <ResponseModel>saveQuestionerBaby(BabyModelApi babyModelApi);
  Future <ResponseModel>updateQuestionerBaby(BabyModelApi babyModelApi, {bool isUpdateStatus = false});
  Future <ResponseModel>deleteBaby(BabyModelApi babyModelApi);
  Future <ResponseModel>getBaby(UserModel userModel);
  Future <ResponseModel>requestOtp(Map data);
  Future <ResponseModel>verifyOtp(OtpModel otpModel);
  Future <ResponseModel>checkInWithPin(String hospitalId, String pin);
  Future <ResponseModel>changePassword(String currentPassword, String newPassword);
  Future <ResponseModel>forgotPassword(Map data);
  Future <ResponseModel<UserModel>> fetchUsers(String name);
  Future <ResponseModel>changePhotoProfile(String userId, String imgProfile);
  Future<ResponseModel<UserVisitModel>> fetchUserVisit( int page, int size,String sortBy, String sort);
  Future <ResponseModel> submitNextVisit(String id,String nextVisitDate,String status);


  Future loginWithGoogle();
  Future<ResponseModel> login(LoginModel loginModel);
  Future<ResponseModel> biodataView(String password);
  Future<ResponseModel> loginNonOtp(LoginModel loginModel);

  Future<ResponseModel<UserModel>> getUserInfo();

  Future<ResponseModel<CheckinResponse>> hitCheckIn(String day);
  Future<ResponseModel<PointHistory>> fetchPointHistory();
  Future<ResponseModel> checkUserExist(String user, String type);

  logout();
}
