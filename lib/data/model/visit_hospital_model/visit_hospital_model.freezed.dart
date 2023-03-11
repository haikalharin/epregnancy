// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'visit_hospital_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitHospitalModel _$VisitHospitalModelFromJson(Map<String, dynamic> json) {
  return _VisitHospitalModel.fromJson(json);
}

/// @nodoc
mixin _$VisitHospitalModel {
  @JsonKey(name: 'is_get_point', includeIfNull: true)
  bool? get isGetPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitHospitalModelCopyWith<VisitHospitalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitHospitalModelCopyWith<$Res> {
  factory $VisitHospitalModelCopyWith(
          VisitHospitalModel value, $Res Function(VisitHospitalModel) then) =
      _$VisitHospitalModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'is_get_point', includeIfNull: true) bool? isGetPoint});
}

/// @nodoc
class _$VisitHospitalModelCopyWithImpl<$Res>
    implements $VisitHospitalModelCopyWith<$Res> {
  _$VisitHospitalModelCopyWithImpl(this._value, this._then);

  final VisitHospitalModel _value;
  // ignore: unused_field
  final $Res Function(VisitHospitalModel) _then;

  @override
  $Res call({
    Object? isGetPoint = freezed,
  }) {
    return _then(_value.copyWith(
      isGetPoint: isGetPoint == freezed
          ? _value.isGetPoint
          : isGetPoint // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_VisitHospitalModelCopyWith<$Res>
    implements $VisitHospitalModelCopyWith<$Res> {
  factory _$$_VisitHospitalModelCopyWith(_$_VisitHospitalModel value,
          $Res Function(_$_VisitHospitalModel) then) =
      __$$_VisitHospitalModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'is_get_point', includeIfNull: true) bool? isGetPoint});
}

/// @nodoc
class __$$_VisitHospitalModelCopyWithImpl<$Res>
    extends _$VisitHospitalModelCopyWithImpl<$Res>
    implements _$$_VisitHospitalModelCopyWith<$Res> {
  __$$_VisitHospitalModelCopyWithImpl(
      _$_VisitHospitalModel _value, $Res Function(_$_VisitHospitalModel) _then)
      : super(_value, (v) => _then(v as _$_VisitHospitalModel));

  @override
  _$_VisitHospitalModel get _value => super._value as _$_VisitHospitalModel;

  @override
  $Res call({
    Object? isGetPoint = freezed,
  }) {
    return _then(_$_VisitHospitalModel(
      isGetPoint: isGetPoint == freezed
          ? _value.isGetPoint
          : isGetPoint // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisitHospitalModel implements _VisitHospitalModel {
  const _$_VisitHospitalModel(
      {@JsonKey(name: 'is_get_point', includeIfNull: true) this.isGetPoint});

  factory _$_VisitHospitalModel.fromJson(Map<String, dynamic> json) =>
      _$$_VisitHospitalModelFromJson(json);

  @override
  @JsonKey(name: 'is_get_point', includeIfNull: true)
  final bool? isGetPoint;

  @override
  String toString() {
    return 'VisitHospitalModel(isGetPoint: $isGetPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitHospitalModel &&
            const DeepCollectionEquality()
                .equals(other.isGetPoint, isGetPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isGetPoint));

  @JsonKey(ignore: true)
  @override
  _$$_VisitHospitalModelCopyWith<_$_VisitHospitalModel> get copyWith =>
      __$$_VisitHospitalModelCopyWithImpl<_$_VisitHospitalModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitHospitalModelToJson(this);
  }
}

abstract class _VisitHospitalModel implements VisitHospitalModel {
  const factory _VisitHospitalModel(
      {@JsonKey(name: 'is_get_point', includeIfNull: true)
          final bool? isGetPoint}) = _$_VisitHospitalModel;

  factory _VisitHospitalModel.fromJson(Map<String, dynamic> json) =
      _$_VisitHospitalModel.fromJson;

  @override
  @JsonKey(name: 'is_get_point', includeIfNull: true)
  bool? get isGetPoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VisitHospitalModelCopyWith<_$_VisitHospitalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
