// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biodata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BiodataResponse _$$_BiodataResponseFromJson(Map<String, dynamic> json) =>
    _$_BiodataResponse(
      username: json['username'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      lastBiodataView: json['last_biodata_view'] == null
          ? null
          : DateTime.parse(json['last_biodata_view'] as String),
    );

Map<String, dynamic> _$$_BiodataResponseToJson(_$_BiodataResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'dob': instance.dob?.toIso8601String(),
      'last_biodata_view': instance.lastBiodataView?.toIso8601String(),
    };
