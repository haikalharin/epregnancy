// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserVisitModel _$UserVisitModelFromJson(Map<String, dynamic> json) {
  return _UserVisitModel.fromJson(json);
}

/// @nodoc
mixin _$UserVisitModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user', includeIfNull: true)
  UserInfoVisit? get user => throw _privateConstructorUsedError;
  String? get midwifeId => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get nextVisitDate => throw _privateConstructorUsedError;
  String? get nextVisitTime => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserVisitModelCopyWith<UserVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVisitModelCopyWith<$Res> {
  factory $UserVisitModelCopyWith(
          UserVisitModel value, $Res Function(UserVisitModel) then) =
      _$UserVisitModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(name: 'user', includeIfNull: true) UserInfoVisit? user,
      String? midwifeId,
      DateTime? date,
      String? status,
      String? nextVisitDate,
      String? nextVisitTime,
      String? createdDate,
      String? modifiedDate});

  $UserInfoVisitCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserVisitModelCopyWithImpl<$Res>
    implements $UserVisitModelCopyWith<$Res> {
  _$UserVisitModelCopyWithImpl(this._value, this._then);

  final UserVisitModel _value;
  // ignore: unused_field
  final $Res Function(UserVisitModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? midwifeId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? nextVisitDate = freezed,
    Object? nextVisitTime = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoVisit?,
      midwifeId: midwifeId == freezed
          ? _value.midwifeId
          : midwifeId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      nextVisitDate: nextVisitDate == freezed
          ? _value.nextVisitDate
          : nextVisitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      nextVisitTime: nextVisitTime == freezed
          ? _value.nextVisitTime
          : nextVisitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserInfoVisitCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserInfoVisitCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserVisitModelCopyWith<$Res>
    implements $UserVisitModelCopyWith<$Res> {
  factory _$$_UserVisitModelCopyWith(
          _$_UserVisitModel value, $Res Function(_$_UserVisitModel) then) =
      __$$_UserVisitModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(name: 'user', includeIfNull: true) UserInfoVisit? user,
      String? midwifeId,
      DateTime? date,
      String? status,
      String? nextVisitDate,
      String? nextVisitTime,
      String? createdDate,
      String? modifiedDate});

  @override
  $UserInfoVisitCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_UserVisitModelCopyWithImpl<$Res>
    extends _$UserVisitModelCopyWithImpl<$Res>
    implements _$$_UserVisitModelCopyWith<$Res> {
  __$$_UserVisitModelCopyWithImpl(
      _$_UserVisitModel _value, $Res Function(_$_UserVisitModel) _then)
      : super(_value, (v) => _then(v as _$_UserVisitModel));

  @override
  _$_UserVisitModel get _value => super._value as _$_UserVisitModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? midwifeId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? nextVisitDate = freezed,
    Object? nextVisitTime = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_UserVisitModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoVisit?,
      midwifeId: midwifeId == freezed
          ? _value.midwifeId
          : midwifeId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      nextVisitDate: nextVisitDate == freezed
          ? _value.nextVisitDate
          : nextVisitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      nextVisitTime: nextVisitTime == freezed
          ? _value.nextVisitTime
          : nextVisitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserVisitModel implements _UserVisitModel {
  const _$_UserVisitModel(
      {this.id,
      @JsonKey(name: 'user', includeIfNull: true) this.user,
      this.midwifeId,
      this.date,
      this.status,
      this.nextVisitDate,
      this.nextVisitTime,
      this.createdDate,
      this.modifiedDate});

  factory _$_UserVisitModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserVisitModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user', includeIfNull: true)
  final UserInfoVisit? user;
  @override
  final String? midwifeId;
  @override
  final DateTime? date;
  @override
  final String? status;
  @override
  final String? nextVisitDate;
  @override
  final String? nextVisitTime;
  @override
  final String? createdDate;
  @override
  final String? modifiedDate;

  @override
  String toString() {
    return 'UserVisitModel(id: $id, user: $user, midwifeId: $midwifeId, date: $date, status: $status, nextVisitDate: $nextVisitDate, nextVisitTime: $nextVisitTime, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserVisitModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.midwifeId, midwifeId) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.nextVisitDate, nextVisitDate) &&
            const DeepCollectionEquality()
                .equals(other.nextVisitTime, nextVisitTime) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(midwifeId),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(nextVisitDate),
      const DeepCollectionEquality().hash(nextVisitTime),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedDate));

  @JsonKey(ignore: true)
  @override
  _$$_UserVisitModelCopyWith<_$_UserVisitModel> get copyWith =>
      __$$_UserVisitModelCopyWithImpl<_$_UserVisitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserVisitModelToJson(this);
  }
}

abstract class _UserVisitModel implements UserVisitModel {
  const factory _UserVisitModel(
      {final String? id,
      @JsonKey(name: 'user', includeIfNull: true) final UserInfoVisit? user,
      final String? midwifeId,
      final DateTime? date,
      final String? status,
      final String? nextVisitDate,
      final String? nextVisitTime,
      final String? createdDate,
      final String? modifiedDate}) = _$_UserVisitModel;

  factory _UserVisitModel.fromJson(Map<String, dynamic> json) =
      _$_UserVisitModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user', includeIfNull: true)
  UserInfoVisit? get user => throw _privateConstructorUsedError;
  @override
  String? get midwifeId => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get nextVisitDate => throw _privateConstructorUsedError;
  @override
  String? get nextVisitTime => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  String? get modifiedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserVisitModelCopyWith<_$_UserVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoVisit _$UserInfoVisitFromJson(Map<String, dynamic> json) {
  return _UserInfoVisit.fromJson(json);
}

/// @nodoc
mixin _$UserInfoVisit {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool? get isHaveBaby => throw _privateConstructorUsedError;
  bool? get isPregnant => throw _privateConstructorUsedError;
  int? get pregnancyWeek => throw _privateConstructorUsedError;
  int? get totalVisit => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get lastVisit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoVisitCopyWith<UserInfoVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoVisitCopyWith<$Res> {
  factory $UserInfoVisitCopyWith(
          UserInfoVisit value, $Res Function(UserInfoVisit) then) =
      _$UserInfoVisitCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? username,
      String? imageUrl,
      bool? isHaveBaby,
      bool? isPregnant,
      int? pregnancyWeek,
      int? totalVisit,
      String? createdDate,
      String? lastVisit});
}

/// @nodoc
class _$UserInfoVisitCopyWithImpl<$Res>
    implements $UserInfoVisitCopyWith<$Res> {
  _$UserInfoVisitCopyWithImpl(this._value, this._then);

  final UserInfoVisit _value;
  // ignore: unused_field
  final $Res Function(UserInfoVisit) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
    Object? isHaveBaby = freezed,
    Object? isPregnant = freezed,
    Object? pregnancyWeek = freezed,
    Object? totalVisit = freezed,
    Object? createdDate = freezed,
    Object? lastVisit = freezed,
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
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isHaveBaby: isHaveBaby == freezed
          ? _value.isHaveBaby
          : isHaveBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPregnant: isPregnant == freezed
          ? _value.isPregnant
          : isPregnant // ignore: cast_nullable_to_non_nullable
              as bool?,
      pregnancyWeek: pregnancyWeek == freezed
          ? _value.pregnancyWeek
          : pregnancyWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVisit: totalVisit == freezed
          ? _value.totalVisit
          : totalVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastVisit: lastVisit == freezed
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserInfoVisitCopyWith<$Res>
    implements $UserInfoVisitCopyWith<$Res> {
  factory _$$_UserInfoVisitCopyWith(
          _$_UserInfoVisit value, $Res Function(_$_UserInfoVisit) then) =
      __$$_UserInfoVisitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? username,
      String? imageUrl,
      bool? isHaveBaby,
      bool? isPregnant,
      int? pregnancyWeek,
      int? totalVisit,
      String? createdDate,
      String? lastVisit});
}

/// @nodoc
class __$$_UserInfoVisitCopyWithImpl<$Res>
    extends _$UserInfoVisitCopyWithImpl<$Res>
    implements _$$_UserInfoVisitCopyWith<$Res> {
  __$$_UserInfoVisitCopyWithImpl(
      _$_UserInfoVisit _value, $Res Function(_$_UserInfoVisit) _then)
      : super(_value, (v) => _then(v as _$_UserInfoVisit));

  @override
  _$_UserInfoVisit get _value => super._value as _$_UserInfoVisit;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
    Object? isHaveBaby = freezed,
    Object? isPregnant = freezed,
    Object? pregnancyWeek = freezed,
    Object? totalVisit = freezed,
    Object? createdDate = freezed,
    Object? lastVisit = freezed,
  }) {
    return _then(_$_UserInfoVisit(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isHaveBaby: isHaveBaby == freezed
          ? _value.isHaveBaby
          : isHaveBaby // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPregnant: isPregnant == freezed
          ? _value.isPregnant
          : isPregnant // ignore: cast_nullable_to_non_nullable
              as bool?,
      pregnancyWeek: pregnancyWeek == freezed
          ? _value.pregnancyWeek
          : pregnancyWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVisit: totalVisit == freezed
          ? _value.totalVisit
          : totalVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastVisit: lastVisit == freezed
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserInfoVisit implements _UserInfoVisit {
  const _$_UserInfoVisit(
      {this.id,
      this.name,
      this.username,
      this.imageUrl,
      this.isHaveBaby,
      this.isPregnant,
      this.pregnancyWeek,
      this.totalVisit,
      this.createdDate,
      this.lastVisit});

  factory _$_UserInfoVisit.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoVisitFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? imageUrl;
  @override
  final bool? isHaveBaby;
  @override
  final bool? isPregnant;
  @override
  final int? pregnancyWeek;
  @override
  final int? totalVisit;
  @override
  final String? createdDate;
  @override
  final String? lastVisit;

  @override
  String toString() {
    return 'UserInfoVisit(id: $id, name: $name, username: $username, imageUrl: $imageUrl, isHaveBaby: $isHaveBaby, isPregnant: $isPregnant, pregnancyWeek: $pregnancyWeek, totalVisit: $totalVisit, createdDate: $createdDate, lastVisit: $lastVisit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoVisit &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.isHaveBaby, isHaveBaby) &&
            const DeepCollectionEquality()
                .equals(other.isPregnant, isPregnant) &&
            const DeepCollectionEquality()
                .equals(other.pregnancyWeek, pregnancyWeek) &&
            const DeepCollectionEquality()
                .equals(other.totalVisit, totalVisit) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality().equals(other.lastVisit, lastVisit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(isHaveBaby),
      const DeepCollectionEquality().hash(isPregnant),
      const DeepCollectionEquality().hash(pregnancyWeek),
      const DeepCollectionEquality().hash(totalVisit),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(lastVisit));

  @JsonKey(ignore: true)
  @override
  _$$_UserInfoVisitCopyWith<_$_UserInfoVisit> get copyWith =>
      __$$_UserInfoVisitCopyWithImpl<_$_UserInfoVisit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoVisitToJson(this);
  }
}

abstract class _UserInfoVisit implements UserInfoVisit {
  const factory _UserInfoVisit(
      {final String? id,
      final String? name,
      final String? username,
      final String? imageUrl,
      final bool? isHaveBaby,
      final bool? isPregnant,
      final int? pregnancyWeek,
      final int? totalVisit,
      final String? createdDate,
      final String? lastVisit}) = _$_UserInfoVisit;

  factory _UserInfoVisit.fromJson(Map<String, dynamic> json) =
      _$_UserInfoVisit.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  bool? get isHaveBaby => throw _privateConstructorUsedError;
  @override
  bool? get isPregnant => throw _privateConstructorUsedError;
  @override
  int? get pregnancyWeek => throw _privateConstructorUsedError;
  @override
  int? get totalVisit => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  String? get lastVisit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoVisitCopyWith<_$_UserInfoVisit> get copyWith =>
      throw _privateConstructorUsedError;
}
