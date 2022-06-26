import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class UserRolesModelFirebase implements BaseModel {
  String? condition;
  String? createdDate;
  String? role;
  String? uid;
  String? userid;

  UserRolesModelFirebase({
    this.condition,
    this.role,
    this.createdDate,
    this.uid,
    this.userid,
  });

  static UserRolesModelFirebase fromJson(Map<String, dynamic> json) {
    return UserRolesModelFirebase(
      createdDate: json['CreatedDate'] != null
          ? json['CreatedDate'] is String
              ? json['CreatedDate']
              : (json['CreatedDate'] as Timestamp).toDate().toIso8601String()
          : '',
      condition: json['Condition'] ?? '',
      role: json['Role'] ?? '',
      uid: json['Uid'] ?? '',
      userid: json['UserId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'CreatedDate': createdDate,
        'Condition': condition,
        'Role': role,
        'Uid': uid,
        'UserId': userid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static UserRolesModelFirebase empty() {
    return UserRolesModelFirebase(
      createdDate: null,
      condition: '',
      role: '',
      uid: '',
      userid: '',
    );
  }
}
