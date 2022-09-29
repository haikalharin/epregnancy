import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_pending_send_request.freezed.dart';
part 'chat_pending_send_request.g.dart';

@freezed
abstract class ChatPendingSendRequest with _$ChatPendingSendRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingSendRequest({
    required String? fromId,
    required String? hospitalId,
    required String? message,
  }) = _ChatPendingSendRequest;

  factory ChatPendingSendRequest.fromJson(Map<String, dynamic> json) => _$ChatPendingSendRequestFromJson(json);
}
