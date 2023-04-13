

import '../../model/response_model/response_model.dart';

abstract class ChildRepository {
  Future<ResponseModel> addChild(String? name, String dob, String gender);
  Future<ResponseModel> updateBabyStatus(String id, String status);

}