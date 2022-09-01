// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      mobile: json['mobile'] as String?,
      token: json['token'] as String?,
      totalPointsEarned: json['total_points_earned'] as int?,
      totalPointsRedeemed: json['total_points_redeemed'] as int?,
      imageUrl: json['image_url'] as String?,
      coverUrl: json['cover_url'] as String?,
      isVerified: json['is_verified'] as bool?,
      isPregnant: json['is_pregnant'] as bool?,
      isPlanningPregnancy: json['is_planning_pregnancy'] as bool?,
      isHaveBaby: json['is_have_baby'] as bool?,
      status: json['status'] as String?,
      gamificationPoints: (json['gamification_points'] as List<dynamic>?)
          ?.map((e) => GamificationPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkins: (json['checkins'] as List<dynamic>?)
          ?.map((e) => CheckIn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'mobile': instance.mobile,
      'token': instance.token,
      'total_points_earned': instance.totalPointsEarned,
      'total_points_redeemed': instance.totalPointsRedeemed,
      'image_url': instance.imageUrl,
      'cover_url': instance.coverUrl,
      'is_verified': instance.isVerified,
      'is_pregnant': instance.isPregnant,
      'is_planning_pregnancy': instance.isPlanningPregnancy,
      'is_have_baby': instance.isHaveBaby,
      'status': instance.status,
      'gamification_points':
          instance.gamificationPoints?.map((e) => e.toJson()).toList(),
      'checkins': instance.checkins?.map((e) => e.toJson()).toList(),
    };

_$_GamificationPoint _$$_GamificationPointFromJson(Map<String, dynamic> json) =>
    _$_GamificationPoint(
      id: json['id'] as String?,
      group: json['group'] as String?,
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_GamificationPointToJson(
        _$_GamificationPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'key': instance.key,
      'value': instance.value,
    };

_$_CheckIn _$$_CheckInFromJson(Map<String, dynamic> json) => _$_CheckIn(
      day: json['day'] as int?,
      date: json['date'] as String?,
      pointsEarned: json['points_earned'] as int?,
    );

Map<String, dynamic> _$$_CheckInToJson(_$_CheckIn instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'points_earned': instance.pointsEarned,
    };
