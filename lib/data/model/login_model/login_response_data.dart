import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'login_response_data.freezed.dart';
part 'login_response_data.g.dart';

@freezed
abstract class LoginResponseData with _$LoginResponseData {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory LoginResponseData({
    required UserLogin? user,
    required Token? token,
  }) = _LoginResponseData;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);
}

@freezed
abstract class Token with _$Token {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Token({
    required String? id,
    required String? userId,
    required String? accessToken,
    required String? type,
    required String? expiration,
    required String? issuedAt,
    required bool? isExpired,
    required bool? isDelete,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@freezed
abstract class UserLogin with _$UserLogin {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserLogin({
    required String? id,
    required String? name,
    required String? dob,
    required String? username,
    required String? status,
    required String? createdDate,
    required String? modifiedDate,
    required String? email,
    required String? mobile,
    required String? imageUrl,
    required String? hospitalId,
    required HospitalLogin? hospital,
  }) = _UserLogin;

  factory UserLogin.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);
}

@freezed
abstract class HospitalLogin with _$HospitalLogin {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory HospitalLogin({
    required String? id,
    required String? alias,
    required String? name,
    required String? address,
    required String? city,
    required String? postalCode,
    required String? phone,
    required String? email,
    required String? imageUrl,
  }) = _HospitalLogin;

  factory HospitalLogin.fromJson(Map<String, dynamic> json) => _$HospitalLoginFromJson(json);
}
