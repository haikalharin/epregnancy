import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class EventModel implements BaseModel {
  String? imageURL;
  String? description;
  String? entityid;
  String? eventEndDate;
  String? eventStartDate;
  String? eventid;
  String? createdDate;
  String? title;
  String? type;
  String? consulType;
  String? time;
  String? totalConsume;
  String? days;
  String? userid;
  List<String>? listScheduleTime;


  EventModel({
    this. imageURL,          
    this. description,
    this. entityid,          
    this. eventEndDate,      
    this. eventStartDate,    
    this. eventid,           
    this. createdDate,
    this. title,             
    this. type,                               
    this. consulType,
    this. time,
    this.totalConsume,
    this.days,
    this. userid,
    this. listScheduleTime,
  });

  static EventModel fromJson(Map<String, dynamic> json) {
    List<String> listScheduleTime = [];
    if (json['ListScheduleTime'] != null) {
      listScheduleTime = json['ListScheduleTime'].cast<String>();
    }
    return EventModel(

      createdDate: json['CreatedDate'] != null
          ? json['CreatedDate'] is String
          ? json['CreatedDate']
          : (json['CreatedDate'] as Timestamp).toDate().toIso8601String()
          : '',

      entityid: json['Entityid'] ?? '',
      title: json['Title'] ?? '',
      imageURL: json['ImageURL'] ?? '',
      description: json['Description'] ?? '',
      eventEndDate: json['EventEndDate'] ?? '',
      eventStartDate: json['EventStartDate'] ?? '',
      eventid: json['Eventid'] ?? 0,
      type: json['Type'] ?? '',
      consulType: json['ConsulType'] ?? '',
      time: json['Time'] ?? '',
      totalConsume: json['TotalConsume'] ?? '',
      days: json['Days'] ?? '',
      userid: json['Userid'] ?? '',
      listScheduleTime: listScheduleTime,
    );
  }

  Map<String, dynamic> toJson() => {
    'CreatedDate': createdDate,
    'Entityid': entityid,
    'Title': title,
    'ImageURL': imageURL,
    'Description': description,
    'EventEndDate': eventEndDate,
    'EventStartDate': eventStartDate,
    'Eventid': eventid,
    'Type': type,
    'ConsulType': consulType,
    'Time': time,
    'TotalConsume': totalConsume,
    'Days': days,
    'Userid': userid,
    'ListScheduleTime': listScheduleTime,

  };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static EventModel empty() {
    return EventModel(
      createdDate: '',
      entityid: '',
      title: '',
      imageURL: '',
      description: '',
      eventEndDate: '',
      eventStartDate: '',
      eventid: '',
      type: '',
      consulType: '',
      time: '',
      totalConsume: '',
      days: '',
      userid: '',
      listScheduleTime: [],
    );
  }
}
