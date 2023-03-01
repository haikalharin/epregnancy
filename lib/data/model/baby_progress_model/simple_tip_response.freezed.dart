// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simple_tip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleTipResponse _$SimpleTipResponseFromJson(Map<String, dynamic> json) {
  return _SimpleTipResponse.fromJson(json);
}

/// @nodoc
mixin _$SimpleTipResponse {
  String? get articleId => throw _privateConstructorUsedError;
  String? get tips => throw _privateConstructorUsedError;
  String? get webUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleTipResponseCopyWith<SimpleTipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleTipResponseCopyWith<$Res> {
  factory $SimpleTipResponseCopyWith(
          SimpleTipResponse value, $Res Function(SimpleTipResponse) then) =
      _$SimpleTipResponseCopyWithImpl<$Res>;
  $Res call({String? articleId, String? tips, String? webUrl});
}

/// @nodoc
class _$SimpleTipResponseCopyWithImpl<$Res>
    implements $SimpleTipResponseCopyWith<$Res> {
  _$SimpleTipResponseCopyWithImpl(this._value, this._then);

  final SimpleTipResponse _value;
  // ignore: unused_field
  final $Res Function(SimpleTipResponse) _then;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? tips = freezed,
    Object? webUrl = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      tips: tips == freezed
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as String?,
      webUrl: webUrl == freezed
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SimpleTipResponseCopyWith<$Res>
    implements $SimpleTipResponseCopyWith<$Res> {
  factory _$$_SimpleTipResponseCopyWith(_$_SimpleTipResponse value,
          $Res Function(_$_SimpleTipResponse) then) =
      __$$_SimpleTipResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? articleId, String? tips, String? webUrl});
}

/// @nodoc
class __$$_SimpleTipResponseCopyWithImpl<$Res>
    extends _$SimpleTipResponseCopyWithImpl<$Res>
    implements _$$_SimpleTipResponseCopyWith<$Res> {
  __$$_SimpleTipResponseCopyWithImpl(
      _$_SimpleTipResponse _value, $Res Function(_$_SimpleTipResponse) _then)
      : super(_value, (v) => _then(v as _$_SimpleTipResponse));

  @override
  _$_SimpleTipResponse get _value => super._value as _$_SimpleTipResponse;

  @override
  $Res call({
    Object? articleId = freezed,
    Object? tips = freezed,
    Object? webUrl = freezed,
  }) {
    return _then(_$_SimpleTipResponse(
      articleId: articleId == freezed
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      tips: tips == freezed
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as String?,
      webUrl: webUrl == freezed
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_SimpleTipResponse
    with DiagnosticableTreeMixin
    implements _SimpleTipResponse {
  const _$_SimpleTipResponse({this.articleId, this.tips, this.webUrl});

  factory _$_SimpleTipResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleTipResponseFromJson(json);

  @override
  final String? articleId;
  @override
  final String? tips;
  @override
  final String? webUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SimpleTipResponse(articleId: $articleId, tips: $tips, webUrl: $webUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SimpleTipResponse'))
      ..add(DiagnosticsProperty('articleId', articleId))
      ..add(DiagnosticsProperty('tips', tips))
      ..add(DiagnosticsProperty('webUrl', webUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleTipResponse &&
            const DeepCollectionEquality().equals(other.articleId, articleId) &&
            const DeepCollectionEquality().equals(other.tips, tips) &&
            const DeepCollectionEquality().equals(other.webUrl, webUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articleId),
      const DeepCollectionEquality().hash(tips),
      const DeepCollectionEquality().hash(webUrl));

  @JsonKey(ignore: true)
  @override
  _$$_SimpleTipResponseCopyWith<_$_SimpleTipResponse> get copyWith =>
      __$$_SimpleTipResponseCopyWithImpl<_$_SimpleTipResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleTipResponseToJson(this);
  }
}

abstract class _SimpleTipResponse implements SimpleTipResponse {
  const factory _SimpleTipResponse(
      {final String? articleId,
      final String? tips,
      final String? webUrl}) = _$_SimpleTipResponse;

  factory _SimpleTipResponse.fromJson(Map<String, dynamic> json) =
      _$_SimpleTipResponse.fromJson;

  @override
  String? get articleId => throw _privateConstructorUsedError;
  @override
  String? get tips => throw _privateConstructorUsedError;
  @override
  String? get webUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleTipResponseCopyWith<_$_SimpleTipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
