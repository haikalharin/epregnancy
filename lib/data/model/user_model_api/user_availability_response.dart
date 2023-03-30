// To parse this JSON data, do
//
//     final userAvailabilityResponse = userAvailabilityResponseFromJson(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_availability_response.freezed.dart';
part 'user_availability_response.g.dart';

@freezed
class UserAvailabilityResponse with _$UserAvailabilityResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true,includeIfNull: true)
  const factory UserAvailabilityResponse({
    final String? id,
    final String? name,
    final String? dob,
    final String? username,
    final String? status,
    final int? lastBiodataView,
    final String? fcmToken,
    final bool? isAgree,
    final String? agreementDate,
    final bool? isOnline,
    final int? totalLogin,
    final String? lastLoginDate,
    final String? hospitalId,
    final Hospital? hospital,
    final String? createdDate,
    final String? modifiedDate,
    final String? email,
    final bool? isVerified,
    final bool? isPregnant,
    final bool? isPlanningPregnancy,
    final bool? isHaveBaby,
    final String? imageUrl,
  }) = _UserAvailabilityResponse;

  factory UserAvailabilityResponse.fromJson(Map<String, dynamic> json) => _$UserAvailabilityResponseFromJson(json);
}

@freezed
class Hospital with _$Hospital {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Hospital({
    final String? id,
    final String? alias,
    final String? name,
    final String? email,
    final String? imageUrl,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);
}
