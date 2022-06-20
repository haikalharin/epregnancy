import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class UserModelFirebase implements BaseModel {
  String? createdDate;
  String? email;
  String? gender;
  String? mobilePhone;
  String? name;
  String? password;
  String? sex;
  String? uid;
  String? status;
  String? userid;

  UserModelFirebase({
    this.createdDate,
    this.email,
    this.gender,
    this.mobilePhone,
    this.name,
    this.password,
    this.sex,
    this.uid,
    this.status,
    this.userid,
  });

  static UserModelFirebase fromJson(Map<String, dynamic> json) {
    return UserModelFirebase(
      createdDate: json['CreatedDate'] != null
          ? json['CreatedDate'] is String
              ? json['CreatedDate']
              : (json['CreatedDate'] as Timestamp).toDate().toIso8601String()
          : '',
      email: json['Email'] ?? '',
      gender: json['Gender'] ?? '',
      mobilePhone: json['MobilePhone'] ?? '',
      name: json['Name'] ?? '',
      password: json['Password'] ?? '',
      sex: json['Sex'] ?? '',
      uid: json['Uid'] ?? '',
      status: json['Status'] ?? '',
      userid: json['Userid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'CreatedDate': createdDate,
        'Email': email,
        'Gender': gender,
        'MobilePhone': mobilePhone,
        'Name': name,
        'Password': password,
        'Sex': sex,
        'Uid': uid,
        'Status': status,
        'Userid': userid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static UserModelFirebase empty() {
    return UserModelFirebase(
      createdDate: null,
      email: '',
      gender: '',
      mobilePhone: '',
      name: '',
      password: '',
      sex: '',
      uid: '',
      status: '',
      userid: '',
    );
  }
}
