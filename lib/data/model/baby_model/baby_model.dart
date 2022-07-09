import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class BabyModel implements BaseModel {
  String? babyDOB;
  String? babyName;
  String? babyProfileid;
  String? createdDate;
  String? gender;
  String? lastMenstruationDate;
  String? userUid;
  String? userid;


  BabyModel({
    this.babyDOB,
    this.babyName,
    this.babyProfileid,
    this.createdDate,
    this.gender,
    this.lastMenstruationDate,
    this.userUid,
    this.userid,

  });

  static BabyModel fromJson(Map<String, dynamic> json) {
    return BabyModel(
      babyDOB: json['BabyDOB'] ?? '',
      babyName: json['BabyName'] ?? '',
      babyProfileid: json['BabyProfileid'] ?? '',
      createdDate: json['CreatedDate'] ?? '',
      gender: json['Gender'] ?? '',
      lastMenstruationDate: json['LastMenstruationDate'] ?? '',
      userUid: json['UserUid'] ?? '',
      userid: json['Userid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'BabyDOB': babyDOB,
        'BabyName': babyName,
        'BabyProfileid': babyProfileid,
        'CreatedDate': createdDate,
        'Gender': gender,
        'LastMenstruationDate': lastMenstruationDate,
        'UserUid': userUid,
        'Userid': userid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static BabyModel empty() {

    return BabyModel(
      babyDOB: '',
      babyName: '',
      babyProfileid: '',
      createdDate: '',
      gender: '',
      lastMenstruationDate: '',
      userUid: '',
      userid: '',
    );
  }
}
