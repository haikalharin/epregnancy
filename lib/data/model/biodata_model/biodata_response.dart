// To parse this JSON data, do
//
//     final biodataResponse = biodataResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'biodata_response.freezed.dart';
part 'biodata_response.g.dart';


@freezed
class BiodataResponse with _$BiodataResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BiodataResponse({
    required String? username,
    required String? name,
    required String? email,
    required String? mobile,
    required DateTime? dob,
    required DateTime? lastBiodataView,
  }) = _BiodataResponse;

  factory BiodataResponse.fromJson(Map<String, dynamic> json) => _$BiodataResponseFromJson(json);
}
