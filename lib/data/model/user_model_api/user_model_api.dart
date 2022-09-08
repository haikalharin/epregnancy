import 'package:PregnancyApp/data/baby_model_api/baby_Model_api.dart';

import '../base_model/base_model.dart';

class UserModelApi implements BaseModel {
  String? id;
  String? name;
  String? username;
  String? password;
  String? dob;
  String? mobile;
  String? email;
  String? token;
  String? otp;
  String? status;
  bool? isPatient;
  bool? isMidwife;
  bool? isAdmin;
  bool? isSuperAdmin;
  bool? isVerified;
  dynamic points;
  bool? isPregnant;
  bool? isPlanningPregnancy;
  bool? isHaveBaby;
  String? imageUrl;
  String? coverUrl;
  bool? isDelete;
  String? createdBy;
  String? createdFrom;
  String? createdDate;
  String? modifiedBy;
  String? modifiedFrom;
  String? modifiedDate;
  List<BabyModelApi>? babies;

  UserModelApi(
      {this.id,
      this.name,
      this.username,
      this.password,
      this.dob,
      this.mobile,
      this.email,
      this.token,
      this.otp,
      this.status,
      this.isPatient,
      this.isMidwife,
      this.isAdmin,
      this.isSuperAdmin,
      this.isVerified,
      this.points,
      this.isPregnant,
      this.isPlanningPregnancy,
      this.isHaveBaby,
      this.imageUrl,
      this.coverUrl,
      this.isDelete,
      this.createdBy,
      this.createdFrom,
      this.createdDate,
      this.modifiedBy,
      this.modifiedFrom,
      this.modifiedDate,
      this.babies});

  static UserModelApi fromJson(Map<String, dynamic> json) {
    List<BabyModelApi> babies = [];
    if (json['babies'] != null && json['babies'].length != 0) {
      if (json['babies']) {
        babies = <BabyModelApi>[];
        json['babies'].forEach((v) {
          babies.add(BabyModelApi.fromJson(v));
        });
      }
    }
    return UserModelApi(
      id: json['id'] ?? '',
        email: json['email'] ?? '',
        name: json['name'] ?? '',
        password: json['password'] ?? '',
        dob: json['dob'] ?? '',
        mobile: json['mobile'] ?? '',
        username: json['username'] ?? '',
        token: json['token'] ?? '',
        otp: json['otp'] ?? '',
        status: json['status'] ?? '',
        isPatient: json['is_patient'] ?? false,
        isMidwife: json['is_midwife'] ?? false,
        isAdmin: json['is_admin'] ?? false,
        isSuperAdmin: json['is_super_admin'] ?? false,
        isVerified: json['is_verified'] ?? false,
        points: json['points'],
        isPregnant: json['is_pregnant'] ?? false,
        isPlanningPregnancy: json['is_planning_pregnancy'] ?? false,
        isHaveBaby: json['is_have_baby'] ?? false,
        imageUrl: json['image_url'] ?? '',
        coverUrl: json['cover_url'] ?? '',
        isDelete: json['is_delete'] ?? false,
        createdBy: json['created_by'] ?? '',
        createdFrom: json['created_from'] ?? '',
        createdDate: json['created_date'] ?? '',
        modifiedBy: json['modified_by'] ?? '',
        modifiedFrom: json['modified_from'] ?? '',
        modifiedDate: json['modified_date'] ?? '',
        babies: babies);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['token'] = this.token;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['is_patient'] = this.isPatient;
    data['is_midwife'] = this.isMidwife;
    data['is_admin'] = this.isAdmin;
    data['is_super_admin'] = this.isSuperAdmin;
    data['is_verified'] = this.isVerified;
    data['points'] = this.points;
    data['is_pregnant'] = this.isPregnant;
    data['is_planning_pregnancy'] = this.isPlanningPregnancy;
    data['is_have_baby'] = this.isHaveBaby;
    data['image_url'] = this.imageUrl;
    data['cover_url'] = this.coverUrl;
    data['is_delete'] = this.isDelete;
    data['created_by'] = this.createdBy;
    data['created_from'] = this.createdFrom;
    data['created_date'] = this.createdDate;
    data['modified_by'] = this.modifiedBy;
    data['modified_from'] = this.modifiedFrom;
    data['modified_date'] = this.modifiedDate;
    if (babies != null) {
      data['babies'] = babies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static UserModelApi empty() {
    return UserModelApi(
      id: '',
        email: '',
        name: '',
        password: '',
        dob: '',
        mobile: '',
        username: '',
        isPatient: false,
        token: '',
        otp: '',
        status: '',
        isMidwife: false,
        isAdmin: false,
        isSuperAdmin: false,
        isVerified: false,
        points: '',
        isPregnant: false,
        isPlanningPregnancy: false,
        isHaveBaby: false,
        imageUrl: '',
        coverUrl: '',
        isDelete: false,
        createdBy: '',
        createdFrom: '',
        createdDate: '',
        modifiedBy: '',
        modifiedFrom: '',
        modifiedDate: '',
        babies: []);
  }
}
