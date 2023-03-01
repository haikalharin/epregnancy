// To parse this JSON data, do
//
//     final simpleTipResponse = simpleTipResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'simple_tip_response.freezed.dart';
part 'simple_tip_response.g.dart';

@freezed
class SimpleTipResponse with _$SimpleTipResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory SimpleTipResponse({
    final String? articleId,
    final String? tips,
    final String? webUrl,
  }) = _SimpleTipResponse;

  factory SimpleTipResponse.fromJson(Map<String, dynamic> json) => _$SimpleTipResponseFromJson(json);
}
