// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LastChatResponse _$$_LastChatResponseFromJson(Map<String, dynamic> json) =>
    _$_LastChatResponse(
      unreadMessage: json['unread_message'] as int?,
      chat: json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LastChatResponseToJson(_$_LastChatResponse instance) =>
    <String, dynamic>{
      'unread_message': instance.unreadMessage,
      'chat': instance.chat?.toJson(),
    };

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      message: json['message'] as String?,
      from: json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>),
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'message': instance.message,
      'from': instance.from?.toJson(),
      'created_date': instance.createdDate?.toIso8601String(),
    };

_$_From _$$_FromFromJson(Map<String, dynamic> json) => _$_From(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$_FromToJson(_$_From instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'image_url': instance.imageUrl,
    };
