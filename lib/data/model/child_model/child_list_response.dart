
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_list_response.freezed.dart';
part 'child_list_response.g.dart';


@freezed
class ChildListResponse with _$ChildListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChildListResponse({
    final String? id,
    final String? userId,
    final String? name,
    final String? gender,
    final String? dob,
    final Age? age,
  }) = _ChildListResponse;

  factory ChildListResponse.fromJson(Map<String, dynamic> json) => _$ChildListResponseFromJson(json);
}

@freezed
class Age with _$Age {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Age({
    final int? year,
    final int? month,
    final int? day,
    final int? monthOnly,
    final int? dayOnly,
  }) = _Age;

  factory Age.fromJson(Map<String, dynamic> json) => _$AgeFromJson(json);
}
