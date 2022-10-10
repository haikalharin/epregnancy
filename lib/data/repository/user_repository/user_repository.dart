
import 'package:PregnancyApp/data/model/login_model/login_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/signup_quest_request.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';

import '../../model/baby_model_api/baby_Model_api.dart';
import '../../model/point_model/checkin_response.dart';
import '../../model/user_example_model/user_example_model.dart';
import '../../model/user_model_firebase/user_model_firebase.dart';

abstract class UserRepository {
  Future<List<UserExampleModel>> fetchUserList();
  Future<UserModel> fetchUser();
  Future insertUser(UserExampleModel todo);
  Future <ResponseModel>register(UserModel UserModel);
  Future <ResponseModel>updateQuestioner(SignupQuestRequest UserModel);
  Future <ResponseModel>saveQuestionerBaby(BabyModelApi babyModelApi);
  Future <ResponseModel>updateQuestionerBaby(BabyModelApi babyModelApi);
  Future <ResponseModel>getBaby(UserModel UserModel);
  Future <ResponseModel>requestOtp(OtpModel otpModel);
  Future <ResponseModel>verifyOtp(OtpModel otpModel);
  Future <ResponseModel>changePassword(String currentPassword, String newPassword);
  Future <ResponseModel>forgotPassword(String userName);
  Future <ResponseModel>changePhotoProfile(String userId, String imgProfile);


  Future loginWithGoogle();
  Future<ResponseModel> login(LoginModel loginModel);
  Future<ResponseModel> loginNonOtp(LoginModel loginModel);

  Future<ResponseModel<UserInfo>> getUserInfo();

  Future<ResponseModel<CheckinResponse>> hitCheckIn(String day);
  Future<List<PointHistory>> fetchPointHistory();
  Future<ResponseModel<UserModel>> checkUserExist(String user);

  logout();
}
