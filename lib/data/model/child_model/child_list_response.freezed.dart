// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'child_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChildListResponse _$ChildListResponseFromJson(Map<String, dynamic> json) {
  return _ChildListResponse.fromJson(json);
}

/// @nodoc
mixin _$ChildListResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  Age? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildListResponseCopyWith<ChildListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildListResponseCopyWith<$Res> {
  factory $ChildListResponseCopyWith(
          ChildListResponse value, $Res Function(ChildListResponse) then) =
      _$ChildListResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? gender,
      String? dob,
      Age? age});

  $AgeCopyWith<$Res>? get age;
}

/// @nodoc
class _$ChildListResponseCopyWithImpl<$Res>
    implements $ChildListResponseCopyWith<$Res> {
  _$ChildListResponseCopyWithImpl(this._value, this._then);

  final ChildListResponse _value;
  // ignore: unused_field
  final $Res Function(ChildListResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as Age?,
    ));
  }

  @override
  $AgeCopyWith<$Res>? get age {
    if (_value.age == null) {
      return null;
    }

    return $AgeCopyWith<$Res>(_value.age!, (value) {
      return _then(_value.copyWith(age: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChildListResponseCopyWith<$Res>
    implements $ChildListResponseCopyWith<$Res> {
  factory _$$_ChildListResponseCopyWith(_$_ChildListResponse value,
          $Res Function(_$_ChildListResponse) then) =
      __$$_ChildListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? userId,
      String? name,
      String? gender,
      String? dob,
      Age? age});

  @override
  $AgeCopyWith<$Res>? get age;
}

/// @nodoc
class __$$_ChildListResponseCopyWithImpl<$Res>
    extends _$ChildListResponseCopyWithImpl<$Res>
    implements _$$_ChildListResponseCopyWith<$Res> {
  __$$_ChildListResponseCopyWithImpl(
      _$_ChildListResponse _value, $Res Function(_$_ChildListResponse) _then)
      : super(_value, (v) => _then(v as _$_ChildListResponse));

  @override
  _$_ChildListResponse get _value => super._value as _$_ChildListResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? age = freezed,
  }) {
    return _then(_$_ChildListResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as Age?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ChildListResponse
    with DiagnosticableTreeMixin
    implements _ChildListResponse {
  const _$_ChildListResponse(
      {this.id, this.userId, this.name, this.gender, this.dob, this.age});

  factory _$_ChildListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChildListResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? gender;
  @override
  final String? dob;
  @override
  final Age? age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChildListResponse(id: $id, userId: $userId, name: $name, gender: $gender, dob: $dob, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChildListResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('dob', dob))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChildListResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.age, age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(age));

  @JsonKey(ignore: true)
  @override
  _$$_ChildListResponseCopyWith<_$_ChildListResponse> get copyWith =>
      __$$_ChildListResponseCopyWithImpl<_$_ChildListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChildListResponseToJson(this);
  }
}

abstract class _ChildListResponse implements ChildListResponse {
  const factory _ChildListResponse(
      {final String? id,
      final String? userId,
      final String? name,
      final String? gender,
      final String? dob,
      final Age? age}) = _$_ChildListResponse;

  factory _ChildListResponse.fromJson(Map<String, dynamic> json) =
      _$_ChildListResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  String? get dob => throw _privateConstructorUsedError;
  @override
  Age? get age => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChildListResponseCopyWith<_$_ChildListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Age _$AgeFromJson(Map<String, dynamic> json) {
  return _Age.fromJson(json);
}

/// @nodoc
mixin _$Age {
  int? get year => throw _privateConstructorUsedError;
  int? get month => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  int? get monthOnly => throw _privateConstructorUsedError;
  int? get dayOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgeCopyWith<Age> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeCopyWith<$Res> {
  factory $AgeCopyWith(Age value, $Res Function(Age) then) =
      _$AgeCopyWithImpl<$Res>;
  $Res call({int? year, int? month, int? day, int? monthOnly, int? dayOnly});
}

/// @nodoc
class _$AgeCopyWithImpl<$Res> implements $AgeCopyWith<$Res> {
  _$AgeCopyWithImpl(this._value, this._then);

  final Age _value;
  // ignore: unused_field
  final $Res Function(Age) _then;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? monthOnly = freezed,
    Object? dayOnly = freezed,
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
      monthOnly: monthOnly == freezed
          ? _value.monthOnly
          : monthOnly // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOnly: dayOnly == freezed
          ? _value.dayOnly
          : dayOnly // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_AgeCopyWith<$Res> implements $AgeCopyWith<$Res> {
  factory _$$_AgeCopyWith(_$_Age value, $Res Function(_$_Age) then) =
      __$$_AgeCopyWithImpl<$Res>;
  @override
  $Res call({int? year, int? month, int? day, int? monthOnly, int? dayOnly});
}

/// @nodoc
class __$$_AgeCopyWithImpl<$Res> extends _$AgeCopyWithImpl<$Res>
    implements _$$_AgeCopyWith<$Res> {
  __$$_AgeCopyWithImpl(_$_Age _value, $Res Function(_$_Age) _then)
      : super(_value, (v) => _then(v as _$_Age));

  @override
  _$_Age get _value => super._value as _$_Age;

  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
    Object? monthOnly = freezed,
    Object? dayOnly = freezed,
  }) {
    return _then(_$_Age(
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
      monthOnly: monthOnly == freezed
          ? _value.monthOnly
          : monthOnly // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOnly: dayOnly == freezed
          ? _value.dayOnly
          : dayOnly // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Age with DiagnosticableTreeMixin implements _Age {
  const _$_Age({this.year, this.month, this.day, this.monthOnly, this.dayOnly});

  factory _$_Age.fromJson(Map<String, dynamic> json) => _$$_AgeFromJson(json);

  @override
  final int? year;
  @override
  final int? month;
  @override
  final int? day;
  @override
  final int? monthOnly;
  @override
  final int? dayOnly;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Age(year: $year, month: $month, day: $day, monthOnly: $monthOnly, dayOnly: $dayOnly)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Age'))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('month', month))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('monthOnly', monthOnly))
      ..add(DiagnosticsProperty('dayOnly', dayOnly));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Age &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.monthOnly, monthOnly) &&
            const DeepCollectionEquality().equals(other.dayOnly, dayOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(monthOnly),
      const DeepCollectionEquality().hash(dayOnly));

  @JsonKey(ignore: true)
  @override
  _$$_AgeCopyWith<_$_Age> get copyWith =>
      __$$_AgeCopyWithImpl<_$_Age>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgeToJson(this);
  }
}

abstract class _Age implements Age {
  const factory _Age(
      {final int? year,
      final int? month,
      final int? day,
      final int? monthOnly,
      final int? dayOnly}) = _$_Age;

  factory _Age.fromJson(Map<String, dynamic> json) = _$_Age.fromJson;

  @override
  int? get year => throw _privateConstructorUsedError;
  @override
  int? get month => throw _privateConstructorUsedError;
  @override
  int? get day => throw _privateConstructorUsedError;
  @override
  int? get monthOnly => throw _privateConstructorUsedError;
  @override
  int? get dayOnly => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AgeCopyWith<_$_Age> get copyWith => throw _privateConstructorUsedError;
}
