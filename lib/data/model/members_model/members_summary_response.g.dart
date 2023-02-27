// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MembersSummaryResponse _$$_MembersSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MembersSummaryResponse(
      hospitalId: json['hospital_id'] as String?,
      hospitalName: json['hospital_name'] as String?,
      totalMidwife: json['total_midwife'] as int?,
      totalPatient: json['total_patient'] as int?,
    );

Map<String, dynamic> _$$_MembersSummaryResponseToJson(
        _$_MembersSummaryResponse instance) =>
    <String, dynamic>{
      'hospital_id': instance.hospitalId,
      'hospital_name': instance.hospitalName,
      'total_midwife': instance.totalMidwife,
      'total_patient': instance.totalPatient,
    };
