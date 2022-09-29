// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatListResponse _$ChatListResponseFromJson(Map<String, dynamic> json) {
  return _ChatListResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatListResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get fromId => throw _privateConstructorUsedError;
  String? get toId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  FromChatListResponse? get from => throw _privateConstructorUsedError;
  FromChatListResponse? get to => throw _privateConstructorUsedError;
  bool? get isDelete => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdFrom => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  String? get modifiedFrom => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListResponseCopyWith<ChatListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListResponseCopyWith<$Res> {
  factory $ChatListResponseCopyWith(
          ChatListResponse value, $Res Function(ChatListResponse) then) =
      _$ChatListResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? fromId,
      String? toId,
      String? message,
      bool? isRead,
      String? imageUrl,
      FromChatListResponse? from,
      FromChatListResponse? to,
      bool? isDelete,
      String? createdBy,
      String? createdFrom,
      String? createdDate,
      String? modifiedBy,
      String? modifiedFrom,
      String? modifiedDate});

  $FromChatListResponseCopyWith<$Res>? get from;
  $FromChatListResponseCopyWith<$Res>? get to;
}

/// @nodoc
class _$ChatListResponseCopyWithImpl<$Res>
    implements $ChatListResponseCopyWith<$Res> {
  _$ChatListResponseCopyWithImpl(this._value, this._then);

  final ChatListResponse _value;
  // ignore: unused_field
  final $Res Function(ChatListResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
    Object? isRead = freezed,
    Object? imageUrl = freezed,
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
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FromChatListResponse?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as FromChatListResponse?,
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
  $FromChatListResponseCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $FromChatListResponseCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $FromChatListResponseCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $FromChatListResponseCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChatListResponseCopyWith<$Res>
    implements $ChatListResponseCopyWith<$Res> {
  factory _$$_ChatListResponseCopyWith(
          _$_ChatListResponse value, $Res Function(_$_ChatListResponse) then) =
      __$$_ChatListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? fromId,
      String? toId,
      String? message,
      bool? isRead,
      String? imageUrl,
      FromChatListResponse? from,
      FromChatListResponse? to,
      bool? isDelete,
      String? createdBy,
      String? createdFrom,
      String? createdDate,
      String? modifiedBy,
      String? modifiedFrom,
      String? modifiedDate});

  @override
  $FromChatListResponseCopyWith<$Res>? get from;
  @override
  $FromChatListResponseCopyWith<$Res>? get to;
}

/// @nodoc
class __$$_ChatListResponseCopyWithImpl<$Res>
    extends _$ChatListResponseCopyWithImpl<$Res>
    implements _$$_ChatListResponseCopyWith<$Res> {
  __$$_ChatListResponseCopyWithImpl(
      _$_ChatListResponse _value, $Res Function(_$_ChatListResponse) _then)
      : super(_value, (v) => _then(v as _$_ChatListResponse));

  @override
  _$_ChatListResponse get _value => super._value as _$_ChatListResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? message = freezed,
    Object? isRead = freezed,
    Object? imageUrl = freezed,
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
    return _then(_$_ChatListResponse(
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
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FromChatListResponse?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as FromChatListResponse?,
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
class _$_ChatListResponse
    with DiagnosticableTreeMixin
    implements _ChatListResponse {
  const _$_ChatListResponse(
      {required this.id,
      required this.fromId,
      required this.toId,
      required this.message,
      required this.isRead,
      required this.imageUrl,
      required this.from,
      required this.to,
      required this.isDelete,
      required this.createdBy,
      required this.createdFrom,
      required this.createdDate,
      required this.modifiedBy,
      required this.modifiedFrom,
      required this.modifiedDate});

  factory _$_ChatListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatListResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? fromId;
  @override
  final String? toId;
  @override
  final String? message;
  @override
  final bool? isRead;
  @override
  final String? imageUrl;
  @override
  final FromChatListResponse? from;
  @override
  final FromChatListResponse? to;
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
    return 'ChatListResponse(id: $id, fromId: $fromId, toId: $toId, message: $message, isRead: $isRead, imageUrl: $imageUrl, from: $from, to: $to, isDelete: $isDelete, createdBy: $createdBy, createdFrom: $createdFrom, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedFrom: $modifiedFrom, modifiedDate: $modifiedDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatListResponse'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fromId', fromId))
      ..add(DiagnosticsProperty('toId', toId))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
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
            other is _$_ChatListResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality().equals(other.toId, toId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
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
      const DeepCollectionEquality().hash(isRead),
      const DeepCollectionEquality().hash(imageUrl),
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
  _$$_ChatListResponseCopyWith<_$_ChatListResponse> get copyWith =>
      __$$_ChatListResponseCopyWithImpl<_$_ChatListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatListResponseToJson(this);
  }
}

abstract class _ChatListResponse implements ChatListResponse {
  const factory _ChatListResponse(
      {required final String? id,
      required final String? fromId,
      required final String? toId,
      required final String? message,
      required final bool? isRead,
      required final String? imageUrl,
      required final FromChatListResponse? from,
      required final FromChatListResponse? to,
      required final bool? isDelete,
      required final String? createdBy,
      required final String? createdFrom,
      required final String? createdDate,
      required final String? modifiedBy,
      required final String? modifiedFrom,
      required final String? modifiedDate}) = _$_ChatListResponse;

  factory _ChatListResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatListResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get fromId => throw _privateConstructorUsedError;
  @override
  String? get toId => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  bool? get isRead => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  FromChatListResponse? get from => throw _privateConstructorUsedError;
  @override
  FromChatListResponse? get to => throw _privateConstructorUsedError;
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
  _$$_ChatListResponseCopyWith<_$_ChatListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

FromChatListResponse _$FromChatListResponseFromJson(Map<String, dynamic> json) {
  return _FromChatListResponse.fromJson(json);
}

/// @nodoc
mixin _$FromChatListResponse {
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
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get hospital => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FromChatListResponseCopyWith<FromChatListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FromChatListResponseCopyWith<$Res> {
  factory $FromChatListResponseCopyWith(FromChatListResponse value,
          $Res Function(FromChatListResponse) then) =
      _$FromChatListResponseCopyWithImpl<$Res>;
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
      String? hospitalId,
      String? hospital,
      String? imageUrl,
      String? coverUrl});
}

/// @nodoc
class _$FromChatListResponseCopyWithImpl<$Res>
    implements $FromChatListResponseCopyWith<$Res> {
  _$FromChatListResponseCopyWithImpl(this._value, this._then);

  final FromChatListResponse _value;
  // ignore: unused_field
  final $Res Function(FromChatListResponse) _then;

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
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_FromChatListResponseCopyWith<$Res>
    implements $FromChatListResponseCopyWith<$Res> {
  factory _$$_FromChatListResponseCopyWith(_$_FromChatListResponse value,
          $Res Function(_$_FromChatListResponse) then) =
      __$$_FromChatListResponseCopyWithImpl<$Res>;
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
      String? hospitalId,
      String? hospital,
      String? imageUrl,
      String? coverUrl});
}

/// @nodoc
class __$$_FromChatListResponseCopyWithImpl<$Res>
    extends _$FromChatListResponseCopyWithImpl<$Res>
    implements _$$_FromChatListResponseCopyWith<$Res> {
  __$$_FromChatListResponseCopyWithImpl(_$_FromChatListResponse _value,
      $Res Function(_$_FromChatListResponse) _then)
      : super(_value, (v) => _then(v as _$_FromChatListResponse));

  @override
  _$_FromChatListResponse get _value => super._value as _$_FromChatListResponse;

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
    return _then(_$_FromChatListResponse(
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
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$_FromChatListResponse
    with DiagnosticableTreeMixin
    implements _FromChatListResponse {
  const _$_FromChatListResponse(
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
      required this.hospitalId,
      required this.hospital,
      required this.imageUrl,
      required this.coverUrl});

  factory _$_FromChatListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FromChatListResponseFromJson(json);

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
  final String? hospitalId;
  @override
  final String? hospital;
  @override
  final String? imageUrl;
  @override
  final String? coverUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FromChatListResponse(id: $id, name: $name, dob: $dob, email: $email, mobile: $mobile, username: $username, status: $status, isPatient: $isPatient, isMidwife: $isMidwife, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, isVerified: $isVerified, hospitalId: $hospitalId, hospital: $hospital, imageUrl: $imageUrl, coverUrl: $coverUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FromChatListResponse'))
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
            other is _$_FromChatListResponse &&
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
  _$$_FromChatListResponseCopyWith<_$_FromChatListResponse> get copyWith =>
      __$$_FromChatListResponseCopyWithImpl<_$_FromChatListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FromChatListResponseToJson(this);
  }
}

abstract class _FromChatListResponse implements FromChatListResponse {
  const factory _FromChatListResponse(
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
      required final String? hospitalId,
      required final String? hospital,
      required final String? imageUrl,
      required final String? coverUrl}) = _$_FromChatListResponse;

  factory _FromChatListResponse.fromJson(Map<String, dynamic> json) =
      _$_FromChatListResponse.fromJson;

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
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  String? get hospital => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FromChatListResponseCopyWith<_$_FromChatListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
