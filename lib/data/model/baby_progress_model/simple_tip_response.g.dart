// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_tip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleTipResponse _$$_SimpleTipResponseFromJson(Map<String, dynamic> json) =>
    _$_SimpleTipResponse(
      articleId: json['article_id'] as String?,
      tips: json['tips'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$$_SimpleTipResponseToJson(
        _$_SimpleTipResponse instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'tips': instance.tips,
      'web_url': instance.webUrl,
    };
