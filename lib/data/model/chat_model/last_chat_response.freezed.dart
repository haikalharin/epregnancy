// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'last_chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastChatResponse _$LastChatResponseFromJson(Map<String, dynamic> json) {
  return _LastChatResponse.fromJson(json);
}

/// @nodoc
mixin _$LastChatResponse {
  int? get unreadMessage => throw _privateConstructorUsedError;
  Chat? get chat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastChatResponseCopyWith<LastChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastChatResponseCopyWith<$Res> {
  factory $LastChatResponseCopyWith(
          LastChatResponse value, $Res Function(LastChatResponse) then) =
      _$LastChatResponseCopyWithImpl<$Res>;
  $Res call({int? unreadMessage, Chat? chat});

  $ChatCopyWith<$Res>? get chat;
}

/// @nodoc
class _$LastChatResponseCopyWithImpl<$Res>
    implements $LastChatResponseCopyWith<$Res> {
  _$LastChatResponseCopyWithImpl(this._value, this._then);

  final LastChatResponse _value;
  // ignore: unused_field
  final $Res Function(LastChatResponse) _then;

  @override
  $Res call({
    Object? unreadMessage = freezed,
    Object? chat = freezed,
  }) {
    return _then(_value.copyWith(
      unreadMessage: unreadMessage == freezed
          ? _value.unreadMessage
          : unreadMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ));
  }

  @override
  $ChatCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value));
    });
  }
}

/// @nodoc
abstract class _$$_LastChatResponseCopyWith<$Res>
    implements $LastChatResponseCopyWith<$Res> {
  factory _$$_LastChatResponseCopyWith(
          _$_LastChatResponse value, $Res Function(_$_LastChatResponse) then) =
      __$$_LastChatResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? unreadMessage, Chat? chat});

  @override
  $ChatCopyWith<$Res>? get chat;
}

/// @nodoc
class __$$_LastChatResponseCopyWithImpl<$Res>
    extends _$LastChatResponseCopyWithImpl<$Res>
    implements _$$_LastChatResponseCopyWith<$Res> {
  __$$_LastChatResponseCopyWithImpl(
      _$_LastChatResponse _value, $Res Function(_$_LastChatResponse) _then)
      : super(_value, (v) => _then(v as _$_LastChatResponse));

  @override
  _$_LastChatResponse get _value => super._value as _$_LastChatResponse;

  @override
  $Res call({
    Object? unreadMessage = freezed,
    Object? chat = freezed,
  }) {
    return _then(_$_LastChatResponse(
      unreadMessage: unreadMessage == freezed
          ? _value.unreadMessage
          : unreadMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_LastChatResponse implements _LastChatResponse {
  const _$_LastChatResponse({required this.unreadMessage, required this.chat});

  factory _$_LastChatResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LastChatResponseFromJson(json);

  @override
  final int? unreadMessage;
  @override
  final Chat? chat;

  @override
  String toString() {
    return 'LastChatResponse(unreadMessage: $unreadMessage, chat: $chat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastChatResponse &&
            const DeepCollectionEquality()
                .equals(other.unreadMessage, unreadMessage) &&
            const DeepCollectionEquality().equals(other.chat, chat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unreadMessage),
      const DeepCollectionEquality().hash(chat));

  @JsonKey(ignore: true)
  @override
  _$$_LastChatResponseCopyWith<_$_LastChatResponse> get copyWith =>
      __$$_LastChatResponseCopyWithImpl<_$_LastChatResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastChatResponseToJson(this);
  }
}

abstract class _LastChatResponse implements LastChatResponse {
  const factory _LastChatResponse(
      {required final int? unreadMessage,
      required final Chat? chat}) = _$_LastChatResponse;

  factory _LastChatResponse.fromJson(Map<String, dynamic> json) =
      _$_LastChatResponse.fromJson;

  @override
  int? get unreadMessage => throw _privateConstructorUsedError;
  @override
  Chat? get chat => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LastChatResponseCopyWith<_$_LastChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String? get message => throw _privateConstructorUsedError;
  From? get from => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call({String? message, From? from, DateTime? createdDate});

  $FromCopyWith<$Res>? get from;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? from = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as From?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $FromCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $FromCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  $Res call({String? message, From? from, DateTime? createdDate});

  @override
  $FromCopyWith<$Res>? get from;
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, (v) => _then(v as _$_Chat));

  @override
  _$_Chat get _value => super._value as _$_Chat;

  @override
  $Res call({
    Object? message = freezed,
    Object? from = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_Chat(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as From?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Chat implements _Chat {
  const _$_Chat(
      {required this.message, required this.from, required this.createdDate});

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final String? message;
  @override
  final From? from;
  @override
  final DateTime? createdDate;

  @override
  String toString() {
    return 'Chat(message: $message, from: $from, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String? message,
      required final From? from,
      required final DateTime? createdDate}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  From? get from => throw _privateConstructorUsedError;
  @override
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}

From _$FromFromJson(Map<String, dynamic> json) {
  return _From.fromJson(json);
}

/// @nodoc
mixin _$From {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromCopyWith<From> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromCopyWith<$Res> {
  factory $FromCopyWith(From value, $Res Function(From) then) =
      _$FromCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? username, String? imageUrl});
}

/// @nodoc
class _$FromCopyWithImpl<$Res> implements $FromCopyWith<$Res> {
  _$FromCopyWithImpl(this._value, this._then);

  final From _value;
  // ignore: unused_field
  final $Res Function(From) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
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
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FromCopyWith<$Res> implements $FromCopyWith<$Res> {
  factory _$$_FromCopyWith(_$_From value, $Res Function(_$_From) then) =
      __$$_FromCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? username, String? imageUrl});
}

/// @nodoc
class __$$_FromCopyWithImpl<$Res> extends _$FromCopyWithImpl<$Res>
    implements _$$_FromCopyWith<$Res> {
  __$$_FromCopyWithImpl(_$_From _value, $Res Function(_$_From) _then)
      : super(_value, (v) => _then(v as _$_From));

  @override
  _$_From get _value => super._value as _$_From;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_From(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_From implements _From {
  const _$_From(
      {required this.id,
      required this.name,
      required this.username,
      required this.imageUrl});

  factory _$_From.fromJson(Map<String, dynamic> json) => _$$_FromFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'From(id: $id, name: $name, username: $username, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_From &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_FromCopyWith<_$_From> get copyWith =>
      __$$_FromCopyWithImpl<_$_From>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromToJson(this);
  }
}

abstract class _From implements From {
  const factory _From(
      {required final String? id,
      required final String? name,
      required final String? username,
      required final String? imageUrl}) = _$_From;

  factory _From.fromJson(Map<String, dynamic> json) = _$_From.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FromCopyWith<_$_From> get copyWith => throw _privateConstructorUsedError;
}
