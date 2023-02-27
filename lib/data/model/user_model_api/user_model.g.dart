// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      referralCode: json['referral_code'] as String?,
      password: json['password'] as String?,
      isPatient: json['is_patient'] as bool?,
      isMidwife: json['is_midwife'] as bool?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      token: json['token'] as String?,
      totalpointsEarned: json['total_points_earned'] as int?,
      totalLogin: json['total_login'] as int?,
      totalpointsRedeemed: json['total_points_redeemed'] as int?,
      imageUrl: json['image_url'] as String?,
      hospitalId: json['hospital_id'] as String?,
      hospitalModel: json['hospitalModel'] == null
          ? null
          : HospitalModel.fromJson(
              json['hospitalModel'] as Map<String, dynamic>),
      coverUrl: json['cover_url'],
      isVerified: json['is_verified'] as bool?,
      isPregnant: json['is_pregnant'] as bool?,
      isPlanningPregnancy: json['is_planning_pregnancy'] as bool?,
      isHaveBaby: json['is_have_baby'] as bool?,
      status: json['status'],
      gamificationpoints: (json['gamificationpoints'] as List<dynamic>?)
          ?.map((e) => Gamificationpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      redeemHistory: (json['redeemHistory'] as List<dynamic>?)
          ?.map((e) => LastItemRedeemed.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastItemRedeemed: json['lastItemRedeemed'] == null
          ? null
          : LastItemRedeemed.fromJson(
              json['lastItemRedeemed'] as Map<String, dynamic>),
      checkins: (json['checkins'] as List<dynamic>?)
          ?.map((e) => Checkin.fromJson(e as Map<String, dynamic>))
          .toList(),
      babies: (json['babies'] as List<dynamic>?)
          ?.map((e) => Baby.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAgree: json['is_agree'] as bool?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'referral_code': instance.referralCode,
    'password': instance.password,
    'is_patient': instance.isPatient,
    'is_midwife': instance.isMidwife,
    'name': instance.name,
    'dob': instance.dob,
    'username': instance.username,
    'email': instance.email,
    'mobile': instance.mobile,
    'token': instance.token,
    'total_points_earned': instance.totalpointsEarned,
    'total_login': instance.totalLogin,
    'total_points_redeemed': instance.totalpointsRedeemed,
    'image_url': instance.imageUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hospital_id', instance.hospitalId);
  val['hospitalModel'] = instance.hospitalModel;
  val['cover_url'] = instance.coverUrl;
  val['is_verified'] = instance.isVerified;
  val['is_pregnant'] = instance.isPregnant;
  val['is_planning_pregnancy'] = instance.isPlanningPregnancy;
  val['is_have_baby'] = instance.isHaveBaby;
  val['status'] = instance.status;
  val['gamificationpoints'] = instance.gamificationpoints;
  val['redeemHistory'] = instance.redeemHistory;
  val['lastItemRedeemed'] = instance.lastItemRedeemed;
  val['checkins'] = instance.checkins;
  val['babies'] = instance.babies;
  val['is_agree'] = instance.isAgree;
  val['fcm_token'] = instance.fcmToken;
  return val;
}

_$_Baby _$$_BabyFromJson(Map<String, dynamic> json) => _$_Baby(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      isTwins: json['isTwins'] as bool?,
      lastMenstruationDate: json['lastMenstruationDate'] as String?,
      status: json['status'] as String?,
      pregnancyAge: json['pregnancyAge'] == null
          ? null
          : PregnancyAge.fromJson(json['pregnancyAge'] as Map<String, dynamic>),
      estimatedBabyBorn: json['estimatedBabyBorn'] as String?,
    );

Map<String, dynamic> _$$_BabyToJson(_$_Baby instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob,
      'isTwins': instance.isTwins,
      'lastMenstruationDate': instance.lastMenstruationDate,
      'status': instance.status,
      'pregnancyAge': instance.pregnancyAge,
      'estimatedBabyBorn': instance.estimatedBabyBorn,
    };

_$_PregnancyAge _$$_PregnancyAgeFromJson(Map<String, dynamic> json) =>
    _$_PregnancyAge(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      week: json['week'] as int?,
    );

Map<String, dynamic> _$$_PregnancyAgeToJson(_$_PregnancyAge instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'week': instance.week,
    };

_$_Checkin _$$_CheckinFromJson(Map<String, dynamic> json) => _$_Checkin(
      day: json['day'] as int?,
      date: json['date'] as String?,
      pointsEarned: json['pointsEarned'] as int?,
    );

Map<String, dynamic> _$$_CheckinToJson(_$_Checkin instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date,
      'pointsEarned': instance.pointsEarned,
    };

_$_Gamificationpoint _$$_GamificationpointFromJson(Map<String, dynamic> json) =>
    _$_Gamificationpoint(
      id: json['id'] as String?,
      group: json['group'] as String?,
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_GamificationpointToJson(
        _$_Gamificationpoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'key': instance.key,
      'value': instance.value,
    };

_$_LastItemRedeemed _$$_LastItemRedeemedFromJson(Map<String, dynamic> json) =>
    _$_LastItemRedeemed(
      id: json['id'] as String?,
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
      pointsRedeemed: json['pointsRedeemed'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_LastItemRedeemedToJson(_$_LastItemRedeemed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'pointsRedeemed': instance.pointsRedeemed,
      'status': instance.status,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      pointsRequired: json['pointsRequired'] as int?,
      status: json['status'],
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pointsRequired': instance.pointsRequired,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
    };
