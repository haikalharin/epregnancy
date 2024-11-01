// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get fromId => throw _privateConstructorUsedError;
  String? get toId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get unreadCount => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  FromChatResponse? get from => throw _privateConstructorUsedError;
  FromChatResponse? get to => throw _privateConstructorUsedError;
  bool? get isDelete => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdFrom => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  String? get modifiedFrom => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? fromId,
      String? toId,
      String? message,
      String? imageUrl,
      int? unreadCount,
      bool? isRead,
      FromChatResponse? from,
      FromChatResponse? to,
      bool? isDelete,
      String? createdBy,
      String? createdFrom,
      String? createdDate,
      String? modifiedBy,
      String? modifiedFrom,
      String? modifiedDate});

  $FromChatResponseCopyWith<$Res>? get from;
  $FromChatResponseCopyWith<$Res>? get to;
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res> implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  final ChatResponse _value;
  // ignore: unused_field
  final $Res Function(ChatResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
    Object? imageUrl = freezed,
    Object? unreadCount = freezed,
    Object? isRead = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdFrom = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedFrom = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FromChatResponse?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as FromChatResponse?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdFrom: createdFrom == freezed
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: modifiedBy == freezed
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedFrom: modifiedFrom == freezed
          ? _value.modifiedFrom
          : modifiedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $FromChatResponseCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $FromChatResponseCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $FromChatResponseCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $FromChatResponseCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatResponseCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$_ChatResponseCopyWith(
          _$_ChatResponse value, $Res Function(_$_ChatResponse) then) =
      __$$_ChatResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? fromId,
      String? toId,
      String? message,
      String? imageUrl,
      int? unreadCount,
      bool? isRead,
      FromChatResponse? from,
      FromChatResponse? to,
      bool? isDelete,
      String? createdBy,
      String? createdFrom,
      String? createdDate,
      String? modifiedBy,
      String? modifiedFrom,
      String? modifiedDate});

  @override
  $FromChatResponseCopyWith<$Res>? get from;
  @override
  $FromChatResponseCopyWith<$Res>? get to;
}

/// @nodoc
class __$$_ChatResponseCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res>
    implements _$$_ChatResponseCopyWith<$Res> {
  __$$_ChatResponseCopyWithImpl(
      _$_ChatResponse _value, $Res Function(_$_ChatResponse) _then)
      : super(_value, (v) => _then(v as _$_ChatResponse));

  @override
  _$_ChatResponse get _value => super._value as _$_ChatResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
    Object? imageUrl = freezed,
    Object? unreadCount = freezed,
    Object? isRead = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdFrom = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedFrom = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_ChatResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      unreadCount: unreadCount == freezed
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FromChatResponse?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as FromChatResponse?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdFrom: createdFrom == freezed
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: modifiedBy == freezed
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedFrom: modifiedFrom == freezed
          ? _value.modifiedFrom
          : modifiedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ChatResponse with DiagnosticableTreeMixin implements _ChatResponse {
  const _$_ChatResponse(
      {required this.id,
      required this.fromId,
      required this.toId,
      required this.message,
      required this.imageUrl,
      required this.unreadCount,
      required this.isRead,
      required this.from,
      required this.to,
      required this.isDelete,
      required this.createdBy,
      required this.createdFrom,
      required this.createdDate,
      required this.modifiedBy,
      required this.modifiedFrom,
      required this.modifiedDate});

  factory _$_ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? fromId;
  @override
  final String? toId;
  @override
  final String? message;
  @override
  final String? imageUrl;
  @override
  final int? unreadCount;
  @override
  final bool? isRead;
  @override
  final FromChatResponse? from;
  @override
  final FromChatResponse? to;
  @override
  final bool? isDelete;
  @override
  final String? createdBy;
  @override
  final String? createdFrom;
  @override
  final String? createdDate;
  @override
  final String? modifiedBy;
  @override
  final String? modifiedFrom;
  @override
  final String? modifiedDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatResponse(id: $id, fromId: $fromId, toId: $toId, message: $message, imageUrl: $imageUrl, unreadCount: $unreadCount, isRead: $isRead, from: $from, to: $to, isDelete: $isDelete, createdBy: $createdBy, createdFrom: $createdFrom, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedFrom: $modifiedFrom, modifiedDate: $modifiedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fromId', fromId))
      ..add(DiagnosticsProperty('toId', toId))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('unreadCount', unreadCount))
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('isDelete', isDelete))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('createdFrom', createdFrom))
      ..add(DiagnosticsProperty('createdDate', createdDate))
      ..add(DiagnosticsProperty('modifiedBy', modifiedBy))
      ..add(DiagnosticsProperty('modifiedFrom', modifiedFrom))
      ..add(DiagnosticsProperty('modifiedDate', modifiedDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality().equals(other.toId, toId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.unreadCount, unreadCount) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.isDelete, isDelete) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality()
                .equals(other.createdFrom, createdFrom) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedBy, modifiedBy) &&
            const DeepCollectionEquality()
                .equals(other.modifiedFrom, modifiedFrom) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(fromId),
      const DeepCollectionEquality().hash(toId),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(unreadCount),
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(isDelete),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(createdFrom),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedBy),
      const DeepCollectionEquality().hash(modifiedFrom),
      const DeepCollectionEquality().hash(modifiedDate));

  @JsonKey(ignore: true)
  @override
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      __$$_ChatResponseCopyWithImpl<_$_ChatResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatResponseToJson(this);
  }
}

abstract class _ChatResponse implements ChatResponse {
  const factory _ChatResponse(
      {required final String? id,
      required final String? fromId,
      required final String? toId,
      required final String? message,
      required final String? imageUrl,
      required final int? unreadCount,
      required final bool? isRead,
      required final FromChatResponse? from,
      required final FromChatResponse? to,
      required final bool? isDelete,
      required final String? createdBy,
      required final String? createdFrom,
      required final String? createdDate,
      required final String? modifiedBy,
      required final String? modifiedFrom,
      required final String? modifiedDate}) = _$_ChatResponse;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get fromId => throw _privateConstructorUsedError;
  @override
  String? get toId => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  int? get unreadCount => throw _privateConstructorUsedError;
  @override
  bool? get isRead => throw _privateConstructorUsedError;
  @override
  FromChatResponse? get from => throw _privateConstructorUsedError;
  @override
  FromChatResponse? get to => throw _privateConstructorUsedError;
  @override
  bool? get isDelete => throw _privateConstructorUsedError;
  @override
  String? get createdBy => throw _privateConstructorUsedError;
  @override
  String? get createdFrom => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  String? get modifiedBy => throw _privateConstructorUsedError;
  @override
  String? get modifiedFrom => throw _privateConstructorUsedError;
  @override
  String? get modifiedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatResponseCopyWith<_$_ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

FromChatResponse _$FromChatResponseFromJson(Map<String, dynamic> json) {
  return _FromChatResponse.fromJson(json);
}

/// @nodoc
mixin _$FromChatResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get isPatient => throw _privateConstructorUsedError;
  bool? get isMidwife => throw _privateConstructorUsedError;
  bool? get isAdmin => throw _privateConstructorUsedError;
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  dynamic get hospitalId => throw _privateConstructorUsedError;
  dynamic get hospital => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromChatResponseCopyWith<FromChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromChatResponseCopyWith<$Res> {
  factory $FromChatResponseCopyWith(
          FromChatResponse value, $Res Function(FromChatResponse) then) =
      _$FromChatResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? dob,
      String? email,
      String? mobile,
      String? username,
      String? status,
      bool? isPatient,
      bool? isMidwife,
      bool? isAdmin,
      bool? isSuperAdmin,
      bool? isVerified,
      dynamic hospitalId,
      dynamic hospital,
      String? imageUrl,
      String? coverUrl});
}

/// @nodoc
class _$FromChatResponseCopyWithImpl<$Res>
    implements $FromChatResponseCopyWith<$Res> {
  _$FromChatResponseCopyWithImpl(this._value, this._then);

  final FromChatResponse _value;
  // ignore: unused_field
  final $Res Function(FromChatResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? isAdmin = freezed,
    Object? isSuperAdmin = freezed,
    Object? isVerified = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
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
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FromChatResponseCopyWith<$Res>
    implements $FromChatResponseCopyWith<$Res> {
  factory _$$_FromChatResponseCopyWith(
          _$_FromChatResponse value, $Res Function(_$_FromChatResponse) then) =
      __$$_FromChatResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? dob,
      String? email,
      String? mobile,
      String? username,
      String? status,
      bool? isPatient,
      bool? isMidwife,
      bool? isAdmin,
      bool? isSuperAdmin,
      bool? isVerified,
      dynamic hospitalId,
      dynamic hospital,
      String? imageUrl,
      String? coverUrl});
}

/// @nodoc
class __$$_FromChatResponseCopyWithImpl<$Res>
    extends _$FromChatResponseCopyWithImpl<$Res>
    implements _$$_FromChatResponseCopyWith<$Res> {
  __$$_FromChatResponseCopyWithImpl(
      _$_FromChatResponse _value, $Res Function(_$_FromChatResponse) _then)
      : super(_value, (v) => _then(v as _$_FromChatResponse));

  @override
  _$_FromChatResponse get _value => super._value as _$_FromChatResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? isAdmin = freezed,
    Object? isSuperAdmin = freezed,
    Object? isVerified = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_$_FromChatResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as dynamic,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_FromChatResponse
    with DiagnosticableTreeMixin
    implements _FromChatResponse {
  const _$_FromChatResponse(
      {required this.id,
      required this.name,
      required this.dob,
      required this.email,
      required this.mobile,
      required this.username,
      required this.status,
      required this.isPatient,
      required this.isMidwife,
      required this.isAdmin,
      required this.isSuperAdmin,
      required this.isVerified,
      this.hospitalId,
      this.hospital,
      required this.imageUrl,
      required this.coverUrl});

  factory _$_FromChatResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FromChatResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? dob;
  @override
  final String? email;
  @override
  final String? mobile;
  @override
  final String? username;
  @override
  final String? status;
  @override
  final bool? isPatient;
  @override
  final bool? isMidwife;
  @override
  final bool? isAdmin;
  @override
  final bool? isSuperAdmin;
  @override
  final bool? isVerified;
  @override
  final dynamic hospitalId;
  @override
  final dynamic hospital;
  @override
  final String? imageUrl;
  @override
  final String? coverUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FromChatResponse(id: $id, name: $name, dob: $dob, email: $email, mobile: $mobile, username: $username, status: $status, isPatient: $isPatient, isMidwife: $isMidwife, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, isVerified: $isVerified, hospitalId: $hospitalId, hospital: $hospital, imageUrl: $imageUrl, coverUrl: $coverUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FromChatResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('dob', dob))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isPatient', isPatient))
      ..add(DiagnosticsProperty('isMidwife', isMidwife))
      ..add(DiagnosticsProperty('isAdmin', isAdmin))
      ..add(DiagnosticsProperty('isSuperAdmin', isSuperAdmin))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('hospitalId', hospitalId))
      ..add(DiagnosticsProperty('hospital', hospital))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('coverUrl', coverUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FromChatResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.isPatient, isPatient) &&
            const DeepCollectionEquality().equals(other.isMidwife, isMidwife) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality()
                .equals(other.isSuperAdmin, isSuperAdmin) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality().equals(other.hospital, hospital) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.coverUrl, coverUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(mobile),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isPatient),
      const DeepCollectionEquality().hash(isMidwife),
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(isSuperAdmin),
      const DeepCollectionEquality().hash(isVerified),
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(hospital),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(coverUrl));

  @JsonKey(ignore: true)
  @override
  _$$_FromChatResponseCopyWith<_$_FromChatResponse> get copyWith =>
      __$$_FromChatResponseCopyWithImpl<_$_FromChatResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromChatResponseToJson(this);
  }
}

abstract class _FromChatResponse implements FromChatResponse {
  const factory _FromChatResponse(
      {required final String? id,
      required final String? name,
      required final String? dob,
      required final String? email,
      required final String? mobile,
      required final String? username,
      required final String? status,
      required final bool? isPatient,
      required final bool? isMidwife,
      required final bool? isAdmin,
      required final bool? isSuperAdmin,
      required final bool? isVerified,
      final dynamic hospitalId,
      final dynamic hospital,
      required final String? imageUrl,
      required final String? coverUrl}) = _$_FromChatResponse;

  factory _FromChatResponse.fromJson(Map<String, dynamic> json) =
      _$_FromChatResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get dob => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get mobile => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  bool? get isPatient => throw _privateConstructorUsedError;
  @override
  bool? get isMidwife => throw _privateConstructorUsedError;
  @override
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  @override
  bool? get isVerified => throw _privateConstructorUsedError;
  @override
  dynamic get hospitalId => throw _privateConstructorUsedError;
  @override
  dynamic get hospital => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FromChatResponseCopyWith<_$_FromChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
