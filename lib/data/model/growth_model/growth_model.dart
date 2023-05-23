import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'growth_model.freezed.dart';
part 'growth_model.g.dart';

@freezed
class GrowthModel with _$GrowthModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GrowthModel({
    final String? id,
    final String? childId,
    final int? ageMonth,
    final String? visitDate,
    final int? length,
    final int? weight,
    final int? headCircumference,
  }) = _GrowthModel;

  factory GrowthModel.fromJson(Map<String, dynamic> json) => _$GrowthModelFromJson(json);
}
