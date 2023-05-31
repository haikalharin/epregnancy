// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GrowthModel _$$_GrowthModelFromJson(Map<String, dynamic> json) =>
    _$_GrowthModel(
      id: json['id'] as String?,
      childId: json['child_id'] as String?,
      ageMonth: json['age_month'] as int?,
      visitDate: json['visit_date'] as String?,
      length: json['length'] as int?,
      weight: json['weight'] as int?,
      headCircumference: json['head_circumference'] as int?,
    );

Map<String, dynamic> _$$_GrowthModelToJson(_$_GrowthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'child_id': instance.childId,
      'age_month': instance.ageMonth,
      'visit_date': instance.visitDate,
      'length': instance.length,
      'weight': instance.weight,
      'head_circumference': instance.headCircumference,
    };
