import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_history.freezed.dart';
part 'point_history.g.dart';

@freezed
class PointHistory with _$PointHistory {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PointHistory({
    required String? id,
    required String? type,
    required String? userId,
    required String? description,
    required int? points,
    required bool? isDelete,
    required String? createdBy,
    required String? createdDate
  }) = _PointHistory;


  factory PointHistory.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryFromJson(json);
}