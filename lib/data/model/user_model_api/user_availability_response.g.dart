// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_availability_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAvailabilityResponse _$$_UserAvailabilityResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UserAvailabilityResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      lastBiodataView: json['last_biodata_view'] as int?,
      fcmToken: json['fcm_token'] as String?,
      isAgree: json['is_agree'] as bool?,
      agreementDate: json['agreement_date'] as String?,
      isOnline: json['is_online'] as bool?,
      totalLogin: json['total_login'] as int?,
      lastLoginDate: json['last_login_date'] as String?,
      hospitalId: json['hospital_id'] as String?,
      hospital: json['hospital'] == null
          ? null
          : Hospital.fromJson(json['hospital'] as Map<String, dynamic>),
      createdDate: json['created_date'] as String?,
      modifiedDate: json['modified_date'] as String?,
      email: json['email'] as String?,
      isVerified: json['is_verified'] as bool?,
      isPregnant: json['is_pregnant'] as bool?,
      isPlanningPregnancy: json['is_planning_pregnancy'] as bool?,
      isHaveBaby: json['is_have_baby'] as bool?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_UserAvailabilityResponseToJson(
        _$_UserAvailabilityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'username': instance.username,
      'status': instance.status,
      'last_biodata_view': instance.lastBiodataView,
      'fcm_token': instance.fcmToken,
      'is_agree': instance.isAgree,
      'agreement_date': instance.agreementDate,
      'is_online': instance.isOnline,
      'total_login': instance.totalLogin,
      'last_login_date': instance.lastLoginDate,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital?.toJson(),
      'created_date': instance.createdDate,
      'modified_date': instance.modifiedDate,
      'email': instance.email,
      'is_verified': instance.isVerified,
      'is_pregnant': instance.isPregnant,
      'is_planning_pregnancy': instance.isPlanningPregnancy,
      'is_have_baby': instance.isHaveBaby,
      'image_url': instance.imageUrl,
    };

_$_Hospital _$$_HospitalFromJson(Map<String, dynamic> json) => _$_Hospital(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_HospitalToJson(_$_Hospital instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'email': instance.email,
      'image_url': instance.imageUrl,
    };
