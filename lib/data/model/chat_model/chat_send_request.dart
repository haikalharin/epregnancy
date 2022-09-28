import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_send_request.freezed.dart';
part 'chat_send_request.g.dart';

@freezed
abstract class ChatSendRequest with _$ChatSendRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatSendRequest({
    required String? fromId,
    required String? toId,
    required String? message,
  }) = _ChatSendRequest;

  factory ChatSendRequest.fromJson(Map<String, dynamic> json) => _$ChatSendRequestFromJson(json);
}
