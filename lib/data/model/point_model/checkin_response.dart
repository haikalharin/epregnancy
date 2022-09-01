import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'checkin_response.freezed.dart';

part 'checkin_response.g.dart';

@freezed
class CheckinResponse with _$CheckinResponse {
  const factory CheckinResponse({
    required String? id,
    @JsonKey(name: 'user_id')
    required String? userId,
    required int? day,
    required String? date,
    @JsonKey(name: 'points_earned')
    required int? pointsEarned,
    @JsonKey(name: 'is_delete')
    required bool? isDelete,
    @JsonKey(name: 'created_by')
    required String? createdBy,
    @JsonKey(name: 'created_from')
    required String? createdFrom,
    @JsonKey(name: 'created_date')
    required String? createdDate,
    @JsonKey(name: 'modified_by')
    required String? modifiedBy,
    @JsonKey(name: 'modified_from')
    required String? modifiedFrom,
    @JsonKey(name: 'modified_date')
    required String? modifiedDate,
}) = _CheckinResponse;

  factory CheckinResponse.fromJson(Map<String, dynamic> json) => _$CheckinResponseFromJson(json);
}