import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_comment_response.freezed.dart';
part 'add_comment_response.g.dart';

@freezed
abstract class AddCommentResponse with _$AddCommentResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AddCommentResponse({
    required String? id,
    required String? postId,
    required String? userId,
    required String? message,
    required UserPost? user,
    required bool? isDelete,
    required String? createdBy,
    required String? createdDate,
    required String? imageUrl,
  }) = _AddCommentResponse;

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) => _$AddCommentResponseFromJson(json);
}

@freezed
abstract class UserPost with _$UserPost {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserPost({
    required String? id,
    required String? name,
    required String? dob,
    required String? username,
    required String? status,
    required bool? isAgree,
    required String? hospitalId,
    required HospitalPost? hospital,
    required String? imageUrl,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);
}

@freezed
abstract class HospitalPost with _$HospitalPost {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory HospitalPost({
    required String? id,
    required String? alias,
    required String? name,
    required String? email,
    required String? imageUrl,
  }) = _HospitalPost;

  factory HospitalPost.fromJson(Map<String, dynamic> json) => _$HospitalPostFromJson(json);
}
