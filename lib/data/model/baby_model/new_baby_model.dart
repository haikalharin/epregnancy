// To parse this JSON data, do
//
//     final newBabyModel = newBabyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'new_baby_model.freezed.dart';
part 'new_baby_model.g.dart';

NewBabyModel newBabyModelFromJson(String str) => NewBabyModel.fromJson(json.decode(str));

String newBabyModelToJson(NewBabyModel data) => json.encode(data.toJson());

@freezed
class NewBabyModel with _$NewBabyModel {
  const factory NewBabyModel({
    @JsonKey(includeIfNull: true)
    Baby? baby,
    @JsonKey(name: 'text_from_baby',includeIfNull: true)
    String? textFromBaby,
    @JsonKey(name: 'illustration_image',includeIfNull: true)
    String? illustrationImage,
    @JsonKey(name: 'size_illustration_image',includeIfNull: true)
    String? sizeIllustrationImage,
    @JsonKey(name: 'size_description',includeIfNull: true)
    String? sizeDescription,
    @JsonKey(includeIfNull: true)
    double? length,
    @JsonKey(includeIfNull: true)
    double? weight,
    @JsonKey(name: 'growth_description',includeIfNull: true)
    String? growthDescription,
    @JsonKey(name: 'symptom_description',includeIfNull: true)
    String? symptomDescription,
  }) = _NewBabyModel;

  factory NewBabyModel.fromJson(Map<String, dynamic> json) => _$NewBabyModelFromJson(json);
}

@freezed
class Baby with _$Baby {
  const factory Baby({
    @JsonKey(includeIfNull: true)
    String? id,
    @JsonKey(includeIfNull: true)
    String? userId,
    @JsonKey(includeIfNull: true)
    String? name,
    @JsonKey(name: 'last_menstruation_date',includeIfNull: true)
    String? lastMenstruationDate,
    @JsonKey(includeIfNull: true)
    String? status,
    @JsonKey(name: 'pregnancy_age_day',includeIfNull: true)
    int? pregnancyAgeDay,
    @JsonKey(name: 'pregnancy_age_week',includeIfNull: true)
    int? pregnancyAgeWeek,
    @JsonKey(name: 'pregnancy_age_running_week',includeIfNull: true)
    int? pregnancyAgeRunningWeek,
    @JsonKey(name: 'pregnancy_age_day_of_week',includeIfNull: true)
    int? pregnancyAgeDayOfWeek,
    @JsonKey(name: 'pregnancy_age_trimester',includeIfNull: true)
    int? pregnancyAgeTrimester,
    @JsonKey(name: 'pregnancy_age_estimated_birth',includeIfNull: true)
    DateTime? pregnancyAgeEstimatedBirth,
  }) = _Baby;

  factory Baby.fromJson(Map<String, dynamic> json) => _$BabyFromJson(json);
}
