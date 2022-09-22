// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConsultationModel _$$_ConsultationModelFromJson(Map<String, dynamic> json) =>
    _$_ConsultationModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as List<dynamic>?)
          ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: json['comments_count'] as int?,
      likesCount: json['likes_count'] as int?,
      imageUrl: json['image_url'] as String?,
      imageBase64: json['image_base64'] as String?,
      isDelete: json['is_delete'] as bool?,
      createdBy: json['created_by'] as String?,
      createdFrom: json['created_from'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedBy: json['modified_by'] as String?,
      modifiedFrom: json['modified_from'] as String?,
      modifiedDate: json['modified_Date'] as String?,
    );

Map<String, dynamic> _$$_ConsultationModelToJson(
        _$_ConsultationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'message': instance.message,
      'status': instance.status,
      'user': instance.user,
      'comments': instance.comments,
      'likes': instance.likes,
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'image_url': instance.imageUrl,
      'image_base64': instance.imageBase64,
      'is_delete': instance.isDelete,
      'created_by': instance.createdBy,
      'created_from': instance.createdFrom,
      'created_date': instance.createdDate,
      'modified_by': instance.modifiedBy,
      'modified_from': instance.modifiedFrom,
      'modified_Date': instance.modifiedDate,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String?,
      postId: json['post_id'] as String?,
      userId: json['user_id'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'message': instance.message,
      'status': instance.status,
      'user': instance.user,
      'image_url': instance.imageUrl,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      isPatient: json['is_patient'] as bool?,
      isMidwife: json['is_mideife'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      isSuperAdmin: json['is_super_admin'] as bool?,
      isVerified: json['is_verified'] as bool?,
      hospitalId: json['hospital_id'] as String?,
      hospital: json['hospital'] as String?,
      imageUrl: json['image_url'] as String?,
      coverUrl: json['coverUrl'],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'email': instance.email,
      'mobile': instance.mobile,
      'username': instance.username,
      'status': instance.status,
      'is_patient': instance.isPatient,
      'is_mideife': instance.isMidwife,
      'is_admin': instance.isAdmin,
      'is_super_admin': instance.isSuperAdmin,
      'is_verified': instance.isVerified,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital,
      'image_url': instance.imageUrl,
      'coverUrl': instance.coverUrl,
    };

_$_Like _$$_LikeFromJson(Map<String, dynamic> json) => _$_Like(
      id: json['id'] as String?,
      postId: json['post_id'] as String?,
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'user': instance.user,
    };
