import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_pending_send_response.freezed.dart';
part 'chat_pending_send_response.g.dart';

@freezed
abstract class ChatPendingSendResponse with _$ChatPendingSendResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingSendResponse({
    required String? id,
    required String? fromId,
    required String? toId,
    required String? message,
    required int? unreadCount,
    required bool? isRead,
    required ChatPendingFromSendResponse? from,
    required ChatPendingFromSendResponse? to,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _ChatPendingSendResponse;

  factory ChatPendingSendResponse.fromJson(Map<String, dynamic> json) => _$ChatPendingSendResponseFromJson(json);
}

@freezed
abstract class ChatPendingFromSendResponse with _$ChatPendingFromSendResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingFromSendResponse({
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
    required HospitalModel? hospital,
    required String? imageUrl,
    required String? coverUrl,
  }) = _ChatPendingFromSendResponse;

  factory ChatPendingFromSendResponse.fromJson(Map<String, dynamic> json) => _$ChatPendingFromSendResponseFromJson(json);
}
