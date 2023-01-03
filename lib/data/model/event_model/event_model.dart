// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'event_model.freezed.dart';

part 'event_model.g.dart';

List<EventModel> eventModelFromJson(String str) =>
    List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    @JsonKey(includeIfNull: true) @JsonKey(includeIfNull: true) String? id,
    @JsonKey(name: 'user_id', includeIfNull: true) String? userId,
    @JsonKey(name: 'hospital_id', includeIfNull: true) String? hospitalId,
    @JsonKey(name: 'midwife_id', includeIfNull: true) String? midwifeId,
    @JsonKey(name: 'user', includeIfNull: true)User? user,
    @JsonKey(includeIfNull: true) String? type,
    @JsonKey(includeIfNull: true) String? title,
    @JsonKey(includeIfNull: true) String? description,
    @JsonKey(includeIfNull: true) String? location,
    @JsonKey(includeIfNull: true) String? date,
    @JsonKey(includeIfNull: true) String? time,
    @JsonKey(name: 'remind_before', includeIfNull: true) String? remindBefore,
    @JsonKey(name: 'start_date', includeIfNull: true) String? startDate,
    @JsonKey(name: 'end_date', includeIfNull: true) String? endDate,
    @JsonKey(name: 'medicine_taken_times', includeIfNull: true) int? medicineTakenTimes,
    @JsonKey(name: 'medicine_taken_days', includeIfNull: true) int? medicineTakenDays,
    @JsonKey(name: 'medicine_unit', includeIfNull: true) String? medicineUnit,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'notifications', includeIfNull: true)List<NotificationModel>? notifications,
    @JsonKey(name: 'is_delete', includeIfNull: true) bool? isDelete,
    @JsonKey(name: 'is_public', includeIfNull: true) bool? isPublic,
    @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
    @JsonKey(name: 'created_by', includeIfNull: true) String? createdBy,
    @JsonKey(name: 'created_from', includeIfNull: true) String? createdFrom,
    @JsonKey(name: 'created_date', includeIfNull: true) String? createdDate,
    @JsonKey(name: 'modified_by', includeIfNull: true) String? modifiedBy,
    @JsonKey(name: 'modified_from', includeIfNull: true) String? modifiedFrom,
    @JsonKey(name: 'modified_date', includeIfNull: true) String? modifiedDate,

  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  static EventModel empty() {
    return const EventModel(
        id :'',
        userId : '',
        user : User(),
    type : '',
    title : '',
    description : '',
    location :'',
    date : '',
    time :'',
    remindBefore : '',
    startDate : '',
    endDate :'',
    medicineTakenTimes : 0,
    medicineTakenDays : 0,
    medicineUnit :'',
    status : '',
    notifications : [],
    isDelete : false,
    createdBy : '',
    createdFrom : '',
    createdDate : '',
    modifiedBy : '',
    modifiedFrom : '',
    modifiedDate : '',
    );}
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(name: 'schedule_id', includeIfNull: true) String? scheduleId,
    @JsonKey(includeIfNull: true) String? time,
    @JsonKey(includeIfNull: true) String? status,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(includeIfNull: true) String? dob,
    @JsonKey(includeIfNull: true) String? email,
    @JsonKey(includeIfNull: true) String? mobile,
    @JsonKey(includeIfNull: true) String? username,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'is_patient', includeIfNull: true)
    @JsonKey(includeIfNull: true)
        bool? isPatient,
    @JsonKey(name: 'is_midwife', includeIfNull: true)
    @JsonKey(includeIfNull: true)
        bool? isMidwife,
    @JsonKey(name: 'is_admin', includeIfNull: true)
    @JsonKey(includeIfNull: true)
        bool? isAdmin,
    @JsonKey(name: 'is_super_admin', includeIfNull: true)
    @JsonKey(includeIfNull: true)
        bool? isSuperAdmin,
    @JsonKey(name: 'is_verified', includeIfNull: true)
    @JsonKey(includeIfNull: true)
        bool? isVerified,
    @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
    @JsonKey(name: 'cover_url', includeIfNull: true) String? coverUrl,
    @JsonKey(name: 'hospital_id', includeIfNull: true)String? hospitalId,
    @JsonKey(includeIfNull: true) Hospital? hospital,

  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(includeIfNull: true) String? alias,
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);
}

