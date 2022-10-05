// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_send_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatSendRequest _$ChatSendRequestFromJson(Map<String, dynamic> json) {
  return _ChatSendRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatSendRequest {
  String? get fromId => throw _privateConstructorUsedError;
  String? get toId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSendRequestCopyWith<ChatSendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSendRequestCopyWith<$Res> {
  factory $ChatSendRequestCopyWith(
          ChatSendRequest value, $Res Function(ChatSendRequest) then) =
      _$ChatSendRequestCopyWithImpl<$Res>;
  $Res call({String? fromId, String? toId, String? message});
}

/// @nodoc
class _$ChatSendRequestCopyWithImpl<$Res>
    implements $ChatSendRequestCopyWith<$Res> {
  _$ChatSendRequestCopyWithImpl(this._value, this._then);

  final ChatSendRequest _value;
  // ignore: unused_field
  final $Res Function(ChatSendRequest) _then;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String?,
      toId: toId == freezed
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatSendRequestCopyWith<$Res>
    implements $ChatSendRequestCopyWith<$Res> {
  factory _$$_ChatSendRequestCopyWith(
          _$_ChatSendRequest value, $Res Function(_$_ChatSendRequest) then) =
      __$$_ChatSendRequestCopyWithImpl<$Res>;
  @override
  $Res call({String? fromId, String? toId, String? message});
}

/// @nodoc
class __$$_ChatSendRequestCopyWithImpl<$Res>
    extends _$ChatSendRequestCopyWithImpl<$Res>
    implements _$$_ChatSendRequestCopyWith<$Res> {
  __$$_ChatSendRequestCopyWithImpl(
      _$_ChatSendRequest _value, $Res Function(_$_ChatSendRequest) _then)
      : super(_value, (v) => _then(v as _$_ChatSendRequest));

  @override
  _$_ChatSendRequest get _value => super._value as _$_ChatSendRequest;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ChatSendRequest(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String?,
      toId: toId == freezed
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
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
class _$_ChatSendRequest
    with DiagnosticableTreeMixin
    implements _ChatSendRequest {
  const _$_ChatSendRequest(
      {required this.fromId, required this.toId, required this.message});

  factory _$_ChatSendRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ChatSendRequestFromJson(json);

  @override
  final String? fromId;
  @override
  final String? toId;
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatSendRequest(fromId: $fromId, toId: $toId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatSendRequest'))
      ..add(DiagnosticsProperty('fromId', fromId))
      ..add(DiagnosticsProperty('toId', toId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatSendRequest &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality().equals(other.toId, toId) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fromId),
      const DeepCollectionEquality().hash(toId),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ChatSendRequestCopyWith<_$_ChatSendRequest> get copyWith =>
      __$$_ChatSendRequestCopyWithImpl<_$_ChatSendRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatSendRequestToJson(this);
  }
}

abstract class _ChatSendRequest implements ChatSendRequest {
  const factory _ChatSendRequest(
      {required final String? fromId,
      required final String? toId,
      required final String? message}) = _$_ChatSendRequest;

  factory _ChatSendRequest.fromJson(Map<String, dynamic> json) =
      _$_ChatSendRequest.fromJson;

  @override
  String? get fromId => throw _privateConstructorUsedError;
  @override
  String? get toId => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatSendRequestCopyWith<_$_ChatSendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
