import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_pending_response_list.freezed.dart';
part 'chat_pending_response_list.g.dart';

@freezed
abstract class ChatPendingResponseList with _$ChatPendingResponseList {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingResponseList({
    required String? id,
    required String? fromId,
    required String? hospitalId,
    required String? message,
    required String? imageUrl,
    required FromChatPendingResponseLIst? from,
    required Hospital? hospital,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _ChatPendingResponseList;

  factory ChatPendingResponseList.fromJson(Map<String, dynamic> json) => _$ChatPendingResponseListFromJson(json);
}

@freezed
abstract class FromChatPendingResponseLIst with _$FromChatPendingResponseLIst {
  const factory FromChatPendingResponseLIst({
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
  }) = _FromChatPendingResponseLIst;

  factory FromChatPendingResponseLIst.fromJson(Map<String, dynamic> json) => _$FromChatPendingResponseLIstFromJson(json);
}

@freezed
abstract class Hospital with _$Hospital {
  const factory Hospital({
    required String? id,
    required String? alias,
    required String? name,
    required String? address,
    required String? city,
    required String? country,
    required String? postalCode,
    required String? phone,
    required String? email,
    required double? latitude,
    required double? longitude,
    required String? status,
    required String? imageUrl,
    required String? coverUrl,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);
}
