// To parse this JSON data, do
//
//     final membersSummaryResponse = membersSummaryResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'members_summary_response.freezed.dart';
part 'members_summary_response.g.dart';

@freezed
class MembersSummaryResponse with _$MembersSummaryResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MembersSummaryResponse({
    required String? hospitalId,
    required String? hospitalName,
    required int? totalMidwife,
    required int? totalPatient,
  }) = _MembersSummaryResponse;

  factory MembersSummaryResponse.fromJson(Map<String, dynamic> json) => _$MembersSummaryResponseFromJson(json);
}
