

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
import '../model/response_model/response_model.dart';
import '../model/user_model/user_model.dart';

class RemoteDataSource {
  final HttpClient httpClient;

  RemoteDataSource({ required this.httpClient});


  /***proses***/
  Future<List<UserModel>> fetchUserList() async {
    final response = await httpClient.get(ServiceUrl.listUser);
    final data = <UserModel>[];

    getData(response).forEach((item) {
      data.add(UserModel.fromJson(item));
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

  Future<ResponseModel<UserModel>> loginOnine(UserModel userModel) async {
    final response =
    await httpClient.post(ServiceUrl.loginMobile, userModel.toLoginJson());

//    return null;
    return ResponseModel<UserModel>.fromJson(response, UserModel.fromJson);
  }

  Future<List<UserModel>> fetchListUser() async {
    final response = await httpClient.get(ServiceUrl.listKlaster);

    ResponseModel<dynamic> res = ResponseModel<UserModel>.fromJson(
        response, UserModel.fromJson);

    List<UserModel> datas = res.data.toList();

    print(res);
    return datas;
  }

  Future<ResponseModel> postUK(Map<String, dynamic> ujiKelayakan) async {
    final response = await httpClient.post(ServiceUrl.postUK, ujiKelayakan);
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }

  Future<ResponseModel> verifikasiOrKoreksi(UserModel userModel, String ukRegNo) async {
    final response = await httpClient.put(ServiceUrl.login +"/"+ ukRegNo, userModel.toJson());

//    return null;
    return ResponseModel.fromJson(response, ResponseModel.empty);
  }
}