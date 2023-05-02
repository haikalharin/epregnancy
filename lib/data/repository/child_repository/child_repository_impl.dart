
import 'package:PregnancyApp/data/model/child_model/child_list_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/repository/child_repository/child_repository.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../remote_datasource/remote_datasource.dart';

class ChildRepositoryImpl extends ChildRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  ChildRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel> addChild(String? name, String dob, String gender) async {
    if (await networkInfo.isConnected) {
      Map data = {
        "name": name,
        "dob": dob,
        "gender": gender
      };
      return remoteDatasource.addChild(data);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateBabyStatus(String id, String status) async {
    if (await networkInfo.isConnected) {
      Map data = {
        "id": id,
        "status": status,
      };
      return remoteDatasource.updateBabyStatus(data);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> deleteBaby(String id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.deleteBaby(id);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<ChildListResponse>> fetchChildList() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchChildList();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> updateChild(String? id, String? name, String dob, String gender) async {
    if (await networkInfo.isConnected) {
      Map data = {
        "id": id,
        "name": name,
        "dob": dob,
        "gender": gender
      };
      return remoteDatasource.updateChild(data);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel> deleteChild(String id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.deleteChild(id);
    }
    throw NetworkConnectionException();
  }
}