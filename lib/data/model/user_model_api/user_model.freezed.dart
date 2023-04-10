// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true, name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_patient', includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points_earned', includeIfNull: true)
  int? get totalpointsEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_login', includeIfNull: true)
  int? get totalLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
  int? get totalpointsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'hospital_id', includeIfNull: false)
  String? get hospitalId => throw _privateConstructorUsedError;
  HospitalModel? get hospital => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url', includeIfNull: true)
  dynamic get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified', includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pregnant', includeIfNull: true)
  bool? get isPregnant => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
  bool? get isPlanningPregnancy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_have_baby', includeIfNull: true)
  bool? get isHaveBaby => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_biodata_view', includeIfNull: true)
  String? get lastBiodataView => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  dynamic get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<Gamificationpoint>? get gamificationpoints =>
      throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<LastItemRedeemed>? get redeemHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  LastItemRedeemed? get lastItemRedeemed => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<Checkin>? get checkins => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<Baby>? get babies => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_agree', includeIfNull: true)
  bool? get isAgree => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token', includeIfNull: true)
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(includeIfNull: true, name: 'referral_code')
          String? referralCode,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(name: 'is_patient', includeIfNull: true)
          bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
          bool? isMidwife,
      @JsonKey(includeIfNull: true)
          String? name,
      @JsonKey(includeIfNull: true)
          String? dob,
      @JsonKey(includeIfNull: true)
          String? username,
      @JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? mobile,
      @JsonKey(includeIfNull: true)
          String? token,
      @JsonKey(name: 'total_points_earned', includeIfNull: true)
          int? totalpointsEarned,
      @JsonKey(name: 'total_login', includeIfNull: true)
          int? totalLogin,
      @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
          int? totalpointsRedeemed,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'hospital_id', includeIfNull: false)
          String? hospitalId,
      HospitalModel? hospital,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          dynamic coverUrl,
      @JsonKey(name: 'is_verified', includeIfNull: true)
          bool? isVerified,
      @JsonKey(name: 'is_pregnant', includeIfNull: true)
          bool? isPregnant,
      @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
          bool? isPlanningPregnancy,
      @JsonKey(name: 'is_have_baby', includeIfNull: true)
          bool? isHaveBaby,
      @JsonKey(name: 'last_biodata_view', includeIfNull: true)
          String? lastBiodataView,
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
      @JsonKey(name: 'is_agree', includeIfNull: true)
          bool? isAgree,
      @JsonKey(name: 'fcm_token', includeIfNull: true)
          String? fcmToken});

  $HospitalModelCopyWith<$Res>? get hospital;
  $LastItemRedeemedCopyWith<$Res>? get lastItemRedeemed;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? referralCode = freezed,
    Object? password = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? token = freezed,
    Object? totalpointsEarned = freezed,
    Object? totalLogin = freezed,
    Object? totalpointsRedeemed = freezed,
    Object? imageUrl = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? coverUrl = freezed,
    Object? isVerified = freezed,
    Object? isPregnant = freezed,
    Object? isPlanningPregnancy = freezed,
    Object? isHaveBaby = freezed,
    Object? lastBiodataView = freezed,
    Object? status = freezed,
    Object? gamificationpoints = freezed,
    Object? redeemHistory = freezed,
    Object? lastItemRedeemed = freezed,
    Object? checkins = freezed,
    Object? babies = freezed,
    Object? isAgree = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: referralCode == freezed
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      totalpointsEarned: totalpointsEarned == freezed
          ? _value.totalpointsEarned
          : totalpointsEarned // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLogin: totalLogin == freezed
          ? _value.totalLogin
          : totalLogin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalpointsRedeemed: totalpointsRedeemed == freezed
          ? _value.totalpointsRedeemed
          : totalpointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalModel?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPregnant: isPregnant == freezed
          ? _value.isPregnant
          : isPregnant // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPlanningPregnancy: isPlanningPregnancy == freezed
          ? _value.isPlanningPregnancy
          : isPlanningPregnancy // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHaveBaby: isHaveBaby == freezed
          ? _value.isHaveBaby
          : isHaveBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastBiodataView: lastBiodataView == freezed
          ? _value.lastBiodataView
          : lastBiodataView // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gamificationpoints: gamificationpoints == freezed
          ? _value.gamificationpoints
          : gamificationpoints // ignore: cast_nullable_to_non_nullable
              as List<Gamificationpoint>?,
      redeemHistory: redeemHistory == freezed
          ? _value.redeemHistory
          : redeemHistory // ignore: cast_nullable_to_non_nullable
              as List<LastItemRedeemed>?,
      lastItemRedeemed: lastItemRedeemed == freezed
          ? _value.lastItemRedeemed
          : lastItemRedeemed // ignore: cast_nullable_to_non_nullable
              as LastItemRedeemed?,
      checkins: checkins == freezed
          ? _value.checkins
          : checkins // ignore: cast_nullable_to_non_nullable
              as List<Checkin>?,
      babies: babies == freezed
          ? _value.babies
          : babies // ignore: cast_nullable_to_non_nullable
              as List<Baby>?,
      isAgree: isAgree == freezed
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $HospitalModelCopyWith<$Res>? get hospital {
    if (_value.hospital == null) {
      return null;
    }

    return $HospitalModelCopyWith<$Res>(_value.hospital!, (value) {
      return _then(_value.copyWith(hospital: value));
    });
  }

  @override
  $LastItemRedeemedCopyWith<$Res>? get lastItemRedeemed {
    if (_value.lastItemRedeemed == null) {
      return null;
    }

    return $LastItemRedeemedCopyWith<$Res>(_value.lastItemRedeemed!, (value) {
      return _then(_value.copyWith(lastItemRedeemed: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(includeIfNull: true, name: 'referral_code')
          String? referralCode,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(name: 'is_patient', includeIfNull: true)
          bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
          bool? isMidwife,
      @JsonKey(includeIfNull: true)
          String? name,
      @JsonKey(includeIfNull: true)
          String? dob,
      @JsonKey(includeIfNull: true)
          String? username,
      @JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? mobile,
      @JsonKey(includeIfNull: true)
          String? token,
      @JsonKey(name: 'total_points_earned', includeIfNull: true)
          int? totalpointsEarned,
      @JsonKey(name: 'total_login', includeIfNull: true)
          int? totalLogin,
      @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
          int? totalpointsRedeemed,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'hospital_id', includeIfNull: false)
          String? hospitalId,
      HospitalModel? hospital,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          dynamic coverUrl,
      @JsonKey(name: 'is_verified', includeIfNull: true)
          bool? isVerified,
      @JsonKey(name: 'is_pregnant', includeIfNull: true)
          bool? isPregnant,
      @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
          bool? isPlanningPregnancy,
      @JsonKey(name: 'is_have_baby', includeIfNull: true)
          bool? isHaveBaby,
      @JsonKey(name: 'last_biodata_view', includeIfNull: true)
          String? lastBiodataView,
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
      @JsonKey(name: 'is_agree', includeIfNull: true)
          bool? isAgree,
      @JsonKey(name: 'fcm_token', includeIfNull: true)
          String? fcmToken});

  @override
  $HospitalModelCopyWith<$Res>? get hospital;
  @override
  $LastItemRedeemedCopyWith<$Res>? get lastItemRedeemed;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, (v) => _then(v as _$_UserModel));

  @override
  _$_UserModel get _value => super._value as _$_UserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? referralCode = freezed,
    Object? password = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? token = freezed,
    Object? totalpointsEarned = freezed,
    Object? totalLogin = freezed,
    Object? totalpointsRedeemed = freezed,
    Object? imageUrl = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? coverUrl = freezed,
    Object? isVerified = freezed,
    Object? isPregnant = freezed,
    Object? isPlanningPregnancy = freezed,
    Object? isHaveBaby = freezed,
    Object? lastBiodataView = freezed,
    Object? status = freezed,
    Object? gamificationpoints = freezed,
    Object? redeemHistory = freezed,
    Object? lastItemRedeemed = freezed,
    Object? checkins = freezed,
    Object? babies = freezed,
    Object? isAgree = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_$_UserModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: referralCode == freezed
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      totalpointsEarned: totalpointsEarned == freezed
          ? _value.totalpointsEarned
          : totalpointsEarned // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLogin: totalLogin == freezed
          ? _value.totalLogin
          : totalLogin // ignore: cast_nullable_to_non_nullable
              as int?,
      totalpointsRedeemed: totalpointsRedeemed == freezed
          ? _value.totalpointsRedeemed
          : totalpointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalModel?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPregnant: isPregnant == freezed
          ? _value.isPregnant
          : isPregnant // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPlanningPregnancy: isPlanningPregnancy == freezed
          ? _value.isPlanningPregnancy
          : isPlanningPregnancy // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHaveBaby: isHaveBaby == freezed
          ? _value.isHaveBaby
          : isHaveBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastBiodataView: lastBiodataView == freezed
          ? _value.lastBiodataView
          : lastBiodataView // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gamificationpoints: gamificationpoints == freezed
          ? _value._gamificationpoints
          : gamificationpoints // ignore: cast_nullable_to_non_nullable
              as List<Gamificationpoint>?,
      redeemHistory: redeemHistory == freezed
          ? _value._redeemHistory
          : redeemHistory // ignore: cast_nullable_to_non_nullable
              as List<LastItemRedeemed>?,
      lastItemRedeemed: lastItemRedeemed == freezed
          ? _value.lastItemRedeemed
          : lastItemRedeemed // ignore: cast_nullable_to_non_nullable
              as LastItemRedeemed?,
      checkins: checkins == freezed
          ? _value._checkins
          : checkins // ignore: cast_nullable_to_non_nullable
              as List<Checkin>?,
      babies: babies == freezed
          ? _value._babies
          : babies // ignore: cast_nullable_to_non_nullable
              as List<Baby>?,
      isAgree: isAgree == freezed
          ? _value.isAgree
          : isAgree // ignore: cast_nullable_to_non_nullable
              as bool?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(includeIfNull: true)
          this.id,
      @JsonKey(includeIfNull: true, name: 'referral_code')
          this.referralCode,
      @JsonKey(includeIfNull: true)
          this.password,
      @JsonKey(name: 'is_patient', includeIfNull: true)
          this.isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
          this.isMidwife,
      @JsonKey(includeIfNull: true)
          this.name,
      @JsonKey(includeIfNull: true)
          this.dob,
      @JsonKey(includeIfNull: true)
          this.username,
      @JsonKey(includeIfNull: true)
          this.email,
      @JsonKey(includeIfNull: true)
          this.mobile,
      @JsonKey(includeIfNull: true)
          this.token,
      @JsonKey(name: 'total_points_earned', includeIfNull: true)
          this.totalpointsEarned,
      @JsonKey(name: 'total_login', includeIfNull: true)
          this.totalLogin,
      @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
          this.totalpointsRedeemed,
      @JsonKey(name: 'image_url', includeIfNull: true)
          this.imageUrl,
      @JsonKey(name: 'hospital_id', includeIfNull: false)
          this.hospitalId,
      this.hospital,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          this.coverUrl,
      @JsonKey(name: 'is_verified', includeIfNull: true)
          this.isVerified,
      @JsonKey(name: 'is_pregnant', includeIfNull: true)
          this.isPregnant,
      @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
          this.isPlanningPregnancy,
      @JsonKey(name: 'is_have_baby', includeIfNull: true)
          this.isHaveBaby,
      @JsonKey(name: 'last_biodata_view', includeIfNull: true)
          this.lastBiodataView,
      @JsonKey(includeIfNull: true)
          this.status,
      @JsonKey(includeIfNull: true)
          final List<Gamificationpoint>? gamificationpoints,
      @JsonKey(includeIfNull: true)
          final List<LastItemRedeemed>? redeemHistory,
      @JsonKey(includeIfNull: true)
          this.lastItemRedeemed,
      @JsonKey(includeIfNull: true)
          final List<Checkin>? checkins,
      @JsonKey(includeIfNull: true)
          final List<Baby>? babies,
      @JsonKey(name: 'is_agree', includeIfNull: true)
          this.isAgree,
      @JsonKey(name: 'fcm_token', includeIfNull: true)
          this.fcmToken})
      : _gamificationpoints = gamificationpoints,
        _redeemHistory = redeemHistory,
        _checkins = checkins,
        _babies = babies;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(includeIfNull: true, name: 'referral_code')
  final String? referralCode;
  @override
  @JsonKey(includeIfNull: true)
  final String? password;
  @override
  @JsonKey(name: 'is_patient', includeIfNull: true)
  final bool? isPatient;
  @override
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  final bool? isMidwife;
  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(includeIfNull: true)
  final String? dob;
  @override
  @JsonKey(includeIfNull: true)
  final String? username;
  @override
  @JsonKey(includeIfNull: true)
  final String? email;
  @override
  @JsonKey(includeIfNull: true)
  final String? mobile;
  @override
  @JsonKey(includeIfNull: true)
  final String? token;
  @override
  @JsonKey(name: 'total_points_earned', includeIfNull: true)
  final int? totalpointsEarned;
  @override
  @JsonKey(name: 'total_login', includeIfNull: true)
  final int? totalLogin;
  @override
  @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
  final int? totalpointsRedeemed;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
  @override
  @JsonKey(name: 'hospital_id', includeIfNull: false)
  final String? hospitalId;
  @override
  final HospitalModel? hospital;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  final dynamic coverUrl;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  final bool? isVerified;
  @override
  @JsonKey(name: 'is_pregnant', includeIfNull: true)
  final bool? isPregnant;
  @override
  @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
  final bool? isPlanningPregnancy;
  @override
  @JsonKey(name: 'is_have_baby', includeIfNull: true)
  final bool? isHaveBaby;
  @override
  @JsonKey(name: 'last_biodata_view', includeIfNull: true)
  final String? lastBiodataView;
  @override
  @JsonKey(includeIfNull: true)
  final dynamic status;
  final List<Gamificationpoint>? _gamificationpoints;
  @override
  @JsonKey(includeIfNull: true)
  List<Gamificationpoint>? get gamificationpoints {
    final value = _gamificationpoints;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LastItemRedeemed>? _redeemHistory;
  @override
  @JsonKey(includeIfNull: true)
  List<LastItemRedeemed>? get redeemHistory {
    final value = _redeemHistory;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: true)
  final LastItemRedeemed? lastItemRedeemed;
  final List<Checkin>? _checkins;
  @override
  @JsonKey(includeIfNull: true)
  List<Checkin>? get checkins {
    final value = _checkins;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Baby>? _babies;
  @override
  @JsonKey(includeIfNull: true)
  List<Baby>? get babies {
    final value = _babies;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_agree', includeIfNull: true)
  final bool? isAgree;
  @override
  @JsonKey(name: 'fcm_token', includeIfNull: true)
  final String? fcmToken;

  @override
  String toString() {
    return 'UserModel(id: $id, referralCode: $referralCode, password: $password, isPatient: $isPatient, isMidwife: $isMidwife, name: $name, dob: $dob, username: $username, email: $email, mobile: $mobile, token: $token, totalpointsEarned: $totalpointsEarned, totalLogin: $totalLogin, totalpointsRedeemed: $totalpointsRedeemed, imageUrl: $imageUrl, hospitalId: $hospitalId, hospital: $hospital, coverUrl: $coverUrl, isVerified: $isVerified, isPregnant: $isPregnant, isPlanningPregnancy: $isPlanningPregnancy, isHaveBaby: $isHaveBaby, lastBiodataView: $lastBiodataView, status: $status, gamificationpoints: $gamificationpoints, redeemHistory: $redeemHistory, lastItemRedeemed: $lastItemRedeemed, checkins: $checkins, babies: $babies, isAgree: $isAgree, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.referralCode, referralCode) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isPatient, isPatient) &&
            const DeepCollectionEquality().equals(other.isMidwife, isMidwife) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.totalpointsEarned, totalpointsEarned) &&
            const DeepCollectionEquality()
                .equals(other.totalLogin, totalLogin) &&
            const DeepCollectionEquality()
                .equals(other.totalpointsRedeemed, totalpointsRedeemed) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality().equals(other.hospital, hospital) &&
            const DeepCollectionEquality().equals(other.coverUrl, coverUrl) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality()
                .equals(other.isPregnant, isPregnant) &&
            const DeepCollectionEquality()
                .equals(other.isPlanningPregnancy, isPlanningPregnancy) &&
            const DeepCollectionEquality()
                .equals(other.isHaveBaby, isHaveBaby) &&
            const DeepCollectionEquality()
                .equals(other.lastBiodataView, lastBiodataView) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._gamificationpoints, _gamificationpoints) &&
            const DeepCollectionEquality()
                .equals(other._redeemHistory, _redeemHistory) &&
            const DeepCollectionEquality()
                .equals(other.lastItemRedeemed, lastItemRedeemed) &&
            const DeepCollectionEquality().equals(other._checkins, _checkins) &&
            const DeepCollectionEquality().equals(other._babies, _babies) &&
            const DeepCollectionEquality().equals(other.isAgree, isAgree) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(referralCode),
        const DeepCollectionEquality().hash(password),
        const DeepCollectionEquality().hash(isPatient),
        const DeepCollectionEquality().hash(isMidwife),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(dob),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(mobile),
        const DeepCollectionEquality().hash(token),
        const DeepCollectionEquality().hash(totalpointsEarned),
        const DeepCollectionEquality().hash(totalLogin),
        const DeepCollectionEquality().hash(totalpointsRedeemed),
        const DeepCollectionEquality().hash(imageUrl),
        const DeepCollectionEquality().hash(hospitalId),
        const DeepCollectionEquality().hash(hospital),
        const DeepCollectionEquality().hash(coverUrl),
        const DeepCollectionEquality().hash(isVerified),
        const DeepCollectionEquality().hash(isPregnant),
        const DeepCollectionEquality().hash(isPlanningPregnancy),
        const DeepCollectionEquality().hash(isHaveBaby),
        const DeepCollectionEquality().hash(lastBiodataView),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(_gamificationpoints),
        const DeepCollectionEquality().hash(_redeemHistory),
        const DeepCollectionEquality().hash(lastItemRedeemed),
        const DeepCollectionEquality().hash(_checkins),
        const DeepCollectionEquality().hash(_babies),
        const DeepCollectionEquality().hash(isAgree),
        const DeepCollectionEquality().hash(fcmToken)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(includeIfNull: true, name: 'referral_code')
          final String? referralCode,
      @JsonKey(includeIfNull: true)
          final String? password,
      @JsonKey(name: 'is_patient', includeIfNull: true)
          final bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
          final bool? isMidwife,
      @JsonKey(includeIfNull: true)
          final String? name,
      @JsonKey(includeIfNull: true)
          final String? dob,
      @JsonKey(includeIfNull: true)
          final String? username,
      @JsonKey(includeIfNull: true)
          final String? email,
      @JsonKey(includeIfNull: true)
          final String? mobile,
      @JsonKey(includeIfNull: true)
          final String? token,
      @JsonKey(name: 'total_points_earned', includeIfNull: true)
          final int? totalpointsEarned,
      @JsonKey(name: 'total_login', includeIfNull: true)
          final int? totalLogin,
      @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
          final int? totalpointsRedeemed,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
      @JsonKey(name: 'hospital_id', includeIfNull: false)
          final String? hospitalId,
      final HospitalModel? hospital,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          final dynamic coverUrl,
      @JsonKey(name: 'is_verified', includeIfNull: true)
          final bool? isVerified,
      @JsonKey(name: 'is_pregnant', includeIfNull: true)
          final bool? isPregnant,
      @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
          final bool? isPlanningPregnancy,
      @JsonKey(name: 'is_have_baby', includeIfNull: true)
          final bool? isHaveBaby,
      @JsonKey(name: 'last_biodata_view', includeIfNull: true)
          final String? lastBiodataView,
      @JsonKey(includeIfNull: true)
          final dynamic status,
      @JsonKey(includeIfNull: true)
          final List<Gamificationpoint>? gamificationpoints,
      @JsonKey(includeIfNull: true)
          final List<LastItemRedeemed>? redeemHistory,
      @JsonKey(includeIfNull: true)
          final LastItemRedeemed? lastItemRedeemed,
      @JsonKey(includeIfNull: true)
          final List<Checkin>? checkins,
      @JsonKey(includeIfNull: true)
          final List<Baby>? babies,
      @JsonKey(name: 'is_agree', includeIfNull: true)
          final bool? isAgree,
      @JsonKey(name: 'fcm_token', includeIfNull: true)
          final String? fcmToken}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true, name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_patient', includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get mobile => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_points_earned', includeIfNull: true)
  int? get totalpointsEarned => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_login', includeIfNull: true)
  int? get totalLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_points_redeemed', includeIfNull: true)
  int? get totalpointsRedeemed => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hospital_id', includeIfNull: false)
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  HospitalModel? get hospital => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  dynamic get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_pregnant', includeIfNull: true)
  bool? get isPregnant => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_planning_pregnancy', includeIfNull: true)
  bool? get isPlanningPregnancy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_have_baby', includeIfNull: true)
  bool? get isHaveBaby => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_biodata_view', includeIfNull: true)
  String? get lastBiodataView => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  dynamic get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<Gamificationpoint>? get gamificationpoints =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<LastItemRedeemed>? get redeemHistory =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  LastItemRedeemed? get lastItemRedeemed => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<Checkin>? get checkins => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<Baby>? get babies => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_agree', includeIfNull: true)
  bool? get isAgree => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'fcm_token', includeIfNull: true)
  String? get fcmToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Baby _$BabyFromJson(Map<String, dynamic> json) {
  return _Baby.fromJson(json);
}

/// @nodoc
mixin _$Baby {
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  bool? get isTwins => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get lastMenstruationDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  PregnancyAge? get pregnancyAge => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get estimatedBabyBorn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyCopyWith<Baby> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyCopyWith<$Res> {
  factory $BabyCopyWith(Baby value, $Res Function(Baby) then) =
      _$BabyCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? gender,
      @JsonKey(includeIfNull: true) String? dob,
      @JsonKey(includeIfNull: true) bool? isTwins,
      @JsonKey(includeIfNull: true) String? lastMenstruationDate,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(includeIfNull: true) PregnancyAge? pregnancyAge,
      @JsonKey(includeIfNull: true) String? estimatedBabyBorn});

  $PregnancyAgeCopyWith<$Res>? get pregnancyAge;
}

/// @nodoc
class _$BabyCopyWithImpl<$Res> implements $BabyCopyWith<$Res> {
  _$BabyCopyWithImpl(this._value, this._then);

  final Baby _value;
  // ignore: unused_field
  final $Res Function(Baby) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? isTwins = freezed,
    Object? lastMenstruationDate = freezed,
    Object? status = freezed,
    Object? pregnancyAge = freezed,
    Object? estimatedBabyBorn = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      isTwins: isTwins == freezed
          ? _value.isTwins
          : isTwins // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMenstruationDate: lastMenstruationDate == freezed
          ? _value.lastMenstruationDate
          : lastMenstruationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      pregnancyAge: pregnancyAge == freezed
          ? _value.pregnancyAge
          : pregnancyAge // ignore: cast_nullable_to_non_nullable
              as PregnancyAge?,
      estimatedBabyBorn: estimatedBabyBorn == freezed
          ? _value.estimatedBabyBorn
          : estimatedBabyBorn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PregnancyAgeCopyWith<$Res>? get pregnancyAge {
    if (_value.pregnancyAge == null) {
      return null;
    }

    return $PregnancyAgeCopyWith<$Res>(_value.pregnancyAge!, (value) {
      return _then(_value.copyWith(pregnancyAge: value));
    });
  }
}

/// @nodoc
abstract class _$$_BabyCopyWith<$Res> implements $BabyCopyWith<$Res> {
  factory _$$_BabyCopyWith(_$_Baby value, $Res Function(_$_Baby) then) =
      __$$_BabyCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? gender,
      @JsonKey(includeIfNull: true) String? dob,
      @JsonKey(includeIfNull: true) bool? isTwins,
      @JsonKey(includeIfNull: true) String? lastMenstruationDate,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(includeIfNull: true) PregnancyAge? pregnancyAge,
      @JsonKey(includeIfNull: true) String? estimatedBabyBorn});

  @override
  $PregnancyAgeCopyWith<$Res>? get pregnancyAge;
}

/// @nodoc
class __$$_BabyCopyWithImpl<$Res> extends _$BabyCopyWithImpl<$Res>
    implements _$$_BabyCopyWith<$Res> {
  __$$_BabyCopyWithImpl(_$_Baby _value, $Res Function(_$_Baby) _then)
      : super(_value, (v) => _then(v as _$_Baby));

  @override
  _$_Baby get _value => super._value as _$_Baby;

  @override
  $Res call({
    Object? name = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? isTwins = freezed,
    Object? lastMenstruationDate = freezed,
    Object? status = freezed,
    Object? pregnancyAge = freezed,
    Object? estimatedBabyBorn = freezed,
  }) {
    return _then(_$_Baby(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      isTwins: isTwins == freezed
          ? _value.isTwins
          : isTwins // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMenstruationDate: lastMenstruationDate == freezed
          ? _value.lastMenstruationDate
          : lastMenstruationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      pregnancyAge: pregnancyAge == freezed
          ? _value.pregnancyAge
          : pregnancyAge // ignore: cast_nullable_to_non_nullable
              as PregnancyAge?,
      estimatedBabyBorn: estimatedBabyBorn == freezed
          ? _value.estimatedBabyBorn
          : estimatedBabyBorn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Baby implements _Baby {
  const _$_Baby(
      {@JsonKey(includeIfNull: true) this.name,
      @JsonKey(includeIfNull: true) this.gender,
      @JsonKey(includeIfNull: true) this.dob,
      @JsonKey(includeIfNull: true) this.isTwins,
      @JsonKey(includeIfNull: true) this.lastMenstruationDate,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(includeIfNull: true) this.pregnancyAge,
      @JsonKey(includeIfNull: true) this.estimatedBabyBorn});

  factory _$_Baby.fromJson(Map<String, dynamic> json) => _$$_BabyFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(includeIfNull: true)
  final String? gender;
  @override
  @JsonKey(includeIfNull: true)
  final String? dob;
  @override
  @JsonKey(includeIfNull: true)
  final bool? isTwins;
  @override
  @JsonKey(includeIfNull: true)
  final String? lastMenstruationDate;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(includeIfNull: true)
  final PregnancyAge? pregnancyAge;
  @override
  @JsonKey(includeIfNull: true)
  final String? estimatedBabyBorn;

  @override
  String toString() {
    return 'Baby(name: $name, gender: $gender, dob: $dob, isTwins: $isTwins, lastMenstruationDate: $lastMenstruationDate, status: $status, pregnancyAge: $pregnancyAge, estimatedBabyBorn: $estimatedBabyBorn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Baby &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.isTwins, isTwins) &&
            const DeepCollectionEquality()
                .equals(other.lastMenstruationDate, lastMenstruationDate) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.pregnancyAge, pregnancyAge) &&
            const DeepCollectionEquality()
                .equals(other.estimatedBabyBorn, estimatedBabyBorn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(isTwins),
      const DeepCollectionEquality().hash(lastMenstruationDate),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(pregnancyAge),
      const DeepCollectionEquality().hash(estimatedBabyBorn));

  @JsonKey(ignore: true)
  @override
  _$$_BabyCopyWith<_$_Baby> get copyWith =>
      __$$_BabyCopyWithImpl<_$_Baby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BabyToJson(this);
  }
}

abstract class _Baby implements Baby {
  const factory _Baby(
      {@JsonKey(includeIfNull: true) final String? name,
      @JsonKey(includeIfNull: true) final String? gender,
      @JsonKey(includeIfNull: true) final String? dob,
      @JsonKey(includeIfNull: true) final bool? isTwins,
      @JsonKey(includeIfNull: true) final String? lastMenstruationDate,
      @JsonKey(includeIfNull: true) final String? status,
      @JsonKey(includeIfNull: true) final PregnancyAge? pregnancyAge,
      @JsonKey(includeIfNull: true) final String? estimatedBabyBorn}) = _$_Baby;

  factory _Baby.fromJson(Map<String, dynamic> json) = _$_Baby.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  bool? get isTwins => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get lastMenstruationDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  PregnancyAge? get pregnancyAge => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get estimatedBabyBorn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BabyCopyWith<_$_Baby> get copyWith => throw _privateConstructorUsedError;
}

PregnancyAge _$PregnancyAgeFromJson(Map<String, dynamic> json) {
  return _PregnancyAge.fromJson(json);
}

/// @nodoc
mixin _$PregnancyAge {
  @JsonKey(includeIfNull: true)
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get day => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get week => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PregnancyAgeCopyWith<PregnancyAge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PregnancyAgeCopyWith<$Res> {
  factory $PregnancyAgeCopyWith(
          PregnancyAge value, $Res Function(PregnancyAge) then) =
      _$PregnancyAgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) int? year,
      @JsonKey(includeIfNull: true) int? month,
      @JsonKey(includeIfNull: true) int? day,
      @JsonKey(includeIfNull: true) int? week});
}

/// @nodoc
class _$PregnancyAgeCopyWithImpl<$Res> implements $PregnancyAgeCopyWith<$Res> {
  _$PregnancyAgeCopyWithImpl(this._value, this._then);

  final PregnancyAge _value;
  // ignore: unused_field
  final $Res Function(PregnancyAge) _then;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? week = freezed,
  }) {
    return _then(_value.copyWith(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_PregnancyAgeCopyWith<$Res>
    implements $PregnancyAgeCopyWith<$Res> {
  factory _$$_PregnancyAgeCopyWith(
          _$_PregnancyAge value, $Res Function(_$_PregnancyAge) then) =
      __$$_PregnancyAgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) int? year,
      @JsonKey(includeIfNull: true) int? month,
      @JsonKey(includeIfNull: true) int? day,
      @JsonKey(includeIfNull: true) int? week});
}

/// @nodoc
class __$$_PregnancyAgeCopyWithImpl<$Res>
    extends _$PregnancyAgeCopyWithImpl<$Res>
    implements _$$_PregnancyAgeCopyWith<$Res> {
  __$$_PregnancyAgeCopyWithImpl(
      _$_PregnancyAge _value, $Res Function(_$_PregnancyAge) _then)
      : super(_value, (v) => _then(v as _$_PregnancyAge));

  @override
  _$_PregnancyAge get _value => super._value as _$_PregnancyAge;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? week = freezed,
  }) {
    return _then(_$_PregnancyAge(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PregnancyAge implements _PregnancyAge {
  const _$_PregnancyAge(
      {@JsonKey(includeIfNull: true) this.year,
      @JsonKey(includeIfNull: true) this.month,
      @JsonKey(includeIfNull: true) this.day,
      @JsonKey(includeIfNull: true) this.week});

  factory _$_PregnancyAge.fromJson(Map<String, dynamic> json) =>
      _$$_PregnancyAgeFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final int? year;
  @override
  @JsonKey(includeIfNull: true)
  final int? month;
  @override
  @JsonKey(includeIfNull: true)
  final int? day;
  @override
  @JsonKey(includeIfNull: true)
  final int? week;

  @override
  String toString() {
    return 'PregnancyAge(year: $year, month: $month, day: $day, week: $week)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PregnancyAge &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.week, week));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(week));

  @JsonKey(ignore: true)
  @override
  _$$_PregnancyAgeCopyWith<_$_PregnancyAge> get copyWith =>
      __$$_PregnancyAgeCopyWithImpl<_$_PregnancyAge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PregnancyAgeToJson(this);
  }
}

abstract class _PregnancyAge implements PregnancyAge {
  const factory _PregnancyAge(
      {@JsonKey(includeIfNull: true) final int? year,
      @JsonKey(includeIfNull: true) final int? month,
      @JsonKey(includeIfNull: true) final int? day,
      @JsonKey(includeIfNull: true) final int? week}) = _$_PregnancyAge;

  factory _PregnancyAge.fromJson(Map<String, dynamic> json) =
      _$_PregnancyAge.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  int? get year => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get month => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get day => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get week => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PregnancyAgeCopyWith<_$_PregnancyAge> get copyWith =>
      throw _privateConstructorUsedError;
}

Checkin _$CheckinFromJson(Map<String, dynamic> json) {
  return _Checkin.fromJson(json);
}

/// @nodoc
mixin _$Checkin {
  @JsonKey(includeIfNull: true)
  int? get day => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get pointsEarned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckinCopyWith<Checkin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckinCopyWith<$Res> {
  factory $CheckinCopyWith(Checkin value, $Res Function(Checkin) then) =
      _$CheckinCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) int? day,
      @JsonKey(includeIfNull: true) String? date,
      @JsonKey(includeIfNull: true) int? pointsEarned});
}

/// @nodoc
class _$CheckinCopyWithImpl<$Res> implements $CheckinCopyWith<$Res> {
  _$CheckinCopyWithImpl(this._value, this._then);

  final Checkin _value;
  // ignore: unused_field
  final $Res Function(Checkin) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? date = freezed,
    Object? pointsEarned = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsEarned: pointsEarned == freezed
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckinCopyWith<$Res> implements $CheckinCopyWith<$Res> {
  factory _$$_CheckinCopyWith(
          _$_Checkin value, $Res Function(_$_Checkin) then) =
      __$$_CheckinCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) int? day,
      @JsonKey(includeIfNull: true) String? date,
      @JsonKey(includeIfNull: true) int? pointsEarned});
}

/// @nodoc
class __$$_CheckinCopyWithImpl<$Res> extends _$CheckinCopyWithImpl<$Res>
    implements _$$_CheckinCopyWith<$Res> {
  __$$_CheckinCopyWithImpl(_$_Checkin _value, $Res Function(_$_Checkin) _then)
      : super(_value, (v) => _then(v as _$_Checkin));

  @override
  _$_Checkin get _value => super._value as _$_Checkin;

  @override
  $Res call({
    Object? day = freezed,
    Object? date = freezed,
    Object? pointsEarned = freezed,
  }) {
    return _then(_$_Checkin(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsEarned: pointsEarned == freezed
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Checkin implements _Checkin {
  const _$_Checkin(
      {@JsonKey(includeIfNull: true) this.day,
      @JsonKey(includeIfNull: true) this.date,
      @JsonKey(includeIfNull: true) this.pointsEarned});

  factory _$_Checkin.fromJson(Map<String, dynamic> json) =>
      _$$_CheckinFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final int? day;
  @override
  @JsonKey(includeIfNull: true)
  final String? date;
  @override
  @JsonKey(includeIfNull: true)
  final int? pointsEarned;

  @override
  String toString() {
    return 'Checkin(day: $day, date: $date, pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Checkin &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.pointsEarned, pointsEarned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(pointsEarned));

  @JsonKey(ignore: true)
  @override
  _$$_CheckinCopyWith<_$_Checkin> get copyWith =>
      __$$_CheckinCopyWithImpl<_$_Checkin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckinToJson(this);
  }
}

abstract class _Checkin implements Checkin {
  const factory _Checkin(
      {@JsonKey(includeIfNull: true) final int? day,
      @JsonKey(includeIfNull: true) final String? date,
      @JsonKey(includeIfNull: true) final int? pointsEarned}) = _$_Checkin;

  factory _Checkin.fromJson(Map<String, dynamic> json) = _$_Checkin.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  int? get day => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get pointsEarned => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CheckinCopyWith<_$_Checkin> get copyWith =>
      throw _privateConstructorUsedError;
}

Gamificationpoint _$GamificationpointFromJson(Map<String, dynamic> json) {
  return _Gamificationpoint.fromJson(json);
}

/// @nodoc
mixin _$Gamificationpoint {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get group => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamificationpointCopyWith<Gamificationpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamificationpointCopyWith<$Res> {
  factory $GamificationpointCopyWith(
          Gamificationpoint value, $Res Function(Gamificationpoint) then) =
      _$GamificationpointCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? group,
      @JsonKey(includeIfNull: true) String? key,
      @JsonKey(includeIfNull: true) String? value});
}

/// @nodoc
class _$GamificationpointCopyWithImpl<$Res>
    implements $GamificationpointCopyWith<$Res> {
  _$GamificationpointCopyWithImpl(this._value, this._then);

  final Gamificationpoint _value;
  // ignore: unused_field
  final $Res Function(Gamificationpoint) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GamificationpointCopyWith<$Res>
    implements $GamificationpointCopyWith<$Res> {
  factory _$$_GamificationpointCopyWith(_$_Gamificationpoint value,
          $Res Function(_$_Gamificationpoint) then) =
      __$$_GamificationpointCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? group,
      @JsonKey(includeIfNull: true) String? key,
      @JsonKey(includeIfNull: true) String? value});
}

/// @nodoc
class __$$_GamificationpointCopyWithImpl<$Res>
    extends _$GamificationpointCopyWithImpl<$Res>
    implements _$$_GamificationpointCopyWith<$Res> {
  __$$_GamificationpointCopyWithImpl(
      _$_Gamificationpoint _value, $Res Function(_$_Gamificationpoint) _then)
      : super(_value, (v) => _then(v as _$_Gamificationpoint));

  @override
  _$_Gamificationpoint get _value => super._value as _$_Gamificationpoint;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_Gamificationpoint(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gamificationpoint implements _Gamificationpoint {
  const _$_Gamificationpoint(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(includeIfNull: true) this.group,
      @JsonKey(includeIfNull: true) this.key,
      @JsonKey(includeIfNull: true) this.value});

  factory _$_Gamificationpoint.fromJson(Map<String, dynamic> json) =>
      _$$_GamificationpointFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(includeIfNull: true)
  final String? group;
  @override
  @JsonKey(includeIfNull: true)
  final String? key;
  @override
  @JsonKey(includeIfNull: true)
  final String? value;

  @override
  String toString() {
    return 'Gamificationpoint(id: $id, group: $group, key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gamificationpoint &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_GamificationpointCopyWith<_$_Gamificationpoint> get copyWith =>
      __$$_GamificationpointCopyWithImpl<_$_Gamificationpoint>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamificationpointToJson(this);
  }
}

abstract class _Gamificationpoint implements Gamificationpoint {
  const factory _Gamificationpoint(
          {@JsonKey(includeIfNull: true) final String? id,
          @JsonKey(includeIfNull: true) final String? group,
          @JsonKey(includeIfNull: true) final String? key,
          @JsonKey(includeIfNull: true) final String? value}) =
      _$_Gamificationpoint;

  factory _Gamificationpoint.fromJson(Map<String, dynamic> json) =
      _$_Gamificationpoint.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get group => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get key => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GamificationpointCopyWith<_$_Gamificationpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

LastItemRedeemed _$LastItemRedeemedFromJson(Map<String, dynamic> json) {
  return _LastItemRedeemed.fromJson(json);
}

/// @nodoc
mixin _$LastItemRedeemed {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  Item? get item => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get pointsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastItemRedeemedCopyWith<LastItemRedeemed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastItemRedeemedCopyWith<$Res> {
  factory $LastItemRedeemedCopyWith(
          LastItemRedeemed value, $Res Function(LastItemRedeemed) then) =
      _$LastItemRedeemedCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) Item? item,
      @JsonKey(includeIfNull: true) int? pointsRedeemed,
      @JsonKey(includeIfNull: true) String? status});

  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class _$LastItemRedeemedCopyWithImpl<$Res>
    implements $LastItemRedeemedCopyWith<$Res> {
  _$LastItemRedeemedCopyWithImpl(this._value, this._then);

  final LastItemRedeemed _value;
  // ignore: unused_field
  final $Res Function(LastItemRedeemed) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? item = freezed,
    Object? pointsRedeemed = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      pointsRedeemed: pointsRedeemed == freezed
          ? _value.pointsRedeemed
          : pointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ItemCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$$_LastItemRedeemedCopyWith<$Res>
    implements $LastItemRedeemedCopyWith<$Res> {
  factory _$$_LastItemRedeemedCopyWith(
          _$_LastItemRedeemed value, $Res Function(_$_LastItemRedeemed) then) =
      __$$_LastItemRedeemedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) Item? item,
      @JsonKey(includeIfNull: true) int? pointsRedeemed,
      @JsonKey(includeIfNull: true) String? status});

  @override
  $ItemCopyWith<$Res>? get item;
}

/// @nodoc
class __$$_LastItemRedeemedCopyWithImpl<$Res>
    extends _$LastItemRedeemedCopyWithImpl<$Res>
    implements _$$_LastItemRedeemedCopyWith<$Res> {
  __$$_LastItemRedeemedCopyWithImpl(
      _$_LastItemRedeemed _value, $Res Function(_$_LastItemRedeemed) _then)
      : super(_value, (v) => _then(v as _$_LastItemRedeemed));

  @override
  _$_LastItemRedeemed get _value => super._value as _$_LastItemRedeemed;

  @override
  $Res call({
    Object? id = freezed,
    Object? item = freezed,
    Object? pointsRedeemed = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_LastItemRedeemed(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item?,
      pointsRedeemed: pointsRedeemed == freezed
          ? _value.pointsRedeemed
          : pointsRedeemed // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastItemRedeemed implements _LastItemRedeemed {
  const _$_LastItemRedeemed(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(includeIfNull: true) this.item,
      @JsonKey(includeIfNull: true) this.pointsRedeemed,
      @JsonKey(includeIfNull: true) this.status});

  factory _$_LastItemRedeemed.fromJson(Map<String, dynamic> json) =>
      _$$_LastItemRedeemedFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(includeIfNull: true)
  final Item? item;
  @override
  @JsonKey(includeIfNull: true)
  final int? pointsRedeemed;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;

  @override
  String toString() {
    return 'LastItemRedeemed(id: $id, item: $item, pointsRedeemed: $pointsRedeemed, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastItemRedeemed &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.pointsRedeemed, pointsRedeemed) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(pointsRedeemed),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_LastItemRedeemedCopyWith<_$_LastItemRedeemed> get copyWith =>
      __$$_LastItemRedeemedCopyWithImpl<_$_LastItemRedeemed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastItemRedeemedToJson(this);
  }
}

abstract class _LastItemRedeemed implements LastItemRedeemed {
  const factory _LastItemRedeemed(
          {@JsonKey(includeIfNull: true) final String? id,
          @JsonKey(includeIfNull: true) final Item? item,
          @JsonKey(includeIfNull: true) final int? pointsRedeemed,
          @JsonKey(includeIfNull: true) final String? status}) =
      _$_LastItemRedeemed;

  factory _LastItemRedeemed.fromJson(Map<String, dynamic> json) =
      _$_LastItemRedeemed.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  Item? get item => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get pointsRedeemed => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LastItemRedeemedCopyWith<_$_LastItemRedeemed> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get pointsRequired => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  dynamic get status => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(includeIfNull: true) int? pointsRequired,
      @JsonKey(includeIfNull: true) dynamic status,
      String? imageUrl});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pointsRequired = freezed,
    Object? status = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsRequired: pointsRequired == freezed
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(includeIfNull: true) int? pointsRequired,
      @JsonKey(includeIfNull: true) dynamic status,
      String? imageUrl});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? pointsRequired = freezed,
    Object? status = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Item(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsRequired: pointsRequired == freezed
          ? _value.pointsRequired
          : pointsRequired // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {this.id,
      @JsonKey(includeIfNull: true) this.name,
      @JsonKey(includeIfNull: true) this.description,
      @JsonKey(includeIfNull: true) this.pointsRequired,
      @JsonKey(includeIfNull: true) this.status,
      this.imageUrl});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(includeIfNull: true)
  final String? description;
  @override
  @JsonKey(includeIfNull: true)
  final int? pointsRequired;
  @override
  @JsonKey(includeIfNull: true)
  final dynamic status;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, description: $description, pointsRequired: $pointsRequired, status: $status, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.pointsRequired, pointsRequired) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(pointsRequired),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final String? id,
      @JsonKey(includeIfNull: true) final String? name,
      @JsonKey(includeIfNull: true) final String? description,
      @JsonKey(includeIfNull: true) final int? pointsRequired,
      @JsonKey(includeIfNull: true) final dynamic status,
      final String? imageUrl}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  int? get pointsRequired => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  dynamic get status => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
