// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationListModel _$NotificationListModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationListModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationListModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;
  String? get actionType => throw _privateConstructorUsedError;
  String? get actionValue => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListModelCopyWith<NotificationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListModelCopyWith<$Res> {
  factory $NotificationListModelCopyWith(NotificationListModel value,
          $Res Function(NotificationListModel) then) =
      _$NotificationListModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? body,
      bool? read,
      String? actionType,
      String? actionValue,
      String? createdDate});
}

/// @nodoc
class _$NotificationListModelCopyWithImpl<$Res>
    implements $NotificationListModelCopyWith<$Res> {
  _$NotificationListModelCopyWithImpl(this._value, this._then);

  final NotificationListModel _value;
  // ignore: unused_field
  final $Res Function(NotificationListModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? read = freezed,
    Object? actionType = freezed,
    Object? actionValue = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      actionType: actionType == freezed
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionValue: actionValue == freezed
          ? _value.actionValue
          : actionValue // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationListModelCopyWith<$Res>
    implements $NotificationListModelCopyWith<$Res> {
  factory _$$_NotificationListModelCopyWith(_$_NotificationListModel value,
          $Res Function(_$_NotificationListModel) then) =
      __$$_NotificationListModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? body,
      bool? read,
      String? actionType,
      String? actionValue,
      String? createdDate});
}

/// @nodoc
class __$$_NotificationListModelCopyWithImpl<$Res>
    extends _$NotificationListModelCopyWithImpl<$Res>
    implements _$$_NotificationListModelCopyWith<$Res> {
  __$$_NotificationListModelCopyWithImpl(_$_NotificationListModel _value,
      $Res Function(_$_NotificationListModel) _then)
      : super(_value, (v) => _then(v as _$_NotificationListModel));

  @override
  _$_NotificationListModel get _value =>
      super._value as _$_NotificationListModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? read = freezed,
    Object? actionType = freezed,
    Object? actionValue = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_NotificationListModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      actionType: actionType == freezed
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
      actionValue: actionValue == freezed
          ? _value.actionValue
          : actionValue // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_NotificationListModel
    with DiagnosticableTreeMixin
    implements _NotificationListModel {
  const _$_NotificationListModel(
      {this.id,
      this.title,
      this.body,
      this.read,
      this.actionType,
      this.actionValue,
      this.createdDate});

  factory _$_NotificationListModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationListModelFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final bool? read;
  @override
  final String? actionType;
  @override
  final String? actionValue;
  @override
  final String? createdDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationListModel(id: $id, title: $title, body: $body, read: $read, actionType: $actionType, actionValue: $actionValue, createdDate: $createdDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationListModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('read', read))
      ..add(DiagnosticsProperty('actionType', actionType))
      ..add(DiagnosticsProperty('actionValue', actionValue))
      ..add(DiagnosticsProperty('createdDate', createdDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationListModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.read, read) &&
            const DeepCollectionEquality()
                .equals(other.actionType, actionType) &&
            const DeepCollectionEquality()
                .equals(other.actionValue, actionValue) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(read),
      const DeepCollectionEquality().hash(actionType),
      const DeepCollectionEquality().hash(actionValue),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationListModelCopyWith<_$_NotificationListModel> get copyWith =>
      __$$_NotificationListModelCopyWithImpl<_$_NotificationListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationListModelToJson(this);
  }
}

abstract class _NotificationListModel implements NotificationListModel {
  const factory _NotificationListModel(
      {final String? id,
      final String? title,
      final String? body,
      final bool? read,
      final String? actionType,
      final String? actionValue,
      final String? createdDate}) = _$_NotificationListModel;

  factory _NotificationListModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationListModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  bool? get read => throw _privateConstructorUsedError;
  @override
  String? get actionType => throw _privateConstructorUsedError;
  @override
  String? get actionValue => throw _privateConstructorUsedError;
  @override
  String? get createdDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationListModelCopyWith<_$_NotificationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
