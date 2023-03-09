// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_baby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewBabyModel _$$_NewBabyModelFromJson(Map<String, dynamic> json) =>
    _$_NewBabyModel(
      baby: json['baby'] == null
          ? null
          : Baby.fromJson(json['baby'] as Map<String, dynamic>),
      textFromBaby: json['text_from_baby'] as String?,
      illustrationImage: json['illustration_image'] as String?,
      sizeIllustrationImage: json['size_illustration_image'] as String?,
      sizeDescription: json['size_description'] as String?,
      length: (json['length'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      growthDescription: json['growth_description'] as String?,
      symptomDescription: json['symptom_description'] as String?,
    );

Map<String, dynamic> _$$_NewBabyModelToJson(_$_NewBabyModel instance) =>
    <String, dynamic>{
      'baby': instance.baby,
      'text_from_baby': instance.textFromBaby,
      'illustration_image': instance.illustrationImage,
      'size_illustration_image': instance.sizeIllustrationImage,
      'size_description': instance.sizeDescription,
      'length': instance.length,
      'weight': instance.weight,
      'growth_description': instance.growthDescription,
      'symptom_description': instance.symptomDescription,
    };

_$_Baby _$$_BabyFromJson(Map<String, dynamic> json) => _$_Baby(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      lastMenstruationDate: json['last_menstruation_date'] as String?,
      status: json['status'] as String?,
      pregnancyAgeDay: json['pregnancy_age_day'] as int?,
      pregnancyAgeWeek: json['pregnancy_age_week'] as int?,
      pregnancyAgeRunningWeek: json['pregnancy_age_running_week'] as int?,
      pregnancyAgeDayOfWeek: json['pregnancy_age_day_of_week'] as int?,
      pregnancyAgeTrimester: json['pregnancy_age_trimester'] as int?,
      pregnancyAgeEstimatedBirth: json['pregnancy_age_estimated_birth'] == null
          ? null
          : DateTime.parse(json['pregnancy_age_estimated_birth'] as String),
    );

Map<String, dynamic> _$$_BabyToJson(_$_Baby instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'last_menstruation_date': instance.lastMenstruationDate,
      'status': instance.status,
      'pregnancy_age_day': instance.pregnancyAgeDay,
      'pregnancy_age_week': instance.pregnancyAgeWeek,
      'pregnancy_age_running_week': instance.pregnancyAgeRunningWeek,
      'pregnancy_age_day_of_week': instance.pregnancyAgeDayOfWeek,
      'pregnancy_age_trimester': instance.pregnancyAgeTrimester,
      'pregnancy_age_estimated_birth':
          instance.pregnancyAgeEstimatedBirth?.toIso8601String(),
    };
