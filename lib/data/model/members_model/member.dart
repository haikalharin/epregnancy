// To parse this JSON data, do
//
//     final member = memberFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'member.freezed.dart';
part 'member.g.dart';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

@freezed
class Member with _$Member {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Member({
    required String? id,
    required String? name,
    required String? username,
    required String? imageUrl,
    required bool? isHaveBaby,
    required bool? isPregnant,
    required int? pregnancyWeek,
    required int? totalVisit,
    required DateTime? createdDate,
    required DateTime? lastVisit,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
