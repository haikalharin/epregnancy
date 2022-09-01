// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'point_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointHistory _$PointHistoryFromJson(Map<String, dynamic> json) {
  return _PointHistory.fromJson(json);
}

/// @nodoc
mixin _$PointHistory {
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  bool? get isDelete => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointHistoryCopyWith<PointHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointHistoryCopyWith<$Res> {
  factory $PointHistoryCopyWith(
          PointHistory value, $Res Function(PointHistory) then) =
      _$PointHistoryCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? type,
      String? userId,
      String? description,
      int? points,
      bool? isDelete,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class _$PointHistoryCopyWithImpl<$Res> implements $PointHistoryCopyWith<$Res> {
  _$PointHistoryCopyWithImpl(this._value, this._then);

  final PointHistory _value;
  // ignore: unused_field
  final $Res Function(PointHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? userId = freezed,
    Object? description = freezed,
    Object? points = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PointHistoryCopyWith<$Res>
    implements $PointHistoryCopyWith<$Res> {
  factory _$$_PointHistoryCopyWith(
          _$_PointHistory value, $Res Function(_$_PointHistory) then) =
      __$$_PointHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? type,
      String? userId,
      String? description,
      int? points,
      bool? isDelete,
      String? createdBy,
      String? createdDate});
}

/// @nodoc
class __$$_PointHistoryCopyWithImpl<$Res>
    extends _$PointHistoryCopyWithImpl<$Res>
    implements _$$_PointHistoryCopyWith<$Res> {
  __$$_PointHistoryCopyWithImpl(
      _$_PointHistory _value, $Res Function(_$_PointHistory) _then)
      : super(_value, (v) => _then(v as _$_PointHistory));

  @override
  _$_PointHistory get _value => super._value as _$_PointHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? userId = freezed,
    Object? description = freezed,
    Object? points = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_PointHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_PointHistory with DiagnosticableTreeMixin implements _PointHistory {
  const _$_PointHistory(
      {required this.id,
      required this.type,
      required this.userId,
      required this.description,
      required this.points,
      required this.isDelete,
      required this.createdBy,
      required this.createdDate});

  factory _$_PointHistory.fromJson(Map<String, dynamic> json) =>
      _$$_PointHistoryFromJson(json);

  @override
  final String? id;
  @override
  final String? type;
  @override
  final String? userId;
  @override
  final String? description;
  @override
  final int? points;
  @override
  final bool? isDelete;
  @override
  final String? createdBy;
  @override
  final String? createdDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PointHistory(id: $id, type: $type, userId: $userId, description: $description, points: $points, isDelete: $isDelete, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PointHistory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('createdDate', createdDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            const DeepCollectionEquality().equals(other.isDelete, isDelete) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(points),
      const DeepCollectionEquality().hash(isDelete),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$$_PointHistoryCopyWith<_$_PointHistory> get copyWith =>
      __$$_PointHistoryCopyWithImpl<_$_PointHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointHistoryToJson(this);
  }
}

abstract class _PointHistory implements PointHistory {
  const factory _PointHistory(
      {required final String? id,
      required final String? type,
      required final String? userId,
      required final String? description,
      required final int? points,
      required final bool? isDelete,
      required final String? createdBy,
      required final String? createdDate}) = _$_PointHistory;

  factory _PointHistory.fromJson(Map<String, dynamic> json) =
      _$_PointHistory.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  int? get points => throw _privateConstructorUsedError;
  @override
  bool? get isDelete => throw _privateConstructorUsedError;
  @override
  String? get createdBy => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PointHistoryCopyWith<_$_PointHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
