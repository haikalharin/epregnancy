// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

@freezed
abstract class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    @JsonKey(includeIfNull: true)
    String? id,
    @JsonKey(includeIfNull: true)
    String? title,
    @JsonKey(includeIfNull: true)
    String? category,
    @JsonKey(includeIfNull: true)
    String? tags,
    @JsonKey(name: 'short_description',includeIfNull: true)
    String? shortDescription,
    @JsonKey(name: 'long_description',includeIfNull: true)
    String? longDescription,
    @JsonKey(name: 'publish_date',includeIfNull: true)
    String? publishDate,
    @JsonKey(includeIfNull: true)
    String? status,
    @JsonKey(name: 'image_url',includeIfNull: true)
    String? imageUrl,
    @JsonKey(name: 'is_delete',includeIfNull: true)
    bool? isDelete,
    @JsonKey(name: 'created_by',includeIfNull: true)
    String? createdBy,
    @JsonKey(name: 'created_from',includeIfNull: true)
    String? createdFrom,
    @JsonKey(name: 'created_Date',includeIfNull: true)
    String? createdDate,
    @JsonKey(name: 'modified_by',includeIfNull: true)
    String? modifiedBy,
    @JsonKey(name: 'modified_from',includeIfNull: true)
    String? modifiedFrom,
    @JsonKey(name: 'modified_date',includeIfNull: true)
    String? modifiedDate,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}
