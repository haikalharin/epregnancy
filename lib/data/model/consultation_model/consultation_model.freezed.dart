// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'consultation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultationModel _$ConsultationModelFromJson(Map<String, dynamic> json) {
  return _ConsultationModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultationModel {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  List<Like>? get likes => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count', includeIfNull: true)
  int? get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count', includeIfNull: true)
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_base64', includeIfNull: true)
  String? get imageBase64 => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_delete', includeIfNull: true)
  bool? get isDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by', includeIfNull: true)
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_from', includeIfNull: true)
  String? get createdFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_date', includeIfNull: true)
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by', includeIfNull: true)
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_from', includeIfNull: true)
  String? get modifiedFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_Date', includeIfNull: true)
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultationModelCopyWith<ConsultationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationModelCopyWith<$Res> {
  factory $ConsultationModelCopyWith(
          ConsultationModel value, $Res Function(ConsultationModel) then) =
      _$ConsultationModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          String? userId,
      @JsonKey(includeIfNull: true)
          String? message,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(includeIfNull: true)
          User? user,
      @JsonKey(includeIfNull: true)
          List<Comment>? comments,
      @JsonKey(includeIfNull: true)
          List<Like>? likes,
      @JsonKey(name: 'comments_count', includeIfNull: true)
          int? commentsCount,
      @JsonKey(name: 'likes_count', includeIfNull: true)
          int? likesCount,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'image_base64', includeIfNull: true)
          String? imageBase64,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          bool? isDelete,
      @JsonKey(name: 'created_by', includeIfNull: true)
          String? createdBy,
      @JsonKey(name: 'created_from', includeIfNull: true)
          String? createdFrom,
      @JsonKey(name: 'created_date', includeIfNull: true)
          String? createdDate,
      @JsonKey(name: 'modified_by', includeIfNull: true)
          String? modifiedBy,
      @JsonKey(name: 'modified_from', includeIfNull: true)
          String? modifiedFrom,
      @JsonKey(name: 'modified_Date', includeIfNull: true)
          String? modifiedDate});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ConsultationModelCopyWithImpl<$Res>
    implements $ConsultationModelCopyWith<$Res> {
  _$ConsultationModelCopyWithImpl(this._value, this._then);

  final ConsultationModel _value;
  // ignore: unused_field
  final $Res Function(ConsultationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? commentsCount = freezed,
    Object? likesCount = freezed,
    Object? imageUrl = freezed,
    Object? imageBase64 = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdFrom = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedFrom = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      commentsCount: commentsCount == freezed
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase64: imageBase64 == freezed
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdFrom: createdFrom == freezed
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: modifiedBy == freezed
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedFrom: modifiedFrom == freezed
          ? _value.modifiedFrom
          : modifiedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_ConsultationModelCopyWith<$Res>
    implements $ConsultationModelCopyWith<$Res> {
  factory _$$_ConsultationModelCopyWith(_$_ConsultationModel value,
          $Res Function(_$_ConsultationModel) then) =
      __$$_ConsultationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          String? userId,
      @JsonKey(includeIfNull: true)
          String? message,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(includeIfNull: true)
          User? user,
      @JsonKey(includeIfNull: true)
          List<Comment>? comments,
      @JsonKey(includeIfNull: true)
          List<Like>? likes,
      @JsonKey(name: 'comments_count', includeIfNull: true)
          int? commentsCount,
      @JsonKey(name: 'likes_count', includeIfNull: true)
          int? likesCount,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'image_base64', includeIfNull: true)
          String? imageBase64,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          bool? isDelete,
      @JsonKey(name: 'created_by', includeIfNull: true)
          String? createdBy,
      @JsonKey(name: 'created_from', includeIfNull: true)
          String? createdFrom,
      @JsonKey(name: 'created_date', includeIfNull: true)
          String? createdDate,
      @JsonKey(name: 'modified_by', includeIfNull: true)
          String? modifiedBy,
      @JsonKey(name: 'modified_from', includeIfNull: true)
          String? modifiedFrom,
      @JsonKey(name: 'modified_Date', includeIfNull: true)
          String? modifiedDate});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ConsultationModelCopyWithImpl<$Res>
    extends _$ConsultationModelCopyWithImpl<$Res>
    implements _$$_ConsultationModelCopyWith<$Res> {
  __$$_ConsultationModelCopyWithImpl(
      _$_ConsultationModel _value, $Res Function(_$_ConsultationModel) _then)
      : super(_value, (v) => _then(v as _$_ConsultationModel));

  @override
  _$_ConsultationModel get _value => super._value as _$_ConsultationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? commentsCount = freezed,
    Object? likesCount = freezed,
    Object? imageUrl = freezed,
    Object? imageBase64 = freezed,
    Object? isDelete = freezed,
    Object? createdBy = freezed,
    Object? createdFrom = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedFrom = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_ConsultationModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      commentsCount: commentsCount == freezed
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase64: imageBase64 == freezed
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdFrom: createdFrom == freezed
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: modifiedBy == freezed
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedFrom: modifiedFrom == freezed
          ? _value.modifiedFrom
          : modifiedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConsultationModel implements _ConsultationModel {
  const _$_ConsultationModel(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(name: 'user_id', includeIfNull: true) this.userId,
      @JsonKey(includeIfNull: true) this.message,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(includeIfNull: true) this.user,
      @JsonKey(includeIfNull: true) final List<Comment>? comments,
      @JsonKey(includeIfNull: true) final List<Like>? likes,
      @JsonKey(name: 'comments_count', includeIfNull: true) this.commentsCount,
      @JsonKey(name: 'likes_count', includeIfNull: true) this.likesCount,
      @JsonKey(name: 'image_url', includeIfNull: true) this.imageUrl,
      @JsonKey(name: 'image_base64', includeIfNull: true) this.imageBase64,
      @JsonKey(name: 'is_delete', includeIfNull: true) this.isDelete,
      @JsonKey(name: 'created_by', includeIfNull: true) this.createdBy,
      @JsonKey(name: 'created_from', includeIfNull: true) this.createdFrom,
      @JsonKey(name: 'created_date', includeIfNull: true) this.createdDate,
      @JsonKey(name: 'modified_by', includeIfNull: true) this.modifiedBy,
      @JsonKey(name: 'modified_from', includeIfNull: true) this.modifiedFrom,
      @JsonKey(name: 'modified_Date', includeIfNull: true) this.modifiedDate})
      : _comments = comments,
        _likes = likes;

  factory _$_ConsultationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConsultationModelFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  final String? userId;
  @override
  @JsonKey(includeIfNull: true)
  final String? message;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(includeIfNull: true)
  final User? user;
  final List<Comment>? _comments;
  @override
  @JsonKey(includeIfNull: true)
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Like>? _likes;
  @override
  @JsonKey(includeIfNull: true)
  List<Like>? get likes {
    final value = _likes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'comments_count', includeIfNull: true)
  final int? commentsCount;
  @override
  @JsonKey(name: 'likes_count', includeIfNull: true)
  final int? likesCount;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
  @override
  @JsonKey(name: 'image_base64', includeIfNull: true)
  final String? imageBase64;
  @override
  @JsonKey(name: 'is_delete', includeIfNull: true)
  final bool? isDelete;
  @override
  @JsonKey(name: 'created_by', includeIfNull: true)
  final String? createdBy;
  @override
  @JsonKey(name: 'created_from', includeIfNull: true)
  final String? createdFrom;
  @override
  @JsonKey(name: 'created_date', includeIfNull: true)
  final String? createdDate;
  @override
  @JsonKey(name: 'modified_by', includeIfNull: true)
  final String? modifiedBy;
  @override
  @JsonKey(name: 'modified_from', includeIfNull: true)
  final String? modifiedFrom;
  @override
  @JsonKey(name: 'modified_Date', includeIfNull: true)
  final String? modifiedDate;

  @override
  String toString() {
    return 'ConsultationModel(id: $id, userId: $userId, message: $message, status: $status, user: $user, comments: $comments, likes: $likes, commentsCount: $commentsCount, likesCount: $likesCount, imageUrl: $imageUrl, imageBase64: $imageBase64, isDelete: $isDelete, createdBy: $createdBy, createdFrom: $createdFrom, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedFrom: $modifiedFrom, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsultationModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality()
                .equals(other.commentsCount, commentsCount) &&
            const DeepCollectionEquality()
                .equals(other.likesCount, likesCount) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.imageBase64, imageBase64) &&
            const DeepCollectionEquality().equals(other.isDelete, isDelete) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality()
                .equals(other.createdFrom, createdFrom) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedBy, modifiedBy) &&
            const DeepCollectionEquality()
                .equals(other.modifiedFrom, modifiedFrom) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(commentsCount),
      const DeepCollectionEquality().hash(likesCount),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(imageBase64),
      const DeepCollectionEquality().hash(isDelete),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(createdFrom),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedBy),
      const DeepCollectionEquality().hash(modifiedFrom),
      const DeepCollectionEquality().hash(modifiedDate));

  @JsonKey(ignore: true)
  @override
  _$$_ConsultationModelCopyWith<_$_ConsultationModel> get copyWith =>
      __$$_ConsultationModelCopyWithImpl<_$_ConsultationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsultationModelToJson(this);
  }
}

abstract class _ConsultationModel implements ConsultationModel {
  const factory _ConsultationModel(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          final String? userId,
      @JsonKey(includeIfNull: true)
          final String? message,
      @JsonKey(includeIfNull: true)
          final String? status,
      @JsonKey(includeIfNull: true)
          final User? user,
      @JsonKey(includeIfNull: true)
          final List<Comment>? comments,
      @JsonKey(includeIfNull: true)
          final List<Like>? likes,
      @JsonKey(name: 'comments_count', includeIfNull: true)
          final int? commentsCount,
      @JsonKey(name: 'likes_count', includeIfNull: true)
          final int? likesCount,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
      @JsonKey(name: 'image_base64', includeIfNull: true)
          final String? imageBase64,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          final bool? isDelete,
      @JsonKey(name: 'created_by', includeIfNull: true)
          final String? createdBy,
      @JsonKey(name: 'created_from', includeIfNull: true)
          final String? createdFrom,
      @JsonKey(name: 'created_date', includeIfNull: true)
          final String? createdDate,
      @JsonKey(name: 'modified_by', includeIfNull: true)
          final String? modifiedBy,
      @JsonKey(name: 'modified_from', includeIfNull: true)
          final String? modifiedFrom,
      @JsonKey(name: 'modified_Date', includeIfNull: true)
          final String? modifiedDate}) = _$_ConsultationModel;

  factory _ConsultationModel.fromJson(Map<String, dynamic> json) =
      _$_ConsultationModel.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  List<Like>? get likes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'comments_count', includeIfNull: true)
  int? get commentsCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'likes_count', includeIfNull: true)
  int? get likesCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_base64', includeIfNull: true)
  String? get imageBase64 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_delete', includeIfNull: true)
  bool? get isDelete => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_by', includeIfNull: true)
  String? get createdBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_from', includeIfNull: true)
  String? get createdFrom => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_date', includeIfNull: true)
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'modified_by', includeIfNull: true)
  String? get modifiedBy => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'modified_from', includeIfNull: true)
  String? get modifiedFrom => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'modified_Date', includeIfNull: true)
  String? get modifiedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConsultationModelCopyWith<_$_ConsultationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id', includeIfNull: true)
  String? get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'post_id', includeIfNull: true) String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true) String? userId,
      @JsonKey(includeIfNull: true) String? message,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(includeIfNull: true) User? user,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'post_id', includeIfNull: true) String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true) String? userId,
      @JsonKey(includeIfNull: true) String? message,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(includeIfNull: true) User? user,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(name: 'post_id', includeIfNull: true) this.postId,
      @JsonKey(name: 'user_id', includeIfNull: true) this.userId,
      @JsonKey(includeIfNull: true) this.message,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(includeIfNull: true) this.user,
      @JsonKey(name: 'image_url', includeIfNull: true) this.imageUrl});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(name: 'post_id', includeIfNull: true)
  final String? postId;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  final String? userId;
  @override
  @JsonKey(includeIfNull: true)
  final String? message;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(includeIfNull: true)
  final User? user;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, userId: $userId, message: $message, status: $status, user: $user, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(name: 'post_id', includeIfNull: true)
          final String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true)
          final String? userId,
      @JsonKey(includeIfNull: true)
          final String? message,
      @JsonKey(includeIfNull: true)
          final String? status,
      @JsonKey(includeIfNull: true)
          final User? user,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'post_id', includeIfNull: true)
  String? get postId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_patient', includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mideife', includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin', includeIfNull: true)
  bool? get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified', includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'hospital_id', includeIfNull: true)
  String? get hospitalId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  Hospital? get hospital => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  dynamic get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? dob,
      @JsonKey(includeIfNull: true) String? email,
      @JsonKey(includeIfNull: true) String? mobile,
      @JsonKey(includeIfNull: true) String? username,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'is_patient', includeIfNull: true) bool? isPatient,
      @JsonKey(name: 'is_mideife', includeIfNull: true) bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true) bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true) bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true) bool? isVerified,
      @JsonKey(name: 'hospital_id', includeIfNull: true) String? hospitalId,
      @JsonKey(includeIfNull: true) Hospital? hospital,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
      dynamic coverUrl});

  $HospitalCopyWith<$Res>? get hospital;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? isAdmin = freezed,
    Object? isSuperAdmin = freezed,
    Object? isVerified = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  $HospitalCopyWith<$Res>? get hospital {
    if (_value.hospital == null) {
      return null;
    }

    return $HospitalCopyWith<$Res>(_value.hospital!, (value) {
      return _then(_value.copyWith(hospital: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? dob,
      @JsonKey(includeIfNull: true) String? email,
      @JsonKey(includeIfNull: true) String? mobile,
      @JsonKey(includeIfNull: true) String? username,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'is_patient', includeIfNull: true) bool? isPatient,
      @JsonKey(name: 'is_mideife', includeIfNull: true) bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true) bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true) bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true) bool? isVerified,
      @JsonKey(name: 'hospital_id', includeIfNull: true) String? hospitalId,
      @JsonKey(includeIfNull: true) Hospital? hospital,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
      dynamic coverUrl});

  @override
  $HospitalCopyWith<$Res>? get hospital;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? username = freezed,
    Object? status = freezed,
    Object? isPatient = freezed,
    Object? isMidwife = freezed,
    Object? isAdmin = freezed,
    Object? isSuperAdmin = freezed,
    Object? isVerified = freezed,
    Object? hospitalId = freezed,
    Object? hospital = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: mobile == freezed
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPatient: isPatient == freezed
          ? _value.isPatient
          : isPatient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMidwife: isMidwife == freezed
          ? _value.isMidwife
          : isMidwife // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperAdmin: isSuperAdmin == freezed
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hospitalId: hospitalId == freezed
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospital: hospital == freezed
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(includeIfNull: true) this.name,
      @JsonKey(includeIfNull: true) this.dob,
      @JsonKey(includeIfNull: true) this.email,
      @JsonKey(includeIfNull: true) this.mobile,
      @JsonKey(includeIfNull: true) this.username,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'is_patient', includeIfNull: true) this.isPatient,
      @JsonKey(name: 'is_mideife', includeIfNull: true) this.isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true) this.isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true) this.isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true) this.isVerified,
      @JsonKey(name: 'hospital_id', includeIfNull: true) this.hospitalId,
      @JsonKey(includeIfNull: true) this.hospital,
      @JsonKey(name: 'image_url', includeIfNull: true) this.imageUrl,
      this.coverUrl});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(includeIfNull: true)
  final String? dob;
  @override
  @JsonKey(includeIfNull: true)
  final String? email;
  @override
  @JsonKey(includeIfNull: true)
  final String? mobile;
  @override
  @JsonKey(includeIfNull: true)
  final String? username;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'is_patient', includeIfNull: true)
  final bool? isPatient;
  @override
  @JsonKey(name: 'is_mideife', includeIfNull: true)
  final bool? isMidwife;
  @override
  @JsonKey(name: 'is_admin', includeIfNull: true)
  final bool? isAdmin;
  @override
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  final bool? isSuperAdmin;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  final bool? isVerified;
  @override
  @JsonKey(name: 'hospital_id', includeIfNull: true)
  final String? hospitalId;
  @override
  @JsonKey(includeIfNull: true)
  final Hospital? hospital;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
  @override
  final dynamic coverUrl;

  @override
  String toString() {
    return 'User(id: $id, name: $name, dob: $dob, email: $email, mobile: $mobile, username: $username, status: $status, isPatient: $isPatient, isMidwife: $isMidwife, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, isVerified: $isVerified, hospitalId: $hospitalId, hospital: $hospital, imageUrl: $imageUrl, coverUrl: $coverUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.isPatient, isPatient) &&
            const DeepCollectionEquality().equals(other.isMidwife, isMidwife) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality()
                .equals(other.isSuperAdmin, isSuperAdmin) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality()
                .equals(other.hospitalId, hospitalId) &&
            const DeepCollectionEquality().equals(other.hospital, hospital) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.coverUrl, coverUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(mobile),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isPatient),
      const DeepCollectionEquality().hash(isMidwife),
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(isSuperAdmin),
      const DeepCollectionEquality().hash(isVerified),
      const DeepCollectionEquality().hash(hospitalId),
      const DeepCollectionEquality().hash(hospital),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(coverUrl));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(includeIfNull: true)
          final String? name,
      @JsonKey(includeIfNull: true)
          final String? dob,
      @JsonKey(includeIfNull: true)
          final String? email,
      @JsonKey(includeIfNull: true)
          final String? mobile,
      @JsonKey(includeIfNull: true)
          final String? username,
      @JsonKey(includeIfNull: true)
          final String? status,
      @JsonKey(name: 'is_patient', includeIfNull: true)
          final bool? isPatient,
      @JsonKey(name: 'is_mideife', includeIfNull: true)
          final bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true)
          final bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true)
          final bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true)
          final bool? isVerified,
      @JsonKey(name: 'hospital_id', includeIfNull: true)
          final String? hospitalId,
      @JsonKey(includeIfNull: true)
          final Hospital? hospital,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
      final dynamic coverUrl}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get dob => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get mobile => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_patient', includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_mideife', includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_admin', includeIfNull: true)
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hospital_id', includeIfNull: true)
  String? get hospitalId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  Hospital? get hospital => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  dynamic get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get alias => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code', includeIfNull: true)
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url', includeIfNull: true)
  String? get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? alias,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? address,
      @JsonKey(includeIfNull: true) String? city,
      @JsonKey(includeIfNull: true) String? country,
      @JsonKey(name: 'postal_code', includeIfNull: true) String? postalCode,
      @JsonKey(includeIfNull: true) String? phone,
      @JsonKey(includeIfNull: true) String? email,
      @JsonKey(includeIfNull: true) double? latitude,
      @JsonKey(includeIfNull: true) double? longitude,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true) String? coverUrl});
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res> implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  final Hospital _value;
  // ignore: unused_field
  final $Res Function(Hospital) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? status = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HospitalCopyWith<$Res> implements $HospitalCopyWith<$Res> {
  factory _$$_HospitalCopyWith(
          _$_Hospital value, $Res Function(_$_Hospital) then) =
      __$$_HospitalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(includeIfNull: true) String? alias,
      @JsonKey(includeIfNull: true) String? name,
      @JsonKey(includeIfNull: true) String? address,
      @JsonKey(includeIfNull: true) String? city,
      @JsonKey(includeIfNull: true) String? country,
      @JsonKey(name: 'postal_code', includeIfNull: true) String? postalCode,
      @JsonKey(includeIfNull: true) String? phone,
      @JsonKey(includeIfNull: true) String? email,
      @JsonKey(includeIfNull: true) double? latitude,
      @JsonKey(includeIfNull: true) double? longitude,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'image_url', includeIfNull: true) String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true) String? coverUrl});
}

/// @nodoc
class __$$_HospitalCopyWithImpl<$Res> extends _$HospitalCopyWithImpl<$Res>
    implements _$$_HospitalCopyWith<$Res> {
  __$$_HospitalCopyWithImpl(
      _$_Hospital _value, $Res Function(_$_Hospital) _then)
      : super(_value, (v) => _then(v as _$_Hospital));

  @override
  _$_Hospital get _value => super._value as _$_Hospital;

  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? status = freezed,
    Object? imageUrl = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(_$_Hospital(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: alias == freezed
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverUrl: coverUrl == freezed
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hospital implements _Hospital {
  const _$_Hospital(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(includeIfNull: true) this.alias,
      @JsonKey(includeIfNull: true) this.name,
      @JsonKey(includeIfNull: true) this.address,
      @JsonKey(includeIfNull: true) this.city,
      @JsonKey(includeIfNull: true) this.country,
      @JsonKey(name: 'postal_code', includeIfNull: true) this.postalCode,
      @JsonKey(includeIfNull: true) this.phone,
      @JsonKey(includeIfNull: true) this.email,
      @JsonKey(includeIfNull: true) this.latitude,
      @JsonKey(includeIfNull: true) this.longitude,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'image_url', includeIfNull: true) this.imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true) this.coverUrl});

  factory _$_Hospital.fromJson(Map<String, dynamic> json) =>
      _$$_HospitalFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(includeIfNull: true)
  final String? alias;
  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(includeIfNull: true)
  final String? address;
  @override
  @JsonKey(includeIfNull: true)
  final String? city;
  @override
  @JsonKey(includeIfNull: true)
  final String? country;
  @override
  @JsonKey(name: 'postal_code', includeIfNull: true)
  final String? postalCode;
  @override
  @JsonKey(includeIfNull: true)
  final String? phone;
  @override
  @JsonKey(includeIfNull: true)
  final String? email;
  @override
  @JsonKey(includeIfNull: true)
  final double? latitude;
  @override
  @JsonKey(includeIfNull: true)
  final double? longitude;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  final String? coverUrl;

  @override
  String toString() {
    return 'Hospital(id: $id, alias: $alias, name: $name, address: $address, city: $city, country: $country, postalCode: $postalCode, phone: $phone, email: $email, latitude: $latitude, longitude: $longitude, status: $status, imageUrl: $imageUrl, coverUrl: $coverUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hospital &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.alias, alias) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.coverUrl, coverUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(alias),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(postalCode),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(coverUrl));

  @JsonKey(ignore: true)
  @override
  _$$_HospitalCopyWith<_$_Hospital> get copyWith =>
      __$$_HospitalCopyWithImpl<_$_Hospital>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HospitalToJson(this);
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(includeIfNull: true)
          final String? alias,
      @JsonKey(includeIfNull: true)
          final String? name,
      @JsonKey(includeIfNull: true)
          final String? address,
      @JsonKey(includeIfNull: true)
          final String? city,
      @JsonKey(includeIfNull: true)
          final String? country,
      @JsonKey(name: 'postal_code', includeIfNull: true)
          final String? postalCode,
      @JsonKey(includeIfNull: true)
          final String? phone,
      @JsonKey(includeIfNull: true)
          final String? email,
      @JsonKey(includeIfNull: true)
          final double? latitude,
      @JsonKey(includeIfNull: true)
          final double? longitude,
      @JsonKey(includeIfNull: true)
          final String? status,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          final String? coverUrl}) = _$_Hospital;

  factory _Hospital.fromJson(Map<String, dynamic> json) = _$_Hospital.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get alias => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get city => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'postal_code', includeIfNull: true)
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get phone => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  double? get latitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  String? get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HospitalCopyWith<_$_Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
mixin _$Like {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id', includeIfNull: true)
  String? get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'post_id', includeIfNull: true) String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true) String? userId,
      @JsonKey(includeIfNull: true) User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$$_LikeCopyWith(_$_Like value, $Res Function(_$_Like) then) =
      __$$_LikeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'post_id', includeIfNull: true) String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true) String? userId,
      @JsonKey(includeIfNull: true) User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$$_LikeCopyWith<$Res> {
  __$$_LikeCopyWithImpl(_$_Like _value, $Res Function(_$_Like) _then)
      : super(_value, (v) => _then(v as _$_Like));

  @override
  _$_Like get _value => super._value as _$_Like;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_Like(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  const _$_Like(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(name: 'post_id', includeIfNull: true) this.postId,
      @JsonKey(name: 'user_id', includeIfNull: true) this.userId,
      @JsonKey(includeIfNull: true) this.user});

  factory _$_Like.fromJson(Map<String, dynamic> json) => _$$_LikeFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(name: 'post_id', includeIfNull: true)
  final String? postId;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  final String? userId;
  @override
  @JsonKey(includeIfNull: true)
  final User? user;

  @override
  String toString() {
    return 'Like(id: $id, postId: $postId, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Like &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_LikeCopyWith<_$_Like> get copyWith =>
      __$$_LikeCopyWithImpl<_$_Like>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeToJson(this);
  }
}

abstract class _Like implements Like {
  const factory _Like(
      {@JsonKey(includeIfNull: true) final String? id,
      @JsonKey(name: 'post_id', includeIfNull: true) final String? postId,
      @JsonKey(name: 'user_id', includeIfNull: true) final String? userId,
      @JsonKey(includeIfNull: true) final User? user}) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'post_id', includeIfNull: true)
  String? get postId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LikeCopyWith<_$_Like> get copyWith => throw _privateConstructorUsedError;
}
