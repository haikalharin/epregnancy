// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatListResponse _$$_ChatListResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatListResponse(
      id: json['id'] as String?,
      fromId: json['from_id'] as String?,
      toId: json['to_id'] as String?,
      message: json['message'] as String?,
      isRead: json['is_read'] as bool?,
      imageUrl: json['image_url'] as String?,
      from: json['from'] == null
          ? null
          : FromChatListResponse.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : FromChatListResponse.fromJson(json['to'] as Map<String, dynamic>),
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_ChatListResponseToJson(_$_ChatListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'message': instance.message,
      'is_read': instance.isRead,
      'image_url': instance.imageUrl,
      'from': instance.from?.toJson(),
      'to': instance.to?.toJson(),
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_date': instance.modifiedDate,
    };

_$_FromChatListResponse _$$_FromChatListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FromChatListResponse(
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
      hospital: json['hospital'] == null
          ? null
          : HospitalModel.fromJson(json['hospital'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
    );

Map<String, dynamic> _$$_FromChatListResponseToJson(
        _$_FromChatListResponse instance) =>
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
