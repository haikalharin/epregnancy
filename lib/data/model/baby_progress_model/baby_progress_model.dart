import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class BabyProgressModel implements BaseModel {
  String? babyAgeInWeeks;
  String? babyProgressid;
  String? condition;
  List<String>? content;
  String? createdDate;
  String? iconUrl;
  String? source;
  String? title;


  BabyProgressModel({
    this.babyAgeInWeeks,
    this.babyProgressid,
    this.condition,
    this.content,
    this.createdDate,
    this.iconUrl,
    this.source,
    this.title,
  });

  static BabyProgressModel fromJson(Map<String, dynamic> json) {
    List<String> contents = [];
    if (json['Content'] != null) {
      contents = json['Content'].cast<String>();
    }
    return BabyProgressModel(
      babyAgeInWeeks: json['BabyAgeInWeeks'] ?? '',
      babyProgressid: json['BabyProgressid'] ?? '',
      condition: json['Condition'] ?? '',
      content: contents,
      createdDate: json['CreatedDate'] != null
          ? json['CreatedDate'] is String
          ? json['CreatedDate']
          : (json['CreatedDate'] as Timestamp).toDate().toIso8601String()
          : '',
      iconUrl: json['IconUrl'] ?? '',
      source: json['Source'] ?? '',
      title: json['Title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'BabyAgeInWeeks': babyAgeInWeeks,
        'BabyProgressid': babyProgressid,
        'Condition': condition,
        'Content': content,
        'CreatedDate': createdDate,
        'IconUrl': iconUrl,
        'Source': source,
        'Title': title,

      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static BabyProgressModel empty() {
    return BabyProgressModel(
      babyAgeInWeeks: '',
      babyProgressid: '',
      createdDate: null,
      condition: '',
      iconUrl: '',
      source: '',
      content: [],
      title: '',
    );
  }
}
