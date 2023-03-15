// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponseData _$$_LoginResponseDataFromJson(Map<String, dynamic> json) =>
    _$_LoginResponseData(
      user: json['user'] == null
          ? null
          : UserLogin.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginResponseDataToJson(
        _$_LoginResponseData instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'token': instance.token?.toJson(),
    };

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      type: json['type'] as String?,
      expiration: json['expiration'] as String?,
      issuedAt: json['issued_at'] as String?,
      isExpired: json['is_expired'] as bool?,
      isDelete: json['is_delete'] as bool?,
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'type': instance.type,
      'expiration': instance.expiration,
      'issued_at': instance.issuedAt,
      'is_expired': instance.isExpired,
      'is_delete': instance.isDelete,
    };

_$_UserLogin _$$_UserLoginFromJson(Map<String, dynamic> json) => _$_UserLogin(
      id: json['id'] as String?,
      name: json['name'] as String?,
      dob: json['dob'] as String?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      createdDate: json['created_date'] as String?,
      modifiedDate: json['modified_date'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      imageUrl: json['image_url'] as String?,
      hospitalId: json['hospital_id'] as String?,
      hospital: json['hospital'] == null
          ? null
          : HospitalLogin.fromJson(json['hospital'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserLoginToJson(_$_UserLogin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dob': instance.dob,
      'username': instance.username,
      'status': instance.status,
      'created_date': instance.createdDate,
      'modified_date': instance.modifiedDate,
      'email': instance.email,
      'mobile': instance.mobile,
      'image_url': instance.imageUrl,
      'hospital_id': instance.hospitalId,
      'hospital': instance.hospital?.toJson(),
    };

_$_HospitalLogin _$$_HospitalLoginFromJson(Map<String, dynamic> json) =>
    _$_HospitalLogin(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_HospitalLoginToJson(_$_HospitalLogin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'email': instance.email,
      'image_url': instance.imageUrl,
    };
