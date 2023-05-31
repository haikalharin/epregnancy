// To parse this JSON data, do
//
//     final visitHospitalModel = visitHospitalModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'visit_hospital_model.freezed.dart';
part 'visit_hospital_model.g.dart';

VisitHospitalModel visitHospitalModelFromJson(String str) => VisitHospitalModel.fromJson(json.decode(str));

String visitHospitalModelToJson(VisitHospitalModel data) => json.encode(data.toJson());

@freezed
class VisitHospitalModel with _$VisitHospitalModel {
  const factory VisitHospitalModel({
    @JsonKey(name: 'first_visit',includeIfNull: true)
    bool? firstVisit,
  }) = _VisitHospitalModel;

  factory VisitHospitalModel.fromJson(Map<String, dynamic> json) => _$VisitHospitalModelFromJson(json);
}
