
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/members_model/member.dart';
import 'package:PregnancyApp/data/model/members_model/members_summary_response.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'hospital_repository.dart';

class HospitalRepositoryImpl extends HospitalRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  HospitalRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<ResponseModel<HospitalModel>> fetchHospitals(String name) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchHospitals(name);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<HospitalModel>> fetchHospitalsById(String id) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchHospitalsById(id);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<MembersSummaryResponse>> fetchMembersSummary() async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.getMembersSummary();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<Member>> fetchMembers(String name, int page) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchMembers(name: name, page: page);
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ResponseModel<Member>> fetchMidwifes(String name, int page) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchMidwifes(name: name, page: page);
    }
    throw NetworkConnectionException();
  }

}