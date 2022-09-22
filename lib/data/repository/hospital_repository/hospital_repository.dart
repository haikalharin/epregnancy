
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';

abstract class HospitalRepository {
  Future<List<HospitalModel>> fetchHospitals(String name);

}