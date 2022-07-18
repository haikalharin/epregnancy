import 'package:cloud_firestore/cloud_firestore.dart';

import '../base_model/base_model.dart';

class EventModel implements BaseModel {
  String? imageURL;
  String? description;
  String? entityid;
  String? eventEndDate;
  String? eventStartDate;
  int? eventid;
  String? createdDate;
  String? title;
  String? type;

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
  });

  static EventModel fromJson(Map<String, dynamic> json) {
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
      eventid: 0,
      type: '',
    );
  }
}
