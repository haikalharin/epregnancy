import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
abstract class HospitalModel with _$HospitalModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory HospitalModel({
    required String? id,
    required String? alias,
    required String? name,
    required String? address,
    required String? city,
    required String? country,
    required String? postalCode,
    required String? phone,
    required String? email,
    required double? latitude,
    required double? longitude,
    required String? status,
    required String? imageUrl,
    required String? coverUrl,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _HospitalModel;

  factory HospitalModel.fromJson(Map<String, dynamic> json) => _$HospitalModelFromJson(json);
}
