import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserInfo({
    required String? id,
    required String? name,
    required String? dob,
    String? mobile,
    required String? token,
    required int? totalPointsEarned,
    required int? totalPointsRedeemed,
    required String? imageUrl,
    String? coverUrl,
    required bool? isVerified,
    bool? isPregnant,
    bool? isPlanningPregnancy,
    bool? isHaveBaby,
    required String? status,
    required List<GamificationPoint>? gamificationPoints,
    required List<CheckIn>? checkins
  }) = _UserInfo;


  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
class GamificationPoint with _$GamificationPoint {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GamificationPoint({
    required String? id,
    required String? group,
    required String? key,
    required String? value,
  }) = _GamificationPoint;

  factory GamificationPoint.fromJson(Map<String, dynamic> json) =>
  _$GamificationPointFromJson(json);
}

@freezed
class CheckIn with _$CheckIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CheckIn({
    required int? day,
    required String? date,
    required int? pointsEarned
  }) = _CheckIn;

  factory CheckIn.fromJson(Map<String, dynamic> json) =>
      _$CheckInFromJson(json);
}