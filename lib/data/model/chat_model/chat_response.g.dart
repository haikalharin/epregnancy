// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatResponse _$$_ChatResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatResponse(
      id: json['id'] as String?,
      fromId: json['from_id'] as String?,
      toId: json['to_id'] as String?,
      message: json['message'] as String?,
      imageUrl: json['image_url'] as String?,
      unreadCount: json['unread_count'] as int?,
      isRead: json['is_read'] as bool?,
      from: json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : From.fromJson(json['to'] as Map<String, dynamic>),
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_date'] as String?,
    );

Map<String, dynamic> _$$_ChatResponseToJson(_$_ChatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'message': instance.message,
      'image_url': instance.imageUrl,
      'unread_count': instance.unreadCount,
      'is_read': instance.isRead,
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

_$_From _$$_FromFromJson(Map<String, dynamic> json) => _$_From(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isPatient: json['is_patient'] as bool?,
      isMidwife: json['is_midwife'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      isSuperAdmin: json['is_super_admin'] as bool?,
      isVerified: json['is_verified'] as bool?,
      hospitalId: json['hospital_id'],
      hospital: json['hospital'],
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
    );

Map<String, dynamic> _$$_FromToJson(_$_From instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'email': instance.email,
      'mobile': instance.mobile,
      'username': instance.username,
      'status': instance.status,
      'is_patient': instance.isPatient,
      'is_midwife': instance.isMidwife,
      'is_admin': instance.isAdmin,
      'is_super_admin': instance.isSuperAdmin,
      'is_verified': instance.isVerified,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital,
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
    };
