// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationListModel _$$_NotificationListModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationListModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      read: json['read'] as bool?,
      actionType: json['action_type'] as String?,
      actionValue: json['action_value'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$$_NotificationListModelToJson(
        _$_NotificationListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'action_type': instance.actionType,
      'action_value': instance.actionValue,
      'created_date': instance.createdDate,
    };
