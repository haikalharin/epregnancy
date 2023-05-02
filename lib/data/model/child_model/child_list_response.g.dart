// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChildListResponse _$$_ChildListResponseFromJson(Map<String, dynamic> json) =>
    _$_ChildListResponse(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] == null
          ? null
          : Age.fromJson(json['age'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChildListResponseToJson(
        _$_ChildListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'age': instance.age?.toJson(),
    };

_$_Age _$$_AgeFromJson(Map<String, dynamic> json) => _$_Age(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      monthOnly: json['month_only'] as int?,
      dayOnly: json['day_only'] as int?,
    );

Map<String, dynamic> _$$_AgeToJson(_$_Age instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'month_only': instance.monthOnly,
      'day_only': instance.dayOnly,
    };
