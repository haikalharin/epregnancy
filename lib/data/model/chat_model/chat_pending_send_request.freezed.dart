// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_pending_send_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatPendingSendRequest _$ChatPendingSendRequestFromJson(
    Map<String, dynamic> json) {
  return _ChatPendingSendRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatPendingSendRequest {
  String? get fromId => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatPendingSendRequestCopyWith<ChatPendingSendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPendingSendRequestCopyWith<$Res> {
  factory $ChatPendingSendRequestCopyWith(ChatPendingSendRequest value,
          $Res Function(ChatPendingSendRequest) then) =
      _$ChatPendingSendRequestCopyWithImpl<$Res>;
  $Res call({String? fromId, String? hospitalId, String? message});
}

/// @nodoc
class _$ChatPendingSendRequestCopyWithImpl<$Res>
    implements $ChatPendingSendRequestCopyWith<$Res> {
  _$ChatPendingSendRequestCopyWithImpl(this._value, this._then);

  final ChatPendingSendRequest _value;
  // ignore: unused_field
  final $Res Function(ChatPendingSendRequest) _then;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? hospitalId = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatPendingSendRequestCopyWith<$Res>
    implements $ChatPendingSendRequestCopyWith<$Res> {
  factory _$$_ChatPendingSendRequestCopyWith(_$_ChatPendingSendRequest value,
          $Res Function(_$_ChatPendingSendRequest) then) =
      __$$_ChatPendingSendRequestCopyWithImpl<$Res>;
  @override
  $Res call({String? fromId, String? hospitalId, String? message});
}

/// @nodoc
class __$$_ChatPendingSendRequestCopyWithImpl<$Res>
    extends _$ChatPendingSendRequestCopyWithImpl<$Res>
    implements _$$_ChatPendingSendRequestCopyWith<$Res> {
  __$$_ChatPendingSendRequestCopyWithImpl(_$_ChatPendingSendRequest _value,
      $Res Function(_$_ChatPendingSendRequest) _then)
      : super(_value, (v) => _then(v as _$_ChatPendingSendRequest));

  @override
  _$_ChatPendingSendRequest get _value =>
      super._value as _$_ChatPendingSendRequest;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? hospitalId = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ChatPendingSendRequest(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ChatPendingSendRequest
    with DiagnosticableTreeMixin
    implements _ChatPendingSendRequest {
  const _$_ChatPendingSendRequest(
      {required this.fromId, required this.hospitalId, required this.message});

  factory _$_ChatPendingSendRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ChatPendingSendRequestFromJson(json);

  @override
  final String? fromId;
  @override
  final String? hospitalId;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatPendingSendRequest(fromId: $fromId, hospitalId: $hospitalId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatPendingSendRequest'))
      ..add(DiagnosticsProperty('fromId', fromId))
      ..add(DiagnosticsProperty('hospitalId', hospitalId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatPendingSendRequest &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fromId),
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ChatPendingSendRequestCopyWith<_$_ChatPendingSendRequest> get copyWith =>
      __$$_ChatPendingSendRequestCopyWithImpl<_$_ChatPendingSendRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatPendingSendRequestToJson(this);
  }
}

abstract class _ChatPendingSendRequest implements ChatPendingSendRequest {
  const factory _ChatPendingSendRequest(
      {required final String? fromId,
      required final String? hospitalId,
      required final String? message}) = _$_ChatPendingSendRequest;

  factory _ChatPendingSendRequest.fromJson(Map<String, dynamic> json) =
      _$_ChatPendingSendRequest.fromJson;

  @override
  String? get fromId => throw _privateConstructorUsedError;
  @override
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPendingSendRequestCopyWith<_$_ChatPendingSendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
