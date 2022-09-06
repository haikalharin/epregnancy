

import 'package:PregnancyApp/data/model/games_model/games_response.dart';
import 'package:PregnancyApp/data/model/point_model/checkin_response.dart';
import 'package:PregnancyApp/data/model/point_model/point_history.dart';
import 'package:PregnancyApp/data/model/user_info/user_info.dart';

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
import '../model/response_model/response_model.dart';
import '../model/user_example_model/user_example_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({ required this.httpClient});


  /***proses***/
  Future<List<UserExampleModel>> fetchUserList() async {
    final response = await httpClient.get(ServiceUrl.login);
    final data = <UserExampleModel>[];

    getData(response).forEach((item) {
      data.add(UserExampleModel.fromJson(item));
    });

    return data;
  }

  Future<bool> login(String userName, String password) async {
    bool data = false;

    if (userName == "haikal" && password == "admin"){
      data = true;
    } else{
      data = false;
    }

    return data;
  }

  Future<ResponseModel<UserExampleModel>> loginOnine(UserExampleModel userModel) async {
    final response =
    await httpClient.post(ServiceUrl.loginMobile, userModel.toLoginJson());

//    return null;
    return ResponseModel<UserExampleModel>.fromJson(response, UserExampleModel.fromJson);
  }

  Future<List<UserExampleModel>> fetchListUser() async {
    final response = await httpClient.get(ServiceUrl.login);

    ResponseModel<dynamic> res = ResponseModel<UserExampleModel>.fromJson(
        response, UserExampleModel.fromJson);

    List<UserExampleModel> datas = res.data.toList();

    print(res);
    return datas;
  }

  Future<ResponseModel> postUK(Map<String, dynamic> ujiKelayakan) async {
    final response = await httpClient.post(ServiceUrl.login, ujiKelayakan);
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel> verifikasiOrKoreksi(UserExampleModel userModel, String ukRegNo) async {
    final response = await httpClient.put(ServiceUrl.login +"/"+ ukRegNo, userModel.toJson());

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
}