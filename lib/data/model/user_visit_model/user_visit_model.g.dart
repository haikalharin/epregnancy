// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserVisitModel _$$_UserVisitModelFromJson(Map<String, dynamic> json) =>
    _$_UserVisitModel(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoVisit.fromJson(json['user'] as Map<String, dynamic>),
      midwifeId: json['midwife_id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      nextVisitDate: json['next_visit_date'] as String?,
      nextVisitTime: json['next_visit_time'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_UserVisitModelToJson(_$_UserVisitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'midwife_id': instance.midwifeId,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'next_visit_date': instance.nextVisitDate,
      'next_visit_time': instance.nextVisitTime,
      'created_date': instance.createdDate,
      'modified_date': instance.modifiedDate,
    };

_$_UserInfoVisit _$$_UserInfoVisitFromJson(Map<String, dynamic> json) =>
    _$_UserInfoVisit(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      imageUrl: json['image_url'] as String?,
      isHaveBaby: json['is_have_baby'] as bool?,
      isPregnant: json['is_pregnant'] as bool?,
      pregnancyWeek: json['pregnancy_week'] as String?,
      totalVisit: json['total_visit'] as int?,
      createdDate: json['created_date'] as String?,
      lastVisit: json['last_visit'] as String?,
    );

Map<String, dynamic> _$$_UserInfoVisitToJson(_$_UserInfoVisit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'image_url': instance.imageUrl,
      'is_have_baby': instance.isHaveBaby,
      'is_pregnant': instance.isPregnant,
      'pregnancy_week': instance.pregnancyWeek,
      'total_visit': instance.totalVisit,
      'created_date': instance.createdDate,
      'last_visit': instance.lastVisit,
    };
