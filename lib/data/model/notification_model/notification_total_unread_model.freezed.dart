// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_total_unread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationTotalUnreadModel _$NotificationTotalUnreadModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationTotalUnreadModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationTotalUnreadModel {
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTotalUnreadModelCopyWith<NotificationTotalUnreadModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTotalUnreadModelCopyWith<$Res> {
  factory $NotificationTotalUnreadModelCopyWith(
          NotificationTotalUnreadModel value,
          $Res Function(NotificationTotalUnreadModel) then) =
      _$NotificationTotalUnreadModelCopyWithImpl<$Res>;
  $Res call({int? total});
}

/// @nodoc
class _$NotificationTotalUnreadModelCopyWithImpl<$Res>
    implements $NotificationTotalUnreadModelCopyWith<$Res> {
  _$NotificationTotalUnreadModelCopyWithImpl(this._value, this._then);

  final NotificationTotalUnreadModel _value;
  // ignore: unused_field
  final $Res Function(NotificationTotalUnreadModel) _then;

  @override
  $Res call({
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationTotalUnreadModelCopyWith<$Res>
    implements $NotificationTotalUnreadModelCopyWith<$Res> {
  factory _$$_NotificationTotalUnreadModelCopyWith(
          _$_NotificationTotalUnreadModel value,
          $Res Function(_$_NotificationTotalUnreadModel) then) =
      __$$_NotificationTotalUnreadModelCopyWithImpl<$Res>;
  @override
  $Res call({int? total});
}

/// @nodoc
class __$$_NotificationTotalUnreadModelCopyWithImpl<$Res>
    extends _$NotificationTotalUnreadModelCopyWithImpl<$Res>
    implements _$$_NotificationTotalUnreadModelCopyWith<$Res> {
  __$$_NotificationTotalUnreadModelCopyWithImpl(
      _$_NotificationTotalUnreadModel _value,
      $Res Function(_$_NotificationTotalUnreadModel) _then)
      : super(_value, (v) => _then(v as _$_NotificationTotalUnreadModel));

  @override
  _$_NotificationTotalUnreadModel get _value =>
      super._value as _$_NotificationTotalUnreadModel;

  @override
  $Res call({
    Object? total = freezed,
  }) {
    return _then(_$_NotificationTotalUnreadModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_NotificationTotalUnreadModel
    with DiagnosticableTreeMixin
    implements _NotificationTotalUnreadModel {
  const _$_NotificationTotalUnreadModel({this.total});

  factory _$_NotificationTotalUnreadModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationTotalUnreadModelFromJson(json);

  @override
  final int? total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationTotalUnreadModel(total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationTotalUnreadModel'))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationTotalUnreadModel &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationTotalUnreadModelCopyWith<_$_NotificationTotalUnreadModel>
      get copyWith => __$$_NotificationTotalUnreadModelCopyWithImpl<
          _$_NotificationTotalUnreadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationTotalUnreadModelToJson(this);
  }
}

abstract class _NotificationTotalUnreadModel
    implements NotificationTotalUnreadModel {
  const factory _NotificationTotalUnreadModel({final int? total}) =
      _$_NotificationTotalUnreadModel;

  factory _NotificationTotalUnreadModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationTotalUnreadModel.fromJson;

  @override
  int? get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationTotalUnreadModelCopyWith<_$_NotificationTotalUnreadModel>
      get copyWith => throw _privateConstructorUsedError;
}
