import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_response.freezed.dart';
part 'games_response.g.dart';

@freezed
abstract class GamesResponse with _$GamesResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GamesResponse({
    final String? id,
    final String? name,
    final String? category,
    final String? description,
    final String? url,
    final String? imageUrl,
    final String? coverUrl,
    final String? screenOrientation,
    final String? status,
    final bool? isDelete,
    final String? createdBy,
    final String? createdFrom,
    final String? createdDate,
    final String? modifiedBy,
    final String? modifiedFrom,
    final String? modifiedDate,
  }) = _GamesResponse;

  factory GamesResponse.fromJson(Map<String, dynamic> json) => _$GamesResponseFromJson(json);
}
