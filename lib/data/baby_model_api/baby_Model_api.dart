import '../model/base_model/base_model.dart';

class BabyModelApi implements BaseModel {
  String? id;
  String? userId;
  String? name;
  String? gender;
  String? dob;
  bool? isTwins;
  String? lastMenstruationDate;
  String? status;
  bool? isDelete;
  String? createdBy;
  String? createdFrom;
  String? createdDate;
  String? modifiedBy;
  String? modifiedFrom;
  String? modifiedDate;

  BabyModelApi(
      {this.id,
      this.userId,
      this.name,
      this.gender,
      this.dob,
      this.isTwins,
      this.lastMenstruationDate,
      this.status,
      this.isDelete,
      this.createdBy,
      this.createdFrom,
      this.createdDate,
      this.modifiedBy,
      this.modifiedFrom,
      this.modifiedDate});

  static BabyModelApi fromJson(Map<String, dynamic> json) {
    return BabyModelApi(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      gender: json['gender'],
      dob: json['dob'],
      isTwins: json['is_twins'],
      lastMenstruationDate: json['last_menstruation_date'],
      status: json['status'],
      isDelete: json['is_delete'],
      createdBy: json['created_by'],
      createdFrom: json['created_from'],
      createdDate: json['created_date'],
      modifiedBy: json['modified_by'],
      modifiedFrom: json['modified_from'],
      modifiedDate: json['modified_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['is_twins'] = this.isTwins;
    data['last_menstruation_date'] = this.lastMenstruationDate;
    data['status'] = this.status;
    data['is_delete'] = this.isDelete;
    data['created_by'] = this.createdBy;
    data['created_from'] = this.createdFrom;
    data['created_date'] = this.createdDate;
    data['modified_by'] = this.modifiedBy;
    data['modified_from'] = this.modifiedFrom;
    data['modified_date'] = this.modifiedDate;
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static BabyModelApi empty() {
    return BabyModelApi(
      id: '',
      userId: '',
      name: '',
      gender: '',
      dob: '',
      isTwins: false,
      lastMenstruationDate: '',
      status: '',
      isDelete: false,
      createdBy: '',
      createdFrom: '',
      createdDate: '',
      modifiedBy: '',
      modifiedFrom: '',
      modifiedDate: '',
    );
  }
}
