// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckinResponse _$$_CheckinResponseFromJson(Map<String, dynamic> json) =>
    _$_CheckinResponse(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      day: json['day'] as int?,
      date: json['date'] as String?,
      pointsEarned: json['points_earned'] as int?,
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_CheckinResponseToJson(_$_CheckinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'day': instance.day,
      'date': instance.date,
      'points_earned': instance.pointsEarned,
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };
