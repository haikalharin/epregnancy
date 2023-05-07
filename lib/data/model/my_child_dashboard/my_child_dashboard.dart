import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'my_child_dashboard.freezed.dart';
part 'my_child_dashboard.g.dart';

@freezed
class MyChildDashboard with _$MyChildDashboard {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MyChildDashboard({
    final Child? child,
    final Growth? growth,
    final GrowthStatus? growthStatus,
  }) = _MyChildDashboard;

  factory MyChildDashboard.fromJson(Map<String, dynamic> json) => _$MyChildDashboardFromJson(json);
}

@freezed
class Child with _$Child {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Child({
    final String? id,
    final String? userId,
    final String? name,
    final String? gender,
    final String? dob,
    final Age? age,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
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

@freezed
class Growth with _$Growth {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Growth({
    final String? id,
    final String? childId,
    final int? ageMonth,
    final String? visitDate,
    final int? length,
    final int? weight,
    final int? headCircumference,
  }) = _Growth;

  factory Growth.fromJson(Map<String, dynamic> json) => _$GrowthFromJson(json);
}

@freezed
class GrowthStatus with _$GrowthStatus {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GrowthStatus({
    final String? length,
    final String? weight,
    final String? headCircumference,
  }) = _GrowthStatus;

  factory GrowthStatus.fromJson(Map<String, dynamic> json) => _$GrowthStatusFromJson(json);
}
