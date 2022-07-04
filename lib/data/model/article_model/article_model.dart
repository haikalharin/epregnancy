import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class ArticleModel implements BaseModel {
  String? cardImgURL;
  String? condition;
  List<String>? content;
  String? createdDate;
  String? entityid;
  String? infoid;
  String? targetGender;
  int? targetMaxAge;
  int? targetMinAge;
  int? targetPregnancyMaxAge;
  int? targetPregnancyMinAge;
  String? title;

  ArticleModel({
    this.condition,
    this.createdDate,
    this.cardImgURL,
    this.content,
    this.entityid,
    this.infoid,
    this.targetGender,
    this.targetMaxAge,
    this.targetMinAge,
    this.targetPregnancyMaxAge,
    this.targetPregnancyMinAge,
    this.title,
  });

  static ArticleModel fromJson(Map<String, dynamic> json) {
    List<String> contents = [];
    if (json['Content'] != null) {
      contents = json['Content'].cast<String>();
    }
    return ArticleModel(
      createdDate: json['CreatedDate'] != null
          ? json['CreatedDate'] is String
              ? json['CreatedDate']
              : (json['CreatedDate'] as Timestamp).toDate().toIso8601String()
          : '',
      condition: json['Condition'] ?? '',
      cardImgURL: json['CardImgURL'] ?? '',
      content: contents,
      entityid: json['Entityid'] ?? '',
      infoid: json['Infoid'] ?? '',
      targetGender: json['TargetGender'] ?? '',
      targetMaxAge: json['TargetMaxAge'] ?? 0,
      targetMinAge: json['TargetMinAge'] ?? 0,
      targetPregnancyMaxAge: json['TargetPregnancyMaxAge'] ?? 0,
      targetPregnancyMinAge: json['TargetPregnancyMinAge'] ?? 0,
      title: json['Title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'CreatedDate': createdDate,
        'Condition': condition,
        'CardImgURL': cardImgURL,
        'Content': content,
        'Entityid': entityid,
        'Infoid': infoid,
        'TargetGender': targetGender,
        'TargetMaxAge': targetMaxAge,
        'TargetMinAge': targetMinAge,
        'TargetPregnancyMaxAge': targetPregnancyMaxAge,
        'TargetPregnancyMinAge': targetMinAge,
        'Title': title,

      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static ArticleModel empty() {
    return ArticleModel(
      createdDate: null,
      condition: '',
      cardImgURL: '',
      content: [],
      entityid: '',
      infoid: '',
      targetGender: '',
      targetMaxAge: 0,
      targetMinAge: 0,
      targetPregnancyMaxAge: 0,
      targetPregnancyMinAge: 0,
      title: '',
    );
  }
}
