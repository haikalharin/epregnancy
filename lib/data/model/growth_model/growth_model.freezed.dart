// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'growth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GrowthModel _$GrowthModelFromJson(Map<String, dynamic> json) {
  return _GrowthModel.fromJson(json);
}

/// @nodoc
mixin _$GrowthModel {
  String? get id => throw _privateConstructorUsedError;
  String? get childId => throw _privateConstructorUsedError;
  int? get ageMonth => throw _privateConstructorUsedError;
  String? get visitDate => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  int? get headCircumference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrowthModelCopyWith<GrowthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthModelCopyWith<$Res> {
  factory $GrowthModelCopyWith(
          GrowthModel value, $Res Function(GrowthModel) then) =
      _$GrowthModelCopyWithImpl<$Res>;
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
class _$GrowthModelCopyWithImpl<$Res> implements $GrowthModelCopyWith<$Res> {
  _$GrowthModelCopyWithImpl(this._value, this._then);

  final GrowthModel _value;
  // ignore: unused_field
  final $Res Function(GrowthModel) _then;

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
abstract class _$$_GrowthModelCopyWith<$Res>
    implements $GrowthModelCopyWith<$Res> {
  factory _$$_GrowthModelCopyWith(
          _$_GrowthModel value, $Res Function(_$_GrowthModel) then) =
      __$$_GrowthModelCopyWithImpl<$Res>;
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
class __$$_GrowthModelCopyWithImpl<$Res> extends _$GrowthModelCopyWithImpl<$Res>
    implements _$$_GrowthModelCopyWith<$Res> {
  __$$_GrowthModelCopyWithImpl(
      _$_GrowthModel _value, $Res Function(_$_GrowthModel) _then)
      : super(_value, (v) => _then(v as _$_GrowthModel));

  @override
  _$_GrowthModel get _value => super._value as _$_GrowthModel;

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
    return _then(_$_GrowthModel(
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
class _$_GrowthModel with DiagnosticableTreeMixin implements _GrowthModel {
  const _$_GrowthModel(
      {this.id,
      this.childId,
      this.ageMonth,
      this.visitDate,
      this.length,
      this.weight,
      this.headCircumference});

  factory _$_GrowthModel.fromJson(Map<String, dynamic> json) =>
      _$$_GrowthModelFromJson(json);

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
    return 'GrowthModel(id: $id, childId: $childId, ageMonth: $ageMonth, visitDate: $visitDate, length: $length, weight: $weight, headCircumference: $headCircumference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GrowthModel'))
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
            other is _$_GrowthModel &&
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
  _$$_GrowthModelCopyWith<_$_GrowthModel> get copyWith =>
      __$$_GrowthModelCopyWithImpl<_$_GrowthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrowthModelToJson(this);
  }
}

abstract class _GrowthModel implements GrowthModel {
  const factory _GrowthModel(
      {final String? id,
      final String? childId,
      final int? ageMonth,
      final String? visitDate,
      final int? length,
      final int? weight,
      final int? headCircumference}) = _$_GrowthModel;

  factory _GrowthModel.fromJson(Map<String, dynamic> json) =
      _$_GrowthModel.fromJson;

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
  _$$_GrowthModelCopyWith<_$_GrowthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
