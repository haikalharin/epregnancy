
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';

import '../../../common/exceptions/network_connection_exception.dart';
import '../../../common/network/network_info.dart';
import '../../remote_datasource/remote_datasource.dart';
import 'hospital_repository.dart';

class HospitalRepositoryImpl extends HospitalRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDatasource;

  HospitalRepositoryImpl(this.networkInfo, this.remoteDatasource);

  @override
  Future<List<HospitalModel>> fetchHospitals(String name) async {
    if (await networkInfo.isConnected) {
      return remoteDatasource.fetchHospitals(name);
    }
    throw NetworkConnectionException();
  }

}