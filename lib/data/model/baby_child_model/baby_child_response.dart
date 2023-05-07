import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'baby_child_response.freezed.dart';
part 'baby_child_response.g.dart';

@freezed
class BabyChildResponse with _$BabyChildResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BabyChildResponse({
    final String? id,
    final String? name,
    final String? gender,
    final bool? born,
  }) = _BabyChildResponse;

  factory BabyChildResponse.fromJson(Map<String, dynamic> json) => _$BabyChildResponseFromJson(json);
}
