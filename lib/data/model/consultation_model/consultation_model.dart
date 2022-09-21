// To parse this JSON data, do
//
//     final consultationModel = consultationModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'consultation_model.freezed.dart';

part 'consultation_model.g.dart';

List<ConsultationModel> consultationModelFromJson(String str) =>
    List<ConsultationModel>.from(
        json.decode(str).map((x) => ConsultationModel.fromJson(x)));

String consultationModelToJson(List<ConsultationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class ConsultationModel with _$ConsultationModel {
  const factory ConsultationModel({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(name: 'user_id',includeIfNull: true) String? userId,
    @JsonKey(includeIfNull: true) String? message,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(includeIfNull: true) User? user,
    @JsonKey(includeIfNull: true) List<Comment>? comments,
    @JsonKey(includeIfNull: true) List<Like>? likes,
    @JsonKey(name: 'comments_count',includeIfNull: true) int? commentsCount,
    @JsonKey(name: 'likes_count',includeIfNull: true) int? likesCount,
    @JsonKey(name: 'image_url',includeIfNull: true) String? imageUrl,
    @JsonKey(name: 'image_base64',includeIfNull: true) String? imageBase64,
    @JsonKey(name: 'is_delete',includeIfNull: true) bool? isDelete,
    @JsonKey(name: 'created_by',includeIfNull: true) String? createdBy,
    @JsonKey(name: 'created_from',includeIfNull: true) String? createdFrom,
    @JsonKey(name: 'created_date',includeIfNull: true) String? createdDate,
    @JsonKey(name: 'modified_by',includeIfNull: true) String? modifiedBy,
    @JsonKey(name: 'modified_from',includeIfNull: true) String? modifiedFrom,
    @JsonKey(name: 'modified_Date',includeIfNull: true)String? modifiedDate,
  }) = _ConsultationModel;

  factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationModelFromJson(json);
}

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(name: 'post_id',includeIfNull: true) String? postId,
    @JsonKey(name: 'user_id',includeIfNull: true) String? userId,
    @JsonKey(includeIfNull: true) String? message,
    @JsonKey(includeIfNull: true)String? status,
    @JsonKey(includeIfNull: true)User? user,
    @JsonKey(name: 'image_url',includeIfNull: true) String? imageUrl,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(includeIfNull: true) String? dob,
    @JsonKey(includeIfNull: true) String? email,
    @JsonKey(includeIfNull: true) String? mobile,
    @JsonKey(includeIfNull: true) String? username,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'is_patient',includeIfNull: true) bool? isPatient,
    @JsonKey(name: 'is_mideife',includeIfNull: true) bool? isMidwife,
    @JsonKey(name: 'is_admin',includeIfNull: true) bool? isAdmin,
    @JsonKey(name: 'is_super_admin',includeIfNull: true) bool? isSuperAdmin,
    @JsonKey(name: 'is_verified',includeIfNull: true) bool? isVerified,
    @JsonKey(name: 'hospital_id',includeIfNull: true) String? hospitalId,
    @JsonKey(includeIfNull: true) String? hospital,
    @JsonKey(name: 'image_url',includeIfNull: true) String? imageUrl,
    dynamic coverUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Like with _$Like {
  const factory Like({
    @JsonKey(includeIfNull: true) String? id,
    @JsonKey(name: 'post_id',includeIfNull: true) String? postId,
    @JsonKey(name: 'user_id',includeIfNull: true) String? userId,
    @JsonKey(includeIfNull: true) User? user,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
