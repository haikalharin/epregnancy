// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      imageUrl: json['image_url'] as String?,
      isHaveBaby: json['is_have_baby'] as bool?,
      isPregnant: json['is_pregnant'] as bool?,
      pregnancyWeek: json['pregnancy_week'] as int?,
      totalVisit: json['total_visit'] as int?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      lastVisit: json['last_visit'] == null
          ? null
          : DateTime.parse(json['last_visit'] as String),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'image_url': instance.imageUrl,
      'is_have_baby': instance.isHaveBaby,
      'is_pregnant': instance.isPregnant,
      'pregnancy_week': instance.pregnancyWeek,
      'total_visit': instance.totalVisit,
      'created_date': instance.createdDate?.toIso8601String(),
      'last_visit': instance.lastVisit?.toIso8601String(),
    };
