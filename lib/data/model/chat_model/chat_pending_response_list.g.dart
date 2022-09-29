// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_pending_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatPendingResponseList _$$_ChatPendingResponseListFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingResponseList(
      id: json['id'] as String?,
      fromId: json['from_id'] as String?,
      hospitalId: json['hospital_id'] as String?,
      message: json['message'] as String?,
      imageUrl: json['image_url'] as String?,
      from: json['from'] == null
          ? null
          : FromChatPendingResponseLIst.fromJson(
              json['from'] as Map<String, dynamic>),
      hospital: json['hospital'] == null
          ? null
          : Hospital.fromJson(json['hospital'] as Map<String, dynamic>),
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_ChatPendingResponseListToJson(
        _$_ChatPendingResponseList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'hospital_id': instance.hospitalId,
      'message': instance.message,
      'image_url': instance.imageUrl,
      'from': instance.from?.toJson(),
      'hospital': instance.hospital?.toJson(),
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };

_$_FromChatPendingResponseLIst _$$_FromChatPendingResponseLIstFromJson(
        Map<String, dynamic> json) =>
    _$_FromChatPendingResponseLIst(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isPatient: json['isPatient'] as bool?,
      isMidwife: json['isMidwife'] as bool?,
      isAdmin: json['isAdmin'] as bool?,
      isSuperAdmin: json['isSuperAdmin'] as bool?,
      isVerified: json['isVerified'] as bool?,
      hospitalId: json['hospitalId'] as String?,
      hospital: json['hospital'] as String?,
      imageUrl: json['imageUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
    );

Map<String, dynamic> _$$_FromChatPendingResponseLIstToJson(
        _$_FromChatPendingResponseLIst instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'email': instance.email,
      'mobile': instance.mobile,
      'username': instance.username,
      'status': instance.status,
      'isPatient': instance.isPatient,
      'isMidwife': instance.isMidwife,
      'isAdmin': instance.isAdmin,
      'isSuperAdmin': instance.isSuperAdmin,
      'isVerified': instance.isVerified,
      'hospitalId': instance.hospitalId,
      'hospital': instance.hospital,
      'imageUrl': instance.imageUrl,
      'coverUrl': instance.coverUrl,
    };

_$_Hospital _$$_HospitalFromJson(Map<String, dynamic> json) => _$_Hospital(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      status: json['status'] as String?,
      imageUrl: json['imageUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
    );

Map<String, dynamic> _$$_HospitalToJson(_$_Hospital instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'phone': instance.phone,
      'email': instance.email,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'coverUrl': instance.coverUrl,
    };
