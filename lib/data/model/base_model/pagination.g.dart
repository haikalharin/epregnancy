// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pagination _$$_PaginationFromJson(Map<String, dynamic> json) =>
    _$_Pagination(
      totalElements: json['total_elements'] as int?,
      totalPages: json['total_pages'] as int?,
      last: json['last'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      first: json['first'] as bool?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: json['number_of_elements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$_PaginationToJson(_$_Pagination instance) =>
    <String, dynamic>{
      'total_elements': instance.totalElements,
      'total_pages': instance.totalPages,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'sort': instance.sort?.toJson(),
      'number_of_elements': instance.numberOfElements,
      'empty': instance.empty,
    };

_$_Sort _$$_SortFromJson(Map<String, dynamic> json) => _$_Sort(
      unsorted: json['unsorted'] as bool?,
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$_SortToJson(_$_Sort instance) => <String, dynamic>{
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
      'empty': instance.empty,
    };
