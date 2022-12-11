
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../hospital_model/hospital_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String? userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(includeIfNull: true)
    String? id,
    @JsonKey(includeIfNull: true, name:'referral_code')
    String? referralCode,
    @JsonKey(includeIfNull: true)
    String? password,
    @JsonKey(name:'is_patient',includeIfNull: true)
    bool? isPatient,
    @JsonKey(name:'is_midwife',includeIfNull: true)
    bool? isMidwife,
    @JsonKey(includeIfNull: true)
    String? name,
    @JsonKey(includeIfNull: true)
    dynamic dob,
    @JsonKey(includeIfNull: true)
    String? username,
    @JsonKey(includeIfNull: true)
    String? email,
    @JsonKey(includeIfNull: true)
    String? mobile,
    @JsonKey(includeIfNull: true)
    String? token,
    @JsonKey(name:'total_points_earned',includeIfNull: true)
    int? totalpointsEarned,
    @JsonKey(name:'total_points_redeemed',includeIfNull: true)
    int? totalpointsRedeemed,
    @JsonKey(name:'image_url',includeIfNull: true)
    String? imageUrl,
    @JsonKey(name: 'hospital_id', includeIfNull: false)
    String? hospitalId,
    HospitalModel? hospitalModel,
    @JsonKey(name:'cover_url',includeIfNull: true)
    dynamic coverUrl,
    @JsonKey(name:'is_verified',includeIfNull: true)
    bool? isVerified,
    @JsonKey(name:'is_pregnant',includeIfNull: true)
    bool? isPregnant,
    @JsonKey(name:'is_planning_pregnancy',includeIfNull: true)
    bool? isPlanningPregnancy,
    @JsonKey(name:'is_have_baby',includeIfNull: true)
    bool? isHaveBaby,
    @JsonKey(includeIfNull: true)
    dynamic status,
    @JsonKey(includeIfNull: true)
    List<Gamificationpoint>? gamificationpoints,
    @JsonKey(includeIfNull: true)
    List<LastItemRedeemed>? redeemHistory,
    @JsonKey(includeIfNull: true)
    LastItemRedeemed? lastItemRedeemed,
    @JsonKey(includeIfNull: true)
    List<Checkin>? checkins,
    @JsonKey(includeIfNull: true)
    List<Baby>? babies,
    @JsonKey(name:'is_agree',includeIfNull: true)
    bool? isAgree,
    @JsonKey(name:'fcm_token',includeIfNull: true)
    String? fcmToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
abstract class Baby with _$Baby {
  const factory Baby({
    @JsonKey(includeIfNull: true)
    String? name,
    @JsonKey(includeIfNull: true)
    String? gender,
    @JsonKey(includeIfNull: true)
    String? dob,
    @JsonKey(includeIfNull: true)
    bool? isTwins,
    @JsonKey(includeIfNull: true)
    String? lastMenstruationDate,
    @JsonKey(includeIfNull: true)
    String? status,
    @JsonKey(includeIfNull: true)
    PregnancyAge? pregnancyAge,
    @JsonKey(includeIfNull: true)
    String? estimatedBabyBorn,

  }) = _Baby;

  factory Baby.fromJson(Map<String, dynamic> json) => _$BabyFromJson(json);
}

@freezed
abstract class PregnancyAge with _$PregnancyAge {
  const factory PregnancyAge({
    @JsonKey(includeIfNull: true)
    int? year,
    @JsonKey(includeIfNull: true)
    int? month,
    @JsonKey(includeIfNull: true)
    int? day,
    @JsonKey(includeIfNull: true)
    int? week,
  }) = _PregnancyAge;

  factory PregnancyAge.fromJson(Map<String, dynamic> json) => _$PregnancyAgeFromJson(json);
}

@freezed
abstract class Checkin with _$Checkin {
  const factory Checkin({
    @JsonKey(includeIfNull: true)
    int? day,
    @JsonKey(includeIfNull: true)
    String? date,
    @JsonKey(includeIfNull: true)
    int? pointsEarned,
  }) = _Checkin;

  factory Checkin.fromJson(Map<String, dynamic> json) => _$CheckinFromJson(json);
}

@freezed
abstract class Gamificationpoint with _$Gamificationpoint {
  const factory Gamificationpoint({
    @JsonKey(includeIfNull: true)
    String? id,
    @JsonKey(includeIfNull: true)
    String? group,
    @JsonKey(includeIfNull: true)
    String? key,
    @JsonKey(includeIfNull: true)
    String? value,
  }) = _Gamificationpoint;

  factory Gamificationpoint.fromJson(Map<String, dynamic> json) => _$GamificationpointFromJson(json);
}

@freezed
abstract class LastItemRedeemed with _$LastItemRedeemed {
  const factory LastItemRedeemed({
    @JsonKey(includeIfNull: true)
    String? id,
    @JsonKey(includeIfNull: true)
    Item? item,
    @JsonKey(includeIfNull: true)
    int? pointsRedeemed,
    @JsonKey(includeIfNull: true)
    String? status,
  }) = _LastItemRedeemed;

  factory LastItemRedeemed.fromJson(Map<String, dynamic> json) => _$LastItemRedeemedFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    String? id,
    @JsonKey(includeIfNull: true)
    String? name,
    @JsonKey(includeIfNull: true)
    String? description,
    @JsonKey(includeIfNull: true)
    int? pointsRequired,
    @JsonKey(includeIfNull: true)
    dynamic status,
    String? imageUrl,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}


