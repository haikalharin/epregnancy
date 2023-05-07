// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_child_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyChildDashboard _$MyChildDashboardFromJson(Map<String, dynamic> json) {
  return _MyChildDashboard.fromJson(json);
}

/// @nodoc
mixin _$MyChildDashboard {
  Child? get child => throw _privateConstructorUsedError;
  Growth? get growth => throw _privateConstructorUsedError;
  GrowthStatus? get growthStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyChildDashboardCopyWith<MyChildDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyChildDashboardCopyWith<$Res> {
  factory $MyChildDashboardCopyWith(
          MyChildDashboard value, $Res Function(MyChildDashboard) then) =
      _$MyChildDashboardCopyWithImpl<$Res>;
  $Res call({Child? child, Growth? growth, GrowthStatus? growthStatus});

  $ChildCopyWith<$Res>? get child;
  $GrowthCopyWith<$Res>? get growth;
  $GrowthStatusCopyWith<$Res>? get growthStatus;
}

/// @nodoc
class _$MyChildDashboardCopyWithImpl<$Res>
    implements $MyChildDashboardCopyWith<$Res> {
  _$MyChildDashboardCopyWithImpl(this._value, this._then);

  final MyChildDashboard _value;
  // ignore: unused_field
  final $Res Function(MyChildDashboard) _then;

  @override
  $Res call({
    Object? child = freezed,
    Object? growth = freezed,
    Object? growthStatus = freezed,
  }) {
    return _then(_value.copyWith(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Child?,
      growth: growth == freezed
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as Growth?,
      growthStatus: growthStatus == freezed
          ? _value.growthStatus
          : growthStatus // ignore: cast_nullable_to_non_nullable
              as GrowthStatus?,
    ));
  }

  @override
  $ChildCopyWith<$Res>? get child {
    if (_value.child == null) {
      return null;
    }

    return $ChildCopyWith<$Res>(_value.child!, (value) {
      return _then(_value.copyWith(child: value));
    });
  }

  @override
  $GrowthCopyWith<$Res>? get growth {
    if (_value.growth == null) {
      return null;
    }

    return $GrowthCopyWith<$Res>(_value.growth!, (value) {
      return _then(_value.copyWith(growth: value));
    });
  }

  @override
  $GrowthStatusCopyWith<$Res>? get growthStatus {
    if (_value.growthStatus == null) {
      return null;
    }

    return $GrowthStatusCopyWith<$Res>(_value.growthStatus!, (value) {
      return _then(_value.copyWith(growthStatus: value));
    });
  }
}

/// @nodoc
abstract class _$$_MyChildDashboardCopyWith<$Res>
    implements $MyChildDashboardCopyWith<$Res> {
  factory _$$_MyChildDashboardCopyWith(
          _$_MyChildDashboard value, $Res Function(_$_MyChildDashboard) then) =
      __$$_MyChildDashboardCopyWithImpl<$Res>;
  @override
  $Res call({Child? child, Growth? growth, GrowthStatus? growthStatus});

  @override
  $ChildCopyWith<$Res>? get child;
  @override
  $GrowthCopyWith<$Res>? get growth;
  @override
  $GrowthStatusCopyWith<$Res>? get growthStatus;
}

/// @nodoc
class __$$_MyChildDashboardCopyWithImpl<$Res>
    extends _$MyChildDashboardCopyWithImpl<$Res>
    implements _$$_MyChildDashboardCopyWith<$Res> {
  __$$_MyChildDashboardCopyWithImpl(
      _$_MyChildDashboard _value, $Res Function(_$_MyChildDashboard) _then)
      : super(_value, (v) => _then(v as _$_MyChildDashboard));

  @override
  _$_MyChildDashboard get _value => super._value as _$_MyChildDashboard;

  @override
  $Res call({
    Object? child = freezed,
    Object? growth = freezed,
    Object? growthStatus = freezed,
  }) {
    return _then(_$_MyChildDashboard(
      child: child == freezed
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Child?,
      growth: growth == freezed
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as Growth?,
      growthStatus: growthStatus == freezed
          ? _value.growthStatus
          : growthStatus // ignore: cast_nullable_to_non_nullable
              as GrowthStatus?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MyChildDashboard
    with DiagnosticableTreeMixin
    implements _MyChildDashboard {
  const _$_MyChildDashboard({this.child, this.growth, this.growthStatus});

  factory _$_MyChildDashboard.fromJson(Map<String, dynamic> json) =>
      _$$_MyChildDashboardFromJson(json);

  @override
  final Child? child;
  @override
  final Growth? growth;
  @override
  final GrowthStatus? growthStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyChildDashboard(child: $child, growth: $growth, growthStatus: $growthStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyChildDashboard'))
      ..add(DiagnosticsProperty('child', child))
      ..add(DiagnosticsProperty('growth', growth))
      ..add(DiagnosticsProperty('growthStatus', growthStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyChildDashboard &&
            const DeepCollectionEquality().equals(other.child, child) &&
            const DeepCollectionEquality().equals(other.growth, growth) &&
            const DeepCollectionEquality()
                .equals(other.growthStatus, growthStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(child),
      const DeepCollectionEquality().hash(growth),
      const DeepCollectionEquality().hash(growthStatus));

  @JsonKey(ignore: true)
  @override
  _$$_MyChildDashboardCopyWith<_$_MyChildDashboard> get copyWith =>
      __$$_MyChildDashboardCopyWithImpl<_$_MyChildDashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyChildDashboardToJson(this);
  }
}

abstract class _MyChildDashboard implements MyChildDashboard {
  const factory _MyChildDashboard(
      {final Child? child,
      final Growth? growth,
      final GrowthStatus? growthStatus}) = _$_MyChildDashboard;

  factory _MyChildDashboard.fromJson(Map<String, dynamic> json) =
      _$_MyChildDashboard.fromJson;

  @override
  Child? get child => throw _privateConstructorUsedError;
  @override
  Growth? get growth => throw _privateConstructorUsedError;
  @override
  GrowthStatus? get growthStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MyChildDashboardCopyWith<_$_MyChildDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

Child _$ChildFromJson(Map<String, dynamic> json) {
  return _Child.fromJson(json);
}

/// @nodoc
mixin _$Child {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  Age? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChildCopyWith<Child> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCopyWith<$Res> {
  factory $ChildCopyWith(Child value, $Res Function(Child) then) =
      _$ChildCopyWithImpl<$Res>;
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
class _$ChildCopyWithImpl<$Res> implements $ChildCopyWith<$Res> {
  _$ChildCopyWithImpl(this._value, this._then);

  final Child _value;
  // ignore: unused_field
  final $Res Function(Child) _then;

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
abstract class _$$_ChildCopyWith<$Res> implements $ChildCopyWith<$Res> {
  factory _$$_ChildCopyWith(_$_Child value, $Res Function(_$_Child) then) =
      __$$_ChildCopyWithImpl<$Res>;
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
class __$$_ChildCopyWithImpl<$Res> extends _$ChildCopyWithImpl<$Res>
    implements _$$_ChildCopyWith<$Res> {
  __$$_ChildCopyWithImpl(_$_Child _value, $Res Function(_$_Child) _then)
      : super(_value, (v) => _then(v as _$_Child));

  @override
  _$_Child get _value => super._value as _$_Child;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? age = freezed,
  }) {
    return _then(_$_Child(
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
class _$_Child with DiagnosticableTreeMixin implements _Child {
  const _$_Child(
      {this.id, this.userId, this.name, this.gender, this.dob, this.age});

  factory _$_Child.fromJson(Map<String, dynamic> json) =>
      _$$_ChildFromJson(json);

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
    return 'Child(id: $id, userId: $userId, name: $name, gender: $gender, dob: $dob, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Child'))
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
            other is _$_Child &&
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
  _$$_ChildCopyWith<_$_Child> get copyWith =>
      __$$_ChildCopyWithImpl<_$_Child>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChildToJson(this);
  }
}

abstract class _Child implements Child {
  const factory _Child(
      {final String? id,
      final String? userId,
      final String? name,
      final String? gender,
      final String? dob,
      final Age? age}) = _$_Child;

  factory _Child.fromJson(Map<String, dynamic> json) = _$_Child.fromJson;

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
  _$$_ChildCopyWith<_$_Child> get copyWith =>
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

Growth _$GrowthFromJson(Map<String, dynamic> json) {
  return _Growth.fromJson(json);
}

/// @nodoc
mixin _$Growth {
  String? get id => throw _privateConstructorUsedError;
  String? get childId => throw _privateConstructorUsedError;
  int? get ageMonth => throw _privateConstructorUsedError;
  String? get visitDate => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  int? get headCircumference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrowthCopyWith<Growth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthCopyWith<$Res> {
  factory $GrowthCopyWith(Growth value, $Res Function(Growth) then) =
      _$GrowthCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? childId,
      int? ageMonth,
      String? visitDate,
      int? length,
      int? weight,
      int? headCircumference});
}

/// @nodoc
class _$GrowthCopyWithImpl<$Res> implements $GrowthCopyWith<$Res> {
  _$GrowthCopyWithImpl(this._value, this._then);

  final Growth _value;
  // ignore: unused_field
  final $Res Function(Growth) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? childId = freezed,
    Object? ageMonth = freezed,
    Object? visitDate = freezed,
    Object? length = freezed,
    Object? weight = freezed,
    Object? headCircumference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      childId: childId == freezed
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as String?,
      ageMonth: ageMonth == freezed
          ? _value.ageMonth
          : ageMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      visitDate: visitDate == freezed
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      headCircumference: headCircumference == freezed
          ? _value.headCircumference
          : headCircumference // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_GrowthCopyWith<$Res> implements $GrowthCopyWith<$Res> {
  factory _$$_GrowthCopyWith(_$_Growth value, $Res Function(_$_Growth) then) =
      __$$_GrowthCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? childId,
      int? ageMonth,
      String? visitDate,
      int? length,
      int? weight,
      int? headCircumference});
}

/// @nodoc
class __$$_GrowthCopyWithImpl<$Res> extends _$GrowthCopyWithImpl<$Res>
    implements _$$_GrowthCopyWith<$Res> {
  __$$_GrowthCopyWithImpl(_$_Growth _value, $Res Function(_$_Growth) _then)
      : super(_value, (v) => _then(v as _$_Growth));

  @override
  _$_Growth get _value => super._value as _$_Growth;

  @override
  $Res call({
    Object? id = freezed,
    Object? childId = freezed,
    Object? ageMonth = freezed,
    Object? visitDate = freezed,
    Object? length = freezed,
    Object? weight = freezed,
    Object? headCircumference = freezed,
  }) {
    return _then(_$_Growth(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      childId: childId == freezed
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as String?,
      ageMonth: ageMonth == freezed
          ? _value.ageMonth
          : ageMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      visitDate: visitDate == freezed
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      headCircumference: headCircumference == freezed
          ? _value.headCircumference
          : headCircumference // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Growth with DiagnosticableTreeMixin implements _Growth {
  const _$_Growth(
      {this.id,
      this.childId,
      this.ageMonth,
      this.visitDate,
      this.length,
      this.weight,
      this.headCircumference});

  factory _$_Growth.fromJson(Map<String, dynamic> json) =>
      _$$_GrowthFromJson(json);

  @override
  final String? id;
  @override
  final String? childId;
  @override
  final int? ageMonth;
  @override
  final String? visitDate;
  @override
  final int? length;
  @override
  final int? weight;
  @override
  final int? headCircumference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Growth(id: $id, childId: $childId, ageMonth: $ageMonth, visitDate: $visitDate, length: $length, weight: $weight, headCircumference: $headCircumference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Growth'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('childId', childId))
      ..add(DiagnosticsProperty('ageMonth', ageMonth))
      ..add(DiagnosticsProperty('visitDate', visitDate))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('headCircumference', headCircumference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Growth &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.childId, childId) &&
            const DeepCollectionEquality().equals(other.ageMonth, ageMonth) &&
            const DeepCollectionEquality().equals(other.visitDate, visitDate) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality()
                .equals(other.headCircumference, headCircumference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(childId),
      const DeepCollectionEquality().hash(ageMonth),
      const DeepCollectionEquality().hash(visitDate),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(headCircumference));

  @JsonKey(ignore: true)
  @override
  _$$_GrowthCopyWith<_$_Growth> get copyWith =>
      __$$_GrowthCopyWithImpl<_$_Growth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrowthToJson(this);
  }
}

abstract class _Growth implements Growth {
  const factory _Growth(
      {final String? id,
      final String? childId,
      final int? ageMonth,
      final String? visitDate,
      final int? length,
      final int? weight,
      final int? headCircumference}) = _$_Growth;

  factory _Growth.fromJson(Map<String, dynamic> json) = _$_Growth.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get childId => throw _privateConstructorUsedError;
  @override
  int? get ageMonth => throw _privateConstructorUsedError;
  @override
  String? get visitDate => throw _privateConstructorUsedError;
  @override
  int? get length => throw _privateConstructorUsedError;
  @override
  int? get weight => throw _privateConstructorUsedError;
  @override
  int? get headCircumference => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GrowthCopyWith<_$_Growth> get copyWith =>
      throw _privateConstructorUsedError;
}

GrowthStatus _$GrowthStatusFromJson(Map<String, dynamic> json) {
  return _GrowthStatus.fromJson(json);
}

/// @nodoc
mixin _$GrowthStatus {
  String? get length => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get headCircumference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrowthStatusCopyWith<GrowthStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthStatusCopyWith<$Res> {
  factory $GrowthStatusCopyWith(
          GrowthStatus value, $Res Function(GrowthStatus) then) =
      _$GrowthStatusCopyWithImpl<$Res>;
  $Res call({String? length, String? weight, String? headCircumference});
}

/// @nodoc
class _$GrowthStatusCopyWithImpl<$Res> implements $GrowthStatusCopyWith<$Res> {
  _$GrowthStatusCopyWithImpl(this._value, this._then);

  final GrowthStatus _value;
  // ignore: unused_field
  final $Res Function(GrowthStatus) _then;

  @override
  $Res call({
    Object? length = freezed,
    Object? weight = freezed,
    Object? headCircumference = freezed,
  }) {
    return _then(_value.copyWith(
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      headCircumference: headCircumference == freezed
          ? _value.headCircumference
          : headCircumference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GrowthStatusCopyWith<$Res>
    implements $GrowthStatusCopyWith<$Res> {
  factory _$$_GrowthStatusCopyWith(
          _$_GrowthStatus value, $Res Function(_$_GrowthStatus) then) =
      __$$_GrowthStatusCopyWithImpl<$Res>;
  @override
  $Res call({String? length, String? weight, String? headCircumference});
}

/// @nodoc
class __$$_GrowthStatusCopyWithImpl<$Res>
    extends _$GrowthStatusCopyWithImpl<$Res>
    implements _$$_GrowthStatusCopyWith<$Res> {
  __$$_GrowthStatusCopyWithImpl(
      _$_GrowthStatus _value, $Res Function(_$_GrowthStatus) _then)
      : super(_value, (v) => _then(v as _$_GrowthStatus));

  @override
  _$_GrowthStatus get _value => super._value as _$_GrowthStatus;

  @override
  $Res call({
    Object? length = freezed,
    Object? weight = freezed,
    Object? headCircumference = freezed,
  }) {
    return _then(_$_GrowthStatus(
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      headCircumference: headCircumference == freezed
          ? _value.headCircumference
          : headCircumference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_GrowthStatus with DiagnosticableTreeMixin implements _GrowthStatus {
  const _$_GrowthStatus({this.length, this.weight, this.headCircumference});

  factory _$_GrowthStatus.fromJson(Map<String, dynamic> json) =>
      _$$_GrowthStatusFromJson(json);

  @override
  final String? length;
  @override
  final String? weight;
  @override
  final String? headCircumference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GrowthStatus(length: $length, weight: $weight, headCircumference: $headCircumference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GrowthStatus'))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('headCircumference', headCircumference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GrowthStatus &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality()
                .equals(other.headCircumference, headCircumference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(headCircumference));

  @JsonKey(ignore: true)
  @override
  _$$_GrowthStatusCopyWith<_$_GrowthStatus> get copyWith =>
      __$$_GrowthStatusCopyWithImpl<_$_GrowthStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrowthStatusToJson(this);
  }
}

abstract class _GrowthStatus implements GrowthStatus {
  const factory _GrowthStatus(
      {final String? length,
      final String? weight,
      final String? headCircumference}) = _$_GrowthStatus;

  factory _GrowthStatus.fromJson(Map<String, dynamic> json) =
      _$_GrowthStatus.fromJson;

  @override
  String? get length => throw _privateConstructorUsedError;
  @override
  String? get weight => throw _privateConstructorUsedError;
  @override
  String? get headCircumference => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GrowthStatusCopyWith<_$_GrowthStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
