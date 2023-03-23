// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'biodata_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BiodataResponse _$BiodataResponseFromJson(Map<String, dynamic> json) {
  return _BiodataResponse.fromJson(json);
}

/// @nodoc
mixin _$BiodataResponse {
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  DateTime? get lastBiodataView => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BiodataResponseCopyWith<BiodataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiodataResponseCopyWith<$Res> {
  factory $BiodataResponseCopyWith(
          BiodataResponse value, $Res Function(BiodataResponse) then) =
      _$BiodataResponseCopyWithImpl<$Res>;
  $Res call(
      {String? username,
      String? name,
      String? email,
      String? mobile,
      DateTime? dob,
      DateTime? lastBiodataView});
}

/// @nodoc
class _$BiodataResponseCopyWithImpl<$Res>
    implements $BiodataResponseCopyWith<$Res> {
  _$BiodataResponseCopyWithImpl(this._value, this._then);

  final BiodataResponse _value;
  // ignore: unused_field
  final $Res Function(BiodataResponse) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? dob = freezed,
    Object? lastBiodataView = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastBiodataView: lastBiodataView == freezed
          ? _value.lastBiodataView
          : lastBiodataView // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_BiodataResponseCopyWith<$Res>
    implements $BiodataResponseCopyWith<$Res> {
  factory _$$_BiodataResponseCopyWith(
          _$_BiodataResponse value, $Res Function(_$_BiodataResponse) then) =
      __$$_BiodataResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? username,
      String? name,
      String? email,
      String? mobile,
      DateTime? dob,
      DateTime? lastBiodataView});
}

/// @nodoc
class __$$_BiodataResponseCopyWithImpl<$Res>
    extends _$BiodataResponseCopyWithImpl<$Res>
    implements _$$_BiodataResponseCopyWith<$Res> {
  __$$_BiodataResponseCopyWithImpl(
      _$_BiodataResponse _value, $Res Function(_$_BiodataResponse) _then)
      : super(_value, (v) => _then(v as _$_BiodataResponse));

  @override
  _$_BiodataResponse get _value => super._value as _$_BiodataResponse;

  @override
  $Res call({
    Object? username = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? dob = freezed,
    Object? lastBiodataView = freezed,
  }) {
    return _then(_$_BiodataResponse(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastBiodataView: lastBiodataView == freezed
          ? _value.lastBiodataView
          : lastBiodataView // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BiodataResponse implements _BiodataResponse {
  const _$_BiodataResponse(
      {required this.username,
      required this.name,
      required this.email,
      required this.mobile,
      required this.dob,
      required this.lastBiodataView});

  factory _$_BiodataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BiodataResponseFromJson(json);

  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? mobile;
  @override
  final DateTime? dob;
  @override
  final DateTime? lastBiodataView;

  @override
  String toString() {
    return 'BiodataResponse(username: $username, name: $name, email: $email, mobile: $mobile, dob: $dob, lastBiodataView: $lastBiodataView)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BiodataResponse &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality()
                .equals(other.lastBiodataView, lastBiodataView));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(mobile),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(lastBiodataView));

  @JsonKey(ignore: true)
  @override
  _$$_BiodataResponseCopyWith<_$_BiodataResponse> get copyWith =>
      __$$_BiodataResponseCopyWithImpl<_$_BiodataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BiodataResponseToJson(this);
  }
}

abstract class _BiodataResponse implements BiodataResponse {
  const factory _BiodataResponse(
      {required final String? username,
      required final String? name,
      required final String? email,
      required final String? mobile,
      required final DateTime? dob,
      required final DateTime? lastBiodataView}) = _$_BiodataResponse;

  factory _BiodataResponse.fromJson(Map<String, dynamic> json) =
      _$_BiodataResponse.fromJson;

  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get mobile => throw _privateConstructorUsedError;
  @override
  DateTime? get dob => throw _privateConstructorUsedError;
  @override
  DateTime? get lastBiodataView => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BiodataResponseCopyWith<_$_BiodataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
