

import '../../common/network/http/http_client.dart';
import '../../common/remote/url/service_url.dart';
import '../../utils/remote_utils.dart';
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

  Future<String> login(String userName, String password) async {
    String data = "";

    if (userName == "haikal" && password == "admin"){
      data = "Berhasil";
    } else{
      data = "Gagal";
    }

    return data;
  }
}