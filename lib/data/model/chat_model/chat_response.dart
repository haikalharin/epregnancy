import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
abstract class ChatResponse with _$ChatResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatResponse({
    required String? id,
    required String? fromId,
    required String? toId,
    required String? message,
    required int? unreadCount,
    required bool? isRead,
    required From? from,
    required From? to,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);
}

@freezed
abstract class From with _$From {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory From({
    required String? id,
    required String? name,
    required String? dob,
    required String? email,
    required String? mobile,
    required String? username,
    required String? status,
    required String? isPatient,
    required String? isMidwife,
    required String? isAdmin,
    required String? isSuperAdmin,
    required String? isVerified,
    dynamic hospitalId,
    dynamic hospital,
    required String? imageUrl,
    required String? coverUrl,
  }) = _From;

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);
}
