// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_game_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayGameResponse _$$_PlayGameResponseFromJson(Map<String, dynamic> json) =>
    _$_PlayGameResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
      screenOrientation: json['screen_orientation'],
      status: json['status'] as String?,
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_PlayGameResponseToJson(_$_PlayGameResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'url': instance.url,
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
      'screen_orientation': instance.screenOrientation,
      'status': instance.status,
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };
