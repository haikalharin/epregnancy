// To parse this JSON data, do
//
//     final pagination = paginationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));

String paginationToJson(Pagination data) => json.encode(data.toJson());


@freezed
class Pagination with _$Pagination {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Pagination({
    required int? totalElements,
    required int? totalPages,
    required bool? last,
    required int? size,
    required int? number,
    required bool? first,
    required Sort? sort,
    required int? numberOfElements,
    required bool? empty,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@freezed
class Sort with _$Sort {
  const factory Sort({
    required bool? unsorted,
    required bool? sorted,
    required bool? empty,
  }) = _Sort;

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
}
