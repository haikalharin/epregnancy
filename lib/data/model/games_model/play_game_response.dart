import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'play_game_response.freezed.dart';
part 'play_game_response.g.dart';


@freezed
abstract class PlayGameResponse with _$PlayGameResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PlayGameResponse({
    required String? id,
    required String? name,
    required String? category,
    required String? description,
    required String? url,
    required String? imageUrl,
    required String? coverUrl,
    dynamic screenOrientation,
    required String? status,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _PlayGameResponse;

  factory PlayGameResponse.fromJson(Map<String, dynamic> json) => _$PlayGameResponseFromJson(json);
}
