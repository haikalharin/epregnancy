// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_child_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyChildDashboard _$$_MyChildDashboardFromJson(Map<String, dynamic> json) =>
    _$_MyChildDashboard(
      child: json['child'] == null
          ? null
          : Child.fromJson(json['child'] as Map<String, dynamic>),
      growth: json['growth'] == null
          ? null
          : Growth.fromJson(json['growth'] as Map<String, dynamic>),
      growthStatus: json['growth_status'] == null
          ? null
          : GrowthStatus.fromJson(
              json['growth_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MyChildDashboardToJson(_$_MyChildDashboard instance) =>
    <String, dynamic>{
      'child': instance.child?.toJson(),
      'growth': instance.growth?.toJson(),
      'growth_status': instance.growthStatus?.toJson(),
    };

_$_Child _$$_ChildFromJson(Map<String, dynamic> json) => _$_Child(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] == null
          ? null
          : Age.fromJson(json['age'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChildToJson(_$_Child instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'age': instance.age?.toJson(),
    };

_$_Age _$$_AgeFromJson(Map<String, dynamic> json) => _$_Age(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      monthOnly: json['month_only'] as int?,
      dayOnly: json['day_only'] as int?,
    );

Map<String, dynamic> _$$_AgeToJson(_$_Age instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'month_only': instance.monthOnly,
      'day_only': instance.dayOnly,
    };

_$_Growth _$$_GrowthFromJson(Map<String, dynamic> json) => _$_Growth(
      id: json['id'] as String?,
      childId: json['child_id'] as String?,
      ageMonth: json['age_month'] as int?,
      visitDate: json['visit_date'] as String?,
      length: json['length'] as int?,
      weight: json['weight'] as int?,
      headCircumference: json['head_circumference'] as int?,
    );

Map<String, dynamic> _$$_GrowthToJson(_$_Growth instance) => <String, dynamic>{
      'id': instance.id,
      'child_id': instance.childId,
      'age_month': instance.ageMonth,
      'visit_date': instance.visitDate,
      'length': instance.length,
      'weight': instance.weight,
      'head_circumference': instance.headCircumference,
    };

_$_GrowthStatus _$$_GrowthStatusFromJson(Map<String, dynamic> json) =>
    _$_GrowthStatus(
      length: json['length'] as String?,
      weight: json['weight'] as String?,
      headCircumference: json['head_circumference'] as String?,
    );

Map<String, dynamic> _$$_GrowthStatusToJson(_$_GrowthStatus instance) =>
    <String, dynamic>{
      'length': instance.length,
      'weight': instance.weight,
      'head_circumference': instance.headCircumference,
    };
