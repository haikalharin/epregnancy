// To parse this JSON data, do
//
//     final userVisitModel = userVisitModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_visit_model.freezed.dart';
part 'user_visit_model.g.dart';

UserVisitModel userVisitModelFromJson(String str) => UserVisitModel.fromJson(json.decode(str));

String userVisitModelToJson(UserVisitModel data) => json.encode(data.toJson());

@freezed
class UserVisitModel with _$UserVisitModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserVisitModel({
    String? id,
    @JsonKey(name: 'user',includeIfNull: true) UserInfoVisit? user,
    String? midwifeId,
    DateTime? date,
    String? status,
    String? nextVisitDate,
    String? nextVisitTime,
    String? createdDate,
    String? modifiedDate,
  }) = _UserVisitModel;

  factory UserVisitModel.fromJson(Map<String, dynamic> json) => _$UserVisitModelFromJson(json);
}

@freezed
class UserInfoVisit with _$UserInfoVisit {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserInfoVisit({
    String? id,
    String? name,
    String? username,
    String? imageUrl,
    bool? isHaveBaby,
    bool? isPregnant,
    int? pregnancyWeek,
    int? totalVisit,
    String? createdDate,
    String? lastVisit,
  }) = _UserInfoVisit;

  factory UserInfoVisit.fromJson(Map<String, dynamic> json) => _$UserInfoVisitFromJson(json);
}
