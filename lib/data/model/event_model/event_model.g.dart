// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      remindBefore: json['remind_before'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      medicineTakenTimes: json['medicine_taken_times'] as int?,
      medicineTakenDays: json['medicine_taken_days'] as int?,
      medicineUnit: json['medicine_unit'] as String?,
      status: json['status'] as String?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDelete: json['is_delete'] as bool?,
      isPublic: json['is_public'] as bool?,
      imageUrl: json['image_url'] as String?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user': instance.user,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'date': instance.date,
      'time': instance.time,
      'remind_before': instance.remindBefore,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'medicine_taken_times': instance.medicineTakenTimes,
      'medicine_taken_days': instance.medicineTakenDays,
      'medicine_unit': instance.medicineUnit,
      'status': instance.status,
      'notifications': instance.notifications,
      'is_delete': instance.isDelete,
      'is_public': instance.isPublic,
      'image_url': instance.imageUrl,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String?,
      scheduleId: json['schedule_id'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule_id': instance.scheduleId,
      'time': instance.time,
      'status': instance.status,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isPatient: json['is_patient'] as bool?,
      isMidwife: json['is_midwife'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      isSuperAdmin: json['is_super_admin'] as bool?,
      isVerified: json['is_verified'] as bool?,
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'email': instance.email,
      'mobile': instance.mobile,
      'username': instance.username,
      'status': instance.status,
      'is_patient': instance.isPatient,
      'is_midwife': instance.isMidwife,
      'is_admin': instance.isAdmin,
      'is_super_admin': instance.isSuperAdmin,
      'is_verified': instance.isVerified,
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
    };
