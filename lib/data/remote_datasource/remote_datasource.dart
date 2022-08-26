

import 'package:PregnancyApp/data/model/user_mode_api/UserModelApi.dart';

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

  Future<ResponseModel> register(UserModelApi user) async {
    try{
      final response = await httpClient.post(ServiceUrl.register, user );
      return ResponseModel.fromJson(response, UserModelApi.fromJson);
    } catch(e){
      print("###### $e #######");
      return ResponseModel.dataEmpty();

    }

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
}