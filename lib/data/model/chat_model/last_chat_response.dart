// To parse this JSON data, do
//
//     final lastChatResponse = lastChatResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'last_chat_response.freezed.dart';
part 'last_chat_response.g.dart';

LastChatResponse lastChatResponseFromJson(String str) => LastChatResponse.fromJson(json.decode(str));

String lastChatResponseToJson(LastChatResponse data) => json.encode(data.toJson());

@freezed
class LastChatResponse with _$LastChatResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory LastChatResponse({
    required int? unreadMessage,
    required Chat? chat,
  }) = _LastChatResponse;

  factory LastChatResponse.fromJson(Map<String, dynamic> json) => _$LastChatResponseFromJson(json);
}

@freezed
class Chat with _$Chat {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Chat({
    required String? message,
    required From? from,
    required DateTime? createdDate,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class From with _$From {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory From({
    required String? id,
    required String? name,
    required String? username,
    required String? imageUrl,
  }) = _From;

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);
}
