// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) {
  return _LoginResponseData.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseData {
  UserLogin? get user => throw _privateConstructorUsedError;
  Token? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseDataCopyWith<LoginResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseDataCopyWith<$Res> {
  factory $LoginResponseDataCopyWith(
          LoginResponseData value, $Res Function(LoginResponseData) then) =
      _$LoginResponseDataCopyWithImpl<$Res>;
  $Res call({UserLogin? user, Token? token});

  $UserLoginCopyWith<$Res>? get user;
  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class _$LoginResponseDataCopyWithImpl<$Res>
    implements $LoginResponseDataCopyWith<$Res> {
  _$LoginResponseDataCopyWithImpl(this._value, this._then);

  final LoginResponseData _value;
  // ignore: unused_field
  final $Res Function(LoginResponseData) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserLogin?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
    ));
  }

  @override
  $UserLoginCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserLoginCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $TokenCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoginResponseDataCopyWith<$Res>
    implements $LoginResponseDataCopyWith<$Res> {
  factory _$$_LoginResponseDataCopyWith(_$_LoginResponseData value,
          $Res Function(_$_LoginResponseData) then) =
      __$$_LoginResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({UserLogin? user, Token? token});

  @override
  $UserLoginCopyWith<$Res>? get user;
  @override
  $TokenCopyWith<$Res>? get token;
}

/// @nodoc
class __$$_LoginResponseDataCopyWithImpl<$Res>
    extends _$LoginResponseDataCopyWithImpl<$Res>
    implements _$$_LoginResponseDataCopyWith<$Res> {
  __$$_LoginResponseDataCopyWithImpl(
      _$_LoginResponseData _value, $Res Function(_$_LoginResponseData) _then)
      : super(_value, (v) => _then(v as _$_LoginResponseData));

  @override
  _$_LoginResponseData get _value => super._value as _$_LoginResponseData;

  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_LoginResponseData(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserLogin?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_LoginResponseData
    with DiagnosticableTreeMixin
    implements _LoginResponseData {
  const _$_LoginResponseData({required this.user, required this.token});

  factory _$_LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResponseDataFromJson(json);

  @override
  final UserLogin? user;
  @override
  final Token? token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginResponseData(user: $user, token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginResponseData'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginResponseData &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_LoginResponseDataCopyWith<_$_LoginResponseData> get copyWith =>
      __$$_LoginResponseDataCopyWithImpl<_$_LoginResponseData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResponseDataToJson(this);
  }
}

abstract class _LoginResponseData implements LoginResponseData {
  const factory _LoginResponseData(
      {required final UserLogin? user,
      required final Token? token}) = _$_LoginResponseData;

  factory _LoginResponseData.fromJson(Map<String, dynamic> json) =
      _$_LoginResponseData.fromJson;

  @override
  UserLogin? get user => throw _privateConstructorUsedError;
  @override
  Token? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResponseDataCopyWith<_$_LoginResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get expiration => throw _privateConstructorUsedError;
  String? get issuedAt => throw _privateConstructorUsedError;
  bool? get isExpired => throw _privateConstructorUsedError;
  bool? get isDelete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? userId,
      String? accessToken,
      String? type,
      String? expiration,
      String? issuedAt,
      bool? isExpired,
      bool? isDelete});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? accessToken = freezed,
    Object? type = freezed,
    Object? expiration = freezed,
    Object? issuedAt = freezed,
    Object? isExpired = freezed,
    Object? isDelete = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      expiration: expiration == freezed
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedAt: issuedAt == freezed
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? userId,
      String? accessToken,
      String? type,
      String? expiration,
      String? issuedAt,
      bool? isExpired,
      bool? isDelete});
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, (v) => _then(v as _$_Token));

  @override
  _$_Token get _value => super._value as _$_Token;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? accessToken = freezed,
    Object? type = freezed,
    Object? expiration = freezed,
    Object? issuedAt = freezed,
    Object? isExpired = freezed,
    Object? isDelete = freezed,
  }) {
    return _then(_$_Token(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      expiration: expiration == freezed
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedAt: issuedAt == freezed
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Token with DiagnosticableTreeMixin implements _Token {
  const _$_Token(
      {required this.id,
      required this.userId,
      required this.accessToken,
      required this.type,
      required this.expiration,
      required this.issuedAt,
      required this.isExpired,
      required this.isDelete});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? accessToken;
  @override
  final String? type;
  @override
  final String? expiration;
  @override
  final String? issuedAt;
  @override
  final bool? isExpired;
  @override
  final bool? isDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Token(id: $id, userId: $userId, accessToken: $accessToken, type: $type, expiration: $expiration, issuedAt: $issuedAt, isExpired: $isExpired, isDelete: $isDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Token'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('expiration', expiration))
      ..add(DiagnosticsProperty('issuedAt', issuedAt))
      ..add(DiagnosticsProperty('isExpired', isExpired))
      ..add(DiagnosticsProperty('isDelete', isDelete));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.expiration, expiration) &&
            const DeepCollectionEquality().equals(other.issuedAt, issuedAt) &&
            const DeepCollectionEquality().equals(other.isExpired, isExpired) &&
            const DeepCollectionEquality().equals(other.isDelete, isDelete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(expiration),
      const DeepCollectionEquality().hash(issuedAt),
      const DeepCollectionEquality().hash(isExpired),
      const DeepCollectionEquality().hash(isDelete));

  @JsonKey(ignore: true)
  @override
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(this);
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {required final String? id,
      required final String? userId,
      required final String? accessToken,
      required final String? type,
      required final String? expiration,
      required final String? issuedAt,
      required final bool? isExpired,
      required final bool? isDelete}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get accessToken => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get expiration => throw _privateConstructorUsedError;
  @override
  String? get issuedAt => throw _privateConstructorUsedError;
  @override
  bool? get isExpired => throw _privateConstructorUsedError;
  @override
  bool? get isDelete => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) {
  return _UserLogin.fromJson(json);
}

/// @nodoc
mixin _$UserLogin {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  HospitalLogin? get hospital => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginCopyWith<UserLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginCopyWith<$Res> {
  factory $UserLoginCopyWith(UserLogin value, $Res Function(UserLogin) then) =
      _$UserLoginCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? dob,
      String? username,
      String? status,
      String? createdDate,
      String? modifiedDate,
      String? email,
      String? mobile,
      String? imageUrl,
      String? hospitalId,
      HospitalLogin? hospital});

  $HospitalLoginCopyWith<$Res>? get hospital;
}

/// @nodoc
class _$UserLoginCopyWithImpl<$Res> implements $UserLoginCopyWith<$Res> {
  _$UserLoginCopyWithImpl(this._value, this._then);

  final UserLogin _value;
  // ignore: unused_field
  final $Res Function(UserLogin) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? imageUrl = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
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
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalLogin?,
    ));
  }

  @override
  $HospitalLoginCopyWith<$Res>? get hospital {
    if (_value.hospital == null) {
      return null;
    }

    return $HospitalLoginCopyWith<$Res>(_value.hospital!, (value) {
      return _then(_value.copyWith(hospital: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserLoginCopyWith<$Res> implements $UserLoginCopyWith<$Res> {
  factory _$$_UserLoginCopyWith(
          _$_UserLogin value, $Res Function(_$_UserLogin) then) =
      __$$_UserLoginCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? dob,
      String? username,
      String? status,
      String? createdDate,
      String? modifiedDate,
      String? email,
      String? mobile,
      String? imageUrl,
      String? hospitalId,
      HospitalLogin? hospital});

  @override
  $HospitalLoginCopyWith<$Res>? get hospital;
}

/// @nodoc
class __$$_UserLoginCopyWithImpl<$Res> extends _$UserLoginCopyWithImpl<$Res>
    implements _$$_UserLoginCopyWith<$Res> {
  __$$_UserLoginCopyWithImpl(
      _$_UserLogin _value, $Res Function(_$_UserLogin) _then)
      : super(_value, (v) => _then(v as _$_UserLogin));

  @override
  _$_UserLogin get _value => super._value as _$_UserLogin;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? imageUrl = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
  }) {
    return _then(_$_UserLogin(
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
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as HospitalLogin?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserLogin with DiagnosticableTreeMixin implements _UserLogin {
  const _$_UserLogin(
      {required this.id,
      required this.name,
      required this.dob,
      required this.username,
      required this.status,
      required this.createdDate,
      required this.modifiedDate,
      required this.email,
      required this.mobile,
      required this.imageUrl,
      required this.hospitalId,
      required this.hospital});

  factory _$_UserLogin.fromJson(Map<String, dynamic> json) =>
      _$$_UserLoginFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? dob;
  @override
  final String? username;
  @override
  final String? status;
  @override
  final String? createdDate;
  @override
  final String? modifiedDate;
  @override
  final String? email;
  @override
  final String? mobile;
  @override
  final String? imageUrl;
  @override
  final String? hospitalId;
  @override
  final HospitalLogin? hospital;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserLogin(id: $id, name: $name, dob: $dob, username: $username, status: $status, createdDate: $createdDate, modifiedDate: $modifiedDate, email: $email, mobile: $mobile, imageUrl: $imageUrl, hospitalId: $hospitalId, hospital: $hospital)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserLogin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('dob', dob))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('createdDate', createdDate))
      ..add(DiagnosticsProperty('modifiedDate', modifiedDate))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('hospitalId', hospitalId))
      ..add(DiagnosticsProperty('hospital', hospital));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLogin &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality().equals(other.hospital, hospital));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedDate),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(mobile),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(hospital));

  @JsonKey(ignore: true)
  @override
  _$$_UserLoginCopyWith<_$_UserLogin> get copyWith =>
      __$$_UserLoginCopyWithImpl<_$_UserLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLoginToJson(this);
  }
}

abstract class _UserLogin implements UserLogin {
  const factory _UserLogin(
      {required final String? id,
      required final String? name,
      required final String? dob,
      required final String? username,
      required final String? status,
      required final String? createdDate,
      required final String? modifiedDate,
      required final String? email,
      required final String? mobile,
      required final String? imageUrl,
      required final String? hospitalId,
      required final HospitalLogin? hospital}) = _$_UserLogin;

  factory _UserLogin.fromJson(Map<String, dynamic> json) =
      _$_UserLogin.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get dob => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  String? get modifiedDate => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get mobile => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  HospitalLogin? get hospital => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserLoginCopyWith<_$_UserLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

HospitalLogin _$HospitalLoginFromJson(Map<String, dynamic> json) {
  return _HospitalLogin.fromJson(json);
}

/// @nodoc
mixin _$HospitalLogin {
  String? get id => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HospitalLoginCopyWith<HospitalLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalLoginCopyWith<$Res> {
  factory $HospitalLoginCopyWith(
          HospitalLogin value, $Res Function(HospitalLogin) then) =
      _$HospitalLoginCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? alias,
      String? name,
      String? address,
      String? city,
      String? postalCode,
      String? phone,
      String? email,
      String? imageUrl});
}

/// @nodoc
class _$HospitalLoginCopyWithImpl<$Res>
    implements $HospitalLoginCopyWith<$Res> {
  _$HospitalLoginCopyWithImpl(this._value, this._then);

  final HospitalLogin _value;
  // ignore: unused_field
  final $Res Function(HospitalLogin) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HospitalLoginCopyWith<$Res>
    implements $HospitalLoginCopyWith<$Res> {
  factory _$$_HospitalLoginCopyWith(
          _$_HospitalLogin value, $Res Function(_$_HospitalLogin) then) =
      __$$_HospitalLoginCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? alias,
      String? name,
      String? address,
      String? city,
      String? postalCode,
      String? phone,
      String? email,
      String? imageUrl});
}

/// @nodoc
class __$$_HospitalLoginCopyWithImpl<$Res>
    extends _$HospitalLoginCopyWithImpl<$Res>
    implements _$$_HospitalLoginCopyWith<$Res> {
  __$$_HospitalLoginCopyWithImpl(
      _$_HospitalLogin _value, $Res Function(_$_HospitalLogin) _then)
      : super(_value, (v) => _then(v as _$_HospitalLogin));

  @override
  _$_HospitalLogin get _value => super._value as _$_HospitalLogin;

  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_HospitalLogin(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$_HospitalLogin with DiagnosticableTreeMixin implements _HospitalLogin {
  const _$_HospitalLogin(
      {required this.id,
      required this.alias,
      required this.name,
      required this.address,
      required this.city,
      required this.postalCode,
      required this.phone,
      required this.email,
      required this.imageUrl});

  factory _$_HospitalLogin.fromJson(Map<String, dynamic> json) =>
      _$$_HospitalLoginFromJson(json);

  @override
  final String? id;
  @override
  final String? alias;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? postalCode;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HospitalLogin(id: $id, alias: $alias, name: $name, address: $address, city: $city, postalCode: $postalCode, phone: $phone, email: $email, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HospitalLogin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('alias', alias))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('postalCode', postalCode))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HospitalLogin &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.alias, alias) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(alias),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(postalCode),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalLoginCopyWith<_$_HospitalLogin> get copyWith =>
      __$$_HospitalLoginCopyWithImpl<_$_HospitalLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HospitalLoginToJson(this);
  }
}

abstract class _HospitalLogin implements HospitalLogin {
  const factory _HospitalLogin(
      {required final String? id,
      required final String? alias,
      required final String? name,
      required final String? address,
      required final String? city,
      required final String? postalCode,
      required final String? phone,
      required final String? email,
      required final String? imageUrl}) = _$_HospitalLogin;

  factory _HospitalLogin.fromJson(Map<String, dynamic> json) =
      _$_HospitalLogin.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get alias => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalLoginCopyWith<_$_HospitalLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
