

import 'package:PregnancyApp/data/model/growth_model/growth_model.dart';

import '../../model/child_model/child_list_response.dart';
import '../../model/response_model/response_model.dart';

abstract class ChildRepository {
  Future<ResponseModel> addChild(String? name, String dob, String gender);
  Future<ResponseModel> addChildGrowth({String? visitDate, double? length, double? weight, double? headCircumference, String? babyId});
  Future<ResponseModel> updateChild(String? id, String? name, String dob, String gender);
  Future<ResponseModel> updateBabyStatus(String id, String status);
  Future<ResponseModel> deleteBaby(String id);
  Future<ResponseModel> deleteChild(String id);
  Future<ResponseModel<ChildListResponse>> fetchChildList();
  Future<ResponseModel<GrowthModel>> fetchAllGrowth(String id);

}