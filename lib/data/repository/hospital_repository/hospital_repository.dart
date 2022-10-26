
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';

abstract class HospitalRepository {
  Future<ResponseModel<HospitalModel>> fetchHospitals(String name);
  Future<ResponseModel<HospitalModel>> fetchHospitalsById(String id);

}