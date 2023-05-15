// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'baby_child_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BabyChildResponse _$BabyChildResponseFromJson(Map<String, dynamic> json) {
  return _BabyChildResponse.fromJson(json);
}

/// @nodoc
mixin _$BabyChildResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get born => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BabyChildResponseCopyWith<BabyChildResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabyChildResponseCopyWith<$Res> {
  factory $BabyChildResponseCopyWith(
          BabyChildResponse value, $Res Function(BabyChildResponse) then) =
      _$BabyChildResponseCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? gender, bool? born});
}

/// @nodoc
class _$BabyChildResponseCopyWithImpl<$Res>
    implements $BabyChildResponseCopyWith<$Res> {
  _$BabyChildResponseCopyWithImpl(this._value, this._then);

  final BabyChildResponse _value;
  // ignore: unused_field
  final $Res Function(BabyChildResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? born = freezed,
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
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      born: born == freezed
          ? _value.born
          : born // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_BabyChildResponseCopyWith<$Res>
    implements $BabyChildResponseCopyWith<$Res> {
  factory _$$_BabyChildResponseCopyWith(_$_BabyChildResponse value,
          $Res Function(_$_BabyChildResponse) then) =
      __$$_BabyChildResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? gender, bool? born});
}

/// @nodoc
class __$$_BabyChildResponseCopyWithImpl<$Res>
    extends _$BabyChildResponseCopyWithImpl<$Res>
    implements _$$_BabyChildResponseCopyWith<$Res> {
  __$$_BabyChildResponseCopyWithImpl(
      _$_BabyChildResponse _value, $Res Function(_$_BabyChildResponse) _then)
      : super(_value, (v) => _then(v as _$_BabyChildResponse));

  @override
  _$_BabyChildResponse get _value => super._value as _$_BabyChildResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? born = freezed,
  }) {
    return _then(_$_BabyChildResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      born: born == freezed
          ? _value.born
          : born // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BabyChildResponse
    with DiagnosticableTreeMixin
    implements _BabyChildResponse {
  const _$_BabyChildResponse({this.id, this.name, this.gender, this.born});

  factory _$_BabyChildResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BabyChildResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? gender;
  @override
  final bool? born;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BabyChildResponse(id: $id, name: $name, gender: $gender, born: $born)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BabyChildResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('born', born));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BabyChildResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.born, born));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(born));

  @JsonKey(ignore: true)
  @override
  _$$_BabyChildResponseCopyWith<_$_BabyChildResponse> get copyWith =>
      __$$_BabyChildResponseCopyWithImpl<_$_BabyChildResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BabyChildResponseToJson(this);
  }
}

abstract class _BabyChildResponse implements BabyChildResponse {
  const factory _BabyChildResponse(
      {final String? id,
      final String? name,
      final String? gender,
      final bool? born}) = _$_BabyChildResponse;

  factory _BabyChildResponse.fromJson(Map<String, dynamic> json) =
      _$_BabyChildResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  bool? get born => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BabyChildResponseCopyWith<_$_BabyChildResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
