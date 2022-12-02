// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddCommentResponse _$$_AddCommentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AddCommentResponse(
      id: json['id'] as String?,
      postId: json['post_id'] as String?,
      userId: json['user_id'] as String?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserPost.fromJson(json['user'] as Map<String, dynamic>),
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdDate: json['created_date'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_AddCommentResponseToJson(
        _$_AddCommentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'message': instance.message,
      'user': instance.user?.toJson(),
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
      'image_url': instance.imageUrl,
    };

_$_UserPost _$$_UserPostFromJson(Map<String, dynamic> json) => _$_UserPost(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isAgree: json['is_agree'] as bool?,
      hospitalId: json['hospital_id'] as String?,
      hospital: json['hospital'] == null
          ? null
          : HospitalPost.fromJson(json['hospital'] as Map<String, dynamic>),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_UserPostToJson(_$_UserPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'username': instance.username,
      'status': instance.status,
      'is_agree': instance.isAgree,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital?.toJson(),
      'image_url': instance.imageUrl,
    };

_$_HospitalPost _$$_HospitalPostFromJson(Map<String, dynamic> json) =>
    _$_HospitalPost(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_HospitalPostToJson(_$_HospitalPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'email': instance.email,
      'image_url': instance.imageUrl,
    };
