// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_pending_send_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatPendingSendRequest _$$_ChatPendingSendRequestFromJson(
        Map<String, dynamic> json) =>
    _$_ChatPendingSendRequest(
      fromId: json['from_id'] as String?,
      hospitalId: json['hospital_id'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ChatPendingSendRequestToJson(
        _$_ChatPendingSendRequest instance) =>
    <String, dynamic>{
      'from_id': instance.fromId,
      'hospital_id': instance.hospitalId,
      'message': instance.message,
    };
