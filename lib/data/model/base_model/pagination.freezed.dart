// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int? get totalElements => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  bool? get last => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  bool? get first => throw _privateConstructorUsedError;
  Sort? get sort => throw _privateConstructorUsedError;
  int? get numberOfElements => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res>;
  $Res call(
      {int? totalElements,
      int? totalPages,
      bool? last,
      int? size,
      int? number,
      bool? first,
      Sort? sort,
      int? numberOfElements,
      bool? empty});

  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  final Pagination _value;
  // ignore: unused_field
  final $Res Function(Pagination) _then;

  @override
  $Res call({
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? first = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      totalElements: totalElements == freezed
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      numberOfElements: numberOfElements == freezed
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      empty: empty == freezed
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $SortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value));
    });
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination value, $Res Function(_$_Pagination) then) =
      __$$_PaginationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? totalElements,
      int? totalPages,
      bool? last,
      int? size,
      int? number,
      bool? first,
      Sort? sort,
      int? numberOfElements,
      bool? empty});

  @override
  $SortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$_PaginationCopyWithImpl<$Res> extends _$PaginationCopyWithImpl<$Res>
    implements _$$_PaginationCopyWith<$Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination _value, $Res Function(_$_Pagination) _then)
      : super(_value, (v) => _then(v as _$_Pagination));

  @override
  _$_Pagination get _value => super._value as _$_Pagination;

  @override
  $Res call({
    Object? totalElements = freezed,
    Object? totalPages = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? first = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? empty = freezed,
  }) {
    return _then(_$_Pagination(
      totalElements: totalElements == freezed
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: totalPages == freezed
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Sort?,
      numberOfElements: numberOfElements == freezed
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      empty: empty == freezed
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Pagination implements _Pagination {
  const _$_Pagination(
      {required this.totalElements,
      required this.totalPages,
      required this.last,
      required this.size,
      required this.number,
      required this.first,
      required this.sort,
      required this.numberOfElements,
      required this.empty});

  factory _$_Pagination.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationFromJson(json);

  @override
  final int? totalElements;
  @override
  final int? totalPages;
  @override
  final bool? last;
  @override
  final int? size;
  @override
  final int? number;
  @override
  final bool? first;
  @override
  final Sort? sort;
  @override
  final int? numberOfElements;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'Pagination(totalElements: $totalElements, totalPages: $totalPages, last: $last, size: $size, number: $number, first: $first, sort: $sort, numberOfElements: $numberOfElements, empty: $empty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination &&
            const DeepCollectionEquality()
                .equals(other.totalElements, totalElements) &&
            const DeepCollectionEquality()
                .equals(other.totalPages, totalPages) &&
            const DeepCollectionEquality().equals(other.last, last) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.sort, sort) &&
            const DeepCollectionEquality()
                .equals(other.numberOfElements, numberOfElements) &&
            const DeepCollectionEquality().equals(other.empty, empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalElements),
      const DeepCollectionEquality().hash(totalPages),
      const DeepCollectionEquality().hash(last),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(sort),
      const DeepCollectionEquality().hash(numberOfElements),
      const DeepCollectionEquality().hash(empty));

  @JsonKey(ignore: true)
  @override
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      __$$_PaginationCopyWithImpl<_$_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationToJson(this);
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {required final int? totalElements,
      required final int? totalPages,
      required final bool? last,
      required final int? size,
      required final int? number,
      required final bool? first,
      required final Sort? sort,
      required final int? numberOfElements,
      required final bool? empty}) = _$_Pagination;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$_Pagination.fromJson;

  @override
  int? get totalElements => throw _privateConstructorUsedError;
  @override
  int? get totalPages => throw _privateConstructorUsedError;
  @override
  bool? get last => throw _privateConstructorUsedError;
  @override
  int? get size => throw _privateConstructorUsedError;
  @override
  int? get number => throw _privateConstructorUsedError;
  @override
  bool? get first => throw _privateConstructorUsedError;
  @override
  Sort? get sort => throw _privateConstructorUsedError;
  @override
  int? get numberOfElements => throw _privateConstructorUsedError;
  @override
  bool? get empty => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

Sort _$SortFromJson(Map<String, dynamic> json) {
  return _Sort.fromJson(json);
}

/// @nodoc
mixin _$Sort {
  bool? get unsorted => throw _privateConstructorUsedError;
  bool? get sorted => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortCopyWith<Sort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortCopyWith<$Res> {
  factory $SortCopyWith(Sort value, $Res Function(Sort) then) =
      _$SortCopyWithImpl<$Res>;
  $Res call({bool? unsorted, bool? sorted, bool? empty});
}

/// @nodoc
class _$SortCopyWithImpl<$Res> implements $SortCopyWith<$Res> {
  _$SortCopyWithImpl(this._value, this._then);

  final Sort _value;
  // ignore: unused_field
  final $Res Function(Sort) _then;

  @override
  $Res call({
    Object? unsorted = freezed,
    Object? sorted = freezed,
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      unsorted: unsorted == freezed
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sorted: sorted == freezed
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: empty == freezed
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_SortCopyWith<$Res> implements $SortCopyWith<$Res> {
  factory _$$_SortCopyWith(_$_Sort value, $Res Function(_$_Sort) then) =
      __$$_SortCopyWithImpl<$Res>;
  @override
  $Res call({bool? unsorted, bool? sorted, bool? empty});
}

/// @nodoc
class __$$_SortCopyWithImpl<$Res> extends _$SortCopyWithImpl<$Res>
    implements _$$_SortCopyWith<$Res> {
  __$$_SortCopyWithImpl(_$_Sort _value, $Res Function(_$_Sort) _then)
      : super(_value, (v) => _then(v as _$_Sort));

  @override
  _$_Sort get _value => super._value as _$_Sort;

  @override
  $Res call({
    Object? unsorted = freezed,
    Object? sorted = freezed,
    Object? empty = freezed,
  }) {
    return _then(_$_Sort(
      unsorted: unsorted == freezed
          ? _value.unsorted
          : unsorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      sorted: sorted == freezed
          ? _value.sorted
          : sorted // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: empty == freezed
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sort implements _Sort {
  const _$_Sort(
      {required this.unsorted, required this.sorted, required this.empty});

  factory _$_Sort.fromJson(Map<String, dynamic> json) => _$$_SortFromJson(json);

  @override
  final bool? unsorted;
  @override
  final bool? sorted;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'Sort(unsorted: $unsorted, sorted: $sorted, empty: $empty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sort &&
            const DeepCollectionEquality().equals(other.unsorted, unsorted) &&
            const DeepCollectionEquality().equals(other.sorted, sorted) &&
            const DeepCollectionEquality().equals(other.empty, empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(unsorted),
      const DeepCollectionEquality().hash(sorted),
      const DeepCollectionEquality().hash(empty));

  @JsonKey(ignore: true)
  @override
  _$$_SortCopyWith<_$_Sort> get copyWith =>
      __$$_SortCopyWithImpl<_$_Sort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortToJson(this);
  }
}

abstract class _Sort implements Sort {
  const factory _Sort(
      {required final bool? unsorted,
      required final bool? sorted,
      required final bool? empty}) = _$_Sort;

  factory _Sort.fromJson(Map<String, dynamic> json) = _$_Sort.fromJson;

  @override
  bool? get unsorted => throw _privateConstructorUsedError;
  @override
  bool? get sorted => throw _privateConstructorUsedError;
  @override
  bool? get empty => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SortCopyWith<_$_Sort> get copyWith => throw _privateConstructorUsedError;
}
