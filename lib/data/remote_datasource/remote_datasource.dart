import 'package:PregnancyApp/data/model/chat_model/chat_response.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';

import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/point_model/checkin_response.dart';
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
import '../model/baby_model_api/baby_Model_api.dart';
import '../model/login_model/login_model.dart';
import '../model/response_model/response_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/signup_quest_request.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({required this.httpClient});

  /***proses***/
  Future<List<UserExampleModel>> fetchUserList() async {
    final response = await httpClient.get(ServiceUrl.login);
    final data = <UserExampleModel>[];

    getData(response).forEach((item) {
      data.add(UserExampleModel.fromJson(item));
    });

    return data;
  }

  Future<ResponseModel> login(LoginModel loginModel) async {
    final response =
    await httpClient.post(ServiceUrl.login, loginModel);

    return ResponseModel<UserModel>.fromJson(
        response, UserModel.fromJson);
  }


  Future<ResponseModel<UserExampleModel>> loginOnine(
      UserExampleModel userModel) async {
    final response =
        await httpClient.post(ServiceUrl.loginMobile, userModel.toLoginJson());

//    return null;
    return ResponseModel<UserExampleModel>.fromJson(
        response, UserExampleModel.fromJson);
  }

  Future<List<UserExampleModel>> fetchListUser() async {
    final response = await httpClient.get(ServiceUrl.login);

    ResponseModel<dynamic> res = ResponseModel<UserExampleModel>.fromJson(
        response, UserExampleModel.fromJson);

    List<UserExampleModel> datas = res.data.toList();

    print(res);
    return datas;
  }

  Future<ResponseModel> register(UserModel user) async {
    try {
      final response =
          await httpClient.post(ServiceUrl.register, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateUser(SignupQuestRequest user) async {
    try {
      final response =
      await httpClient.put(ServiceUrl.updateUser, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }
  Future<ResponseModel> saveBaby(BabyModelApi baby) async {
    try {
      final response =
      await httpClient.post(ServiceUrl.saveBaby, baby);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }
  Future<ResponseModel> updateBaby(BabyModelApi baby) async {
    try {
      final response =
      await httpClient.post(ServiceUrl.updateBaby, baby);
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> updateQuestioner(UserModel user) async {
    try {
      final response = await httpClient.put(ServiceUrl.updateQuestioner, user);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> getBaby(UserModel UserModel) async {
    try {
      Map<String, String> qParams = {
        'user_id': '${UserModel.id}'
      };
      final response =
      await httpClient.get(ServiceUrl.listBaby,queryParameters: qParams );
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> requestOtp(OtpModel otpModel) async {
    try {
      final response =
      await httpClient.post(ServiceUrl.requestOtp ,otpModel);
      return ResponseModel.fromJson(response, OtpModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }

  Future<ResponseModel> loginOtp(OtpModel otpModel) async {
    try {
      final response =
      await httpClient.post(ServiceUrl.loginOtp ,otpModel);
      return ResponseModel.fromJson(response, UserModel.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }
/// ListEvent
  Future<ResponseModel> fetchListArticle() async {
    try {
      final response =
      await httpClient.get(ServiceUrl.listArticle );
      return ResponseModel.fromJson(response, BabyModelApi.fromJson);
    } catch (e) {
      return ResponseModel.dataEmpty();
    }
  }










  Future<ResponseModel> postUK(Map<String, dynamic> ujiKelayakan) async {
    final response = await httpClient.post(ServiceUrl.login, ujiKelayakan);
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel> verifikasiOrKoreksi(
      UserExampleModel userModel, String ukRegNo) async {
    final response = await httpClient.put(
        ServiceUrl.login + "/" + ukRegNo, userModel.toJson());

//    return null;
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel<UserInfo>> getUserInfo() async {
    final response = await httpClient.get(ServiceUrl.userInfo);

//    return null;
    return ResponseModel<UserInfo>.fromJson(response, UserInfo.fromJson);
  }

  Future<ResponseModel<CheckinResponse>> hitCheckInToday(String day) async {
    final response = await httpClient.post(ServiceUrl.checkIn + day, {});

//    return null;
    return ResponseModel<CheckinResponse>.fromJson(response, CheckinResponse.fromJson);
  }

  Future<List<PointHistory>> fetchPointHistory() async {
    final response = await httpClient.get(ServiceUrl.pointHistory);
    final data = <PointHistory>[];
    getData(response).forEach((item) {
      data.add(PointHistory.fromJson(item));
    });
    return data;
  }

  Future<List<GamesResponse>> fetchGameList() async {
    final response = await httpClient.get(ServiceUrl.gameList);
    final data = <GamesResponse>[];
    getData(response).forEach((item) {
      data.add(GamesResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatResponse>> fetchLatestChat() async {
    final response = await httpClient.get(ServiceUrl.latestChat);
    final data = <ChatResponse>[];
    getData(response).forEach((item) {
      data.add(ChatResponse.fromJson(item));
    });
    return data;
  }

  Future<List<ChatResponse>> fetchPersonalChatRoom(String id) async {
    final response = await httpClient.get(ServiceUrl.personalChatRoom + id);
    final data = <ChatResponse>[];
    getData(response).forEach((item) {
      data.add(ChatResponse.fromJson(item));
    });
    return data;
  }
}