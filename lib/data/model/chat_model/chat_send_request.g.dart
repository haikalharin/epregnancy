// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_send_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatSendRequest _$$_ChatSendRequestFromJson(Map<String, dynamic> json) =>
    _$_ChatSendRequest(
      fromId: json['from_id'] as String?,
      toId: json['to_id'] as String?,
      message: json['message'] as String?,
      imageBase64: json['image_base64'] as String?,
    );

Map<String, dynamic> _$$_ChatSendRequestToJson(_$_ChatSendRequest instance) =>
    <String, dynamic>{
      'from_id': instance.fromId,
      'to_id': instance.toId,
      'message': instance.message,
      'image_base64': instance.imageBase64,
    };
