// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointHistory _$$_PointHistoryFromJson(Map<String, dynamic> json) =>
    _$_PointHistory(
      id: json['id'] as String?,
      type: json['type'] as String?,
      userId: json['user_id'] as String?,
      description: json['description'] as String?,
      points: json['points'] as int?,
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$$_PointHistoryToJson(_$_PointHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'user_id': instance.userId,
      'description': instance.description,
      'points': instance.points,
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
    };
