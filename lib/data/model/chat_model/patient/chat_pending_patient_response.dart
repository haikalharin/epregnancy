import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_pending_patient_response.freezed.dart';
part 'chat_pending_patient_response.g.dart';

@freezed
abstract class ChatPendingPatientResponse with _$ChatPendingPatientResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingPatientResponse({
    required List<Content>? content,
    required ChatPendingPatientPageable? pageable,
    required int? totalPages,
    required int? totalElements,
    required bool? last,
    required int? number,
    required ChatPendingPatientSort? sort,
    required int? size,
    required int? numberOfElements,
    required bool? first,
    required bool? empty,
  }) = _ChatPendingPatientResponse;

  factory ChatPendingPatientResponse.fromJson(Map<String, dynamic> json) => _$ChatPendingPatientResponseFromJson(json);
}

@freezed
abstract class Content with _$Content {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Content({
    required String? id,
    required String? fromId,
    required String? hospitalId,
    required String? message,
    required String? imageUrl,
    required ChatPendingPatientFrom? from,
    required ChatPendingPatientHospital? hospital,
    required bool? isDelete,
    required String? createdBy,
    required String? createdFrom,
    required String? createdDate,
    required String? modifiedBy,
    required String? modifiedFrom,
    required String? modifiedDate,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
abstract class ChatPendingPatientFrom with _$ChatPendingPatientFrom {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingPatientFrom({
    required String? id,
    required String? name,
    required String? dob,
    required String? email,
    required String? mobile,
    required String? username,
    required String? status,
    required bool? isPatient,
    required bool? isMidwife,
    required bool? isAdmin,
    required bool? isSuperAdmin,
    required bool? isVerified,
    required String? hospitalId,
    required String? hospital,
    required String? imageUrl,
    required String? coverUrl,
  }) = _ChatPendingPatientFrom;

  factory ChatPendingPatientFrom.fromJson(Map<String, dynamic> json) => _$ChatPendingPatientFromFromJson(json);
}

@freezed
abstract class ChatPendingPatientHospital with _$ChatPendingPatientHospital {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatPendingPatientHospital({
    required String? id,
    required String? alias,
    required String? name,
    required String? address,
    required String? city,
    required String? country,
    required String? postalCode,
    required String? phone,
    required String? email,
    required double latitude,
    required double longitude,
    required String? status,
    required String? imageUrl,
    required String? coverUrl,
  }) = _ChatPendingPatientHospital;

  factory ChatPendingPatientHospital.fromJson(Map<String, dynamic> json) => _$ChatPendingPatientHospitalFromJson(json);
}

@freezed
abstract class ChatPendingPatientPageable with _$ChatPendingPatientPageable {
  const factory ChatPendingPatientPageable({
    required ChatPendingPatientSort? sort,
    required int? offset,
    required int? pageNumber,
    required int? pageSize,
    required bool? paged,
    required bool? unpaged,
  }) = _ChatPendingPatientPageable;

  factory ChatPendingPatientPageable.fromJson(Map<String, dynamic> json) => _$ChatPendingPatientPageableFromJson(json);
}

@freezed
abstract class ChatPendingPatientSort with _$ChatPendingPatientSort {
  const factory ChatPendingPatientSort({
    required bool? empty,
    required bool? sorted,
    required bool? unsorted,
  }) = _ChatPendingPatientSort;

  factory ChatPendingPatientSort.fromJson(Map<String, dynamic> json) => _$ChatPendingPatientSortFromJson(json);
}
