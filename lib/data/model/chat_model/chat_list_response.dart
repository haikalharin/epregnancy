import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_response.freezed.dart';
part 'chat_list_response.g.dart';

@freezed
abstract class ChatListResponse with _$ChatListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatListResponse({
    required String? id,
    required String? fromId,
    required String? toId,
    required String? message,
    required bool? isRead,
    required String? imageUrl,
    required FromChatListResponse? from,
    required FromChatListResponse? to,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _ChatListResponse;

  factory ChatListResponse.fromJson(Map<String, dynamic> json) => _$ChatListResponseFromJson(json);
}

@freezed
abstract class FromChatListResponse with _$FromChatListResponse {
  const factory FromChatListResponse({
    required String? id,
    required String? name,
    required String? dob,
    required String? email,
    required String? mobile,
    required String? username,
    required String? status,
    required bool? isPatient,
    required bool? isMidwife,
    required bool? isAdmin,
    required bool? isSuperAdmin,
    required bool? isVerified,
    required String? hospitalId,
    required String? hospital,
    required String? imageUrl,
    required String? coverUrl,
  }) = _FromChatListResponse;

  factory FromChatListResponse.fromJson(Map<String, dynamic> json) => _$FromChatListResponseFromJson(json);
}
