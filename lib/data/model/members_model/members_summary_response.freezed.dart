// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'members_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MembersSummaryResponse _$MembersSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _MembersSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$MembersSummaryResponse {
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get hospitalName => throw _privateConstructorUsedError;
  int? get totalMidwife => throw _privateConstructorUsedError;
  int? get totalPatient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembersSummaryResponseCopyWith<MembersSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembersSummaryResponseCopyWith<$Res> {
  factory $MembersSummaryResponseCopyWith(MembersSummaryResponse value,
          $Res Function(MembersSummaryResponse) then) =
      _$MembersSummaryResponseCopyWithImpl<$Res>;
  $Res call(
      {String? hospitalId,
      String? hospitalName,
      int? totalMidwife,
      int? totalPatient});
}

/// @nodoc
class _$MembersSummaryResponseCopyWithImpl<$Res>
    implements $MembersSummaryResponseCopyWith<$Res> {
  _$MembersSummaryResponseCopyWithImpl(this._value, this._then);

  final MembersSummaryResponse _value;
  // ignore: unused_field
  final $Res Function(MembersSummaryResponse) _then;

  @override
  $Res call({
    Object? hospitalId = freezed,
    Object? hospitalName = freezed,
    Object? totalMidwife = freezed,
    Object? totalPatient = freezed,
  }) {
    return _then(_value.copyWith(
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalName: hospitalName == freezed
          ? _value.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMidwife: totalMidwife == freezed
          ? _value.totalMidwife
          : totalMidwife // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPatient: totalPatient == freezed
          ? _value.totalPatient
          : totalPatient // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_MembersSummaryResponseCopyWith<$Res>
    implements $MembersSummaryResponseCopyWith<$Res> {
  factory _$$_MembersSummaryResponseCopyWith(_$_MembersSummaryResponse value,
          $Res Function(_$_MembersSummaryResponse) then) =
      __$$_MembersSummaryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? hospitalId,
      String? hospitalName,
      int? totalMidwife,
      int? totalPatient});
}

/// @nodoc
class __$$_MembersSummaryResponseCopyWithImpl<$Res>
    extends _$MembersSummaryResponseCopyWithImpl<$Res>
    implements _$$_MembersSummaryResponseCopyWith<$Res> {
  __$$_MembersSummaryResponseCopyWithImpl(_$_MembersSummaryResponse _value,
      $Res Function(_$_MembersSummaryResponse) _then)
      : super(_value, (v) => _then(v as _$_MembersSummaryResponse));

  @override
  _$_MembersSummaryResponse get _value =>
      super._value as _$_MembersSummaryResponse;

  @override
  $Res call({
    Object? hospitalId = freezed,
    Object? hospitalName = freezed,
    Object? totalMidwife = freezed,
    Object? totalPatient = freezed,
  }) {
    return _then(_$_MembersSummaryResponse(
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalName: hospitalName == freezed
          ? _value.hospitalName
          : hospitalName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMidwife: totalMidwife == freezed
          ? _value.totalMidwife
          : totalMidwife // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPatient: totalPatient == freezed
          ? _value.totalPatient
          : totalPatient // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MembersSummaryResponse implements _MembersSummaryResponse {
  const _$_MembersSummaryResponse(
      {required this.hospitalId,
      required this.hospitalName,
      required this.totalMidwife,
      required this.totalPatient});

  factory _$_MembersSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MembersSummaryResponseFromJson(json);

  @override
  final String? hospitalId;
  @override
  final String? hospitalName;
  @override
  final int? totalMidwife;
  @override
  final int? totalPatient;

  @override
  String toString() {
    return 'MembersSummaryResponse(hospitalId: $hospitalId, hospitalName: $hospitalName, totalMidwife: $totalMidwife, totalPatient: $totalPatient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MembersSummaryResponse &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality()
                .equals(other.hospitalName, hospitalName) &&
            const DeepCollectionEquality()
                .equals(other.totalMidwife, totalMidwife) &&
            const DeepCollectionEquality()
                .equals(other.totalPatient, totalPatient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(hospitalName),
      const DeepCollectionEquality().hash(totalMidwife),
      const DeepCollectionEquality().hash(totalPatient));

  @JsonKey(ignore: true)
  @override
  _$$_MembersSummaryResponseCopyWith<_$_MembersSummaryResponse> get copyWith =>
      __$$_MembersSummaryResponseCopyWithImpl<_$_MembersSummaryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MembersSummaryResponseToJson(this);
  }
}

abstract class _MembersSummaryResponse implements MembersSummaryResponse {
  const factory _MembersSummaryResponse(
      {required final String? hospitalId,
      required final String? hospitalName,
      required final int? totalMidwife,
      required final int? totalPatient}) = _$_MembersSummaryResponse;

  factory _MembersSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_MembersSummaryResponse.fromJson;

  @override
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  String? get hospitalName => throw _privateConstructorUsedError;
  @override
  int? get totalMidwife => throw _privateConstructorUsedError;
  @override
  int? get totalPatient => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MembersSummaryResponseCopyWith<_$_MembersSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
