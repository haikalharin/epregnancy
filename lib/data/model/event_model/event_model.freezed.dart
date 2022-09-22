// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  @JsonKey(includeIfNull: true)
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user', includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'remind_before', includeIfNull: true)
  int? get remindBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date', includeIfNull: true)
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date', includeIfNull: true)
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
  int? get medicineTakenTimes => throw _privateConstructorUsedError;
  @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
  int? get medicineTakenDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'medicine_unit', includeIfNull: true)
  String? get medicineUnit => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifications', includeIfNull: true)
  List<NotificationModel>? get notifications =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_delete', includeIfNull: true)
  bool? get isDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_public', includeIfNull: true)
  bool? get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'modified_date', includeIfNull: true)
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true)
      @JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          String? userId,
      @JsonKey(name: 'user', includeIfNull: true)
          User? user,
      @JsonKey(includeIfNull: true)
          String? type,
      @JsonKey(includeIfNull: true)
          String? title,
      @JsonKey(includeIfNull: true)
          String? description,
      @JsonKey(includeIfNull: true)
          String? location,
      @JsonKey(includeIfNull: true)
          String? date,
      @JsonKey(includeIfNull: true)
          String? time,
      @JsonKey(name: 'remind_before', includeIfNull: true)
          int? remindBefore,
      @JsonKey(name: 'start_date', includeIfNull: true)
          String? startDate,
      @JsonKey(name: 'end_date', includeIfNull: true)
          String? endDate,
      @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
          int? medicineTakenTimes,
      @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
          int? medicineTakenDays,
      @JsonKey(name: 'medicine_unit', includeIfNull: true)
          String? medicineUnit,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(name: 'notifications', includeIfNull: true)
          List<NotificationModel>? notifications,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          bool? isDelete,
      @JsonKey(name: 'is_public', includeIfNull: true)
          bool? isPublic,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
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
      @JsonKey(name: 'modified_date', includeIfNull: true)
          String? modifiedDate});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res> implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  final EventModel _value;
  // ignore: unused_field
  final $Res Function(EventModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? remindBefore = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? medicineTakenTimes = freezed,
    Object? medicineTakenDays = freezed,
    Object? medicineUnit = freezed,
    Object? status = freezed,
    Object? notifications = freezed,
    Object? isDelete = freezed,
    Object? isPublic = freezed,
    Object? imageUrl = freezed,
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
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      remindBefore: remindBefore == freezed
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      medicineTakenTimes: medicineTakenTimes == freezed
          ? _value.medicineTakenTimes
          : medicineTakenTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      medicineTakenDays: medicineTakenDays == freezed
          ? _value.medicineTakenDays
          : medicineTakenDays // ignore: cast_nullable_to_non_nullable
              as int?,
      medicineUnit: medicineUnit == freezed
          ? _value.medicineUnit
          : medicineUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_EventModelCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$_EventModelCopyWith(
          _$_EventModel value, $Res Function(_$_EventModel) then) =
      __$$_EventModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true)
      @JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          String? userId,
      @JsonKey(name: 'user', includeIfNull: true)
          User? user,
      @JsonKey(includeIfNull: true)
          String? type,
      @JsonKey(includeIfNull: true)
          String? title,
      @JsonKey(includeIfNull: true)
          String? description,
      @JsonKey(includeIfNull: true)
          String? location,
      @JsonKey(includeIfNull: true)
          String? date,
      @JsonKey(includeIfNull: true)
          String? time,
      @JsonKey(name: 'remind_before', includeIfNull: true)
          int? remindBefore,
      @JsonKey(name: 'start_date', includeIfNull: true)
          String? startDate,
      @JsonKey(name: 'end_date', includeIfNull: true)
          String? endDate,
      @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
          int? medicineTakenTimes,
      @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
          int? medicineTakenDays,
      @JsonKey(name: 'medicine_unit', includeIfNull: true)
          String? medicineUnit,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(name: 'notifications', includeIfNull: true)
          List<NotificationModel>? notifications,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          bool? isDelete,
      @JsonKey(name: 'is_public', includeIfNull: true)
          bool? isPublic,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
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
      @JsonKey(name: 'modified_date', includeIfNull: true)
          String? modifiedDate});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_EventModelCopyWithImpl<$Res> extends _$EventModelCopyWithImpl<$Res>
    implements _$$_EventModelCopyWith<$Res> {
  __$$_EventModelCopyWithImpl(
      _$_EventModel _value, $Res Function(_$_EventModel) _then)
      : super(_value, (v) => _then(v as _$_EventModel));

  @override
  _$_EventModel get _value => super._value as _$_EventModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? remindBefore = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? medicineTakenTimes = freezed,
    Object? medicineTakenDays = freezed,
    Object? medicineUnit = freezed,
    Object? status = freezed,
    Object? notifications = freezed,
    Object? isDelete = freezed,
    Object? isPublic = freezed,
    Object? imageUrl = freezed,
    Object? createdBy = freezed,
    Object? createdFrom = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedFrom = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_EventModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      remindBefore: remindBefore == freezed
          ? _value.remindBefore
          : remindBefore // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      medicineTakenTimes: medicineTakenTimes == freezed
          ? _value.medicineTakenTimes
          : medicineTakenTimes // ignore: cast_nullable_to_non_nullable
              as int?,
      medicineTakenDays: medicineTakenDays == freezed
          ? _value.medicineTakenDays
          : medicineTakenDays // ignore: cast_nullable_to_non_nullable
              as int?,
      medicineUnit: medicineUnit == freezed
          ? _value.medicineUnit
          : medicineUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: notifications == freezed
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>?,
      isDelete: isDelete == freezed
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_EventModel implements _EventModel {
  const _$_EventModel(
      {@JsonKey(includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          this.userId,
      @JsonKey(name: 'user', includeIfNull: true)
          this.user,
      @JsonKey(includeIfNull: true)
          this.type,
      @JsonKey(includeIfNull: true)
          this.title,
      @JsonKey(includeIfNull: true)
          this.description,
      @JsonKey(includeIfNull: true)
          this.location,
      @JsonKey(includeIfNull: true)
          this.date,
      @JsonKey(includeIfNull: true)
          this.time,
      @JsonKey(name: 'remind_before', includeIfNull: true)
          this.remindBefore,
      @JsonKey(name: 'start_date', includeIfNull: true)
          this.startDate,
      @JsonKey(name: 'end_date', includeIfNull: true)
          this.endDate,
      @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
          this.medicineTakenTimes,
      @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
          this.medicineTakenDays,
      @JsonKey(name: 'medicine_unit', includeIfNull: true)
          this.medicineUnit,
      @JsonKey(includeIfNull: true)
          this.status,
      @JsonKey(name: 'notifications', includeIfNull: true)
          final List<NotificationModel>? notifications,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          this.isDelete,
      @JsonKey(name: 'is_public', includeIfNull: true)
          this.isPublic,
      @JsonKey(name: 'image_url', includeIfNull: true)
          this.imageUrl,
      @JsonKey(name: 'created_by', includeIfNull: true)
          this.createdBy,
      @JsonKey(name: 'created_from', includeIfNull: true)
          this.createdFrom,
      @JsonKey(name: 'created_date', includeIfNull: true)
          this.createdDate,
      @JsonKey(name: 'modified_by', includeIfNull: true)
          this.modifiedBy,
      @JsonKey(name: 'modified_from', includeIfNull: true)
          this.modifiedFrom,
      @JsonKey(name: 'modified_date', includeIfNull: true)
          this.modifiedDate})
      : _notifications = notifications;

  factory _$_EventModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventModelFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  final String? userId;
  @override
  @JsonKey(name: 'user', includeIfNull: true)
  final User? user;
  @override
  @JsonKey(includeIfNull: true)
  final String? type;
  @override
  @JsonKey(includeIfNull: true)
  final String? title;
  @override
  @JsonKey(includeIfNull: true)
  final String? description;
  @override
  @JsonKey(includeIfNull: true)
  final String? location;
  @override
  @JsonKey(includeIfNull: true)
  final String? date;
  @override
  @JsonKey(includeIfNull: true)
  final String? time;
  @override
  @JsonKey(name: 'remind_before', includeIfNull: true)
  final int? remindBefore;
  @override
  @JsonKey(name: 'start_date', includeIfNull: true)
  final String? startDate;
  @override
  @JsonKey(name: 'end_date', includeIfNull: true)
  final String? endDate;
  @override
  @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
  final int? medicineTakenTimes;
  @override
  @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
  final int? medicineTakenDays;
  @override
  @JsonKey(name: 'medicine_unit', includeIfNull: true)
  final String? medicineUnit;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  final List<NotificationModel>? _notifications;
  @override
  @JsonKey(name: 'notifications', includeIfNull: true)
  List<NotificationModel>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_delete', includeIfNull: true)
  final bool? isDelete;
  @override
  @JsonKey(name: 'is_public', includeIfNull: true)
  final bool? isPublic;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
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
  @JsonKey(name: 'modified_date', includeIfNull: true)
  final String? modifiedDate;

  @override
  String toString() {
    return 'EventModel(id: $id, userId: $userId, user: $user, type: $type, title: $title, description: $description, location: $location, date: $date, time: $time, remindBefore: $remindBefore, startDate: $startDate, endDate: $endDate, medicineTakenTimes: $medicineTakenTimes, medicineTakenDays: $medicineTakenDays, medicineUnit: $medicineUnit, status: $status, notifications: $notifications, isDelete: $isDelete, isPublic: $isPublic, imageUrl: $imageUrl, createdBy: $createdBy, createdFrom: $createdFrom, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedFrom: $modifiedFrom, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.remindBefore, remindBefore) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality()
                .equals(other.medicineTakenTimes, medicineTakenTimes) &&
            const DeepCollectionEquality()
                .equals(other.medicineTakenDays, medicineTakenDays) &&
            const DeepCollectionEquality()
                .equals(other.medicineUnit, medicineUnit) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            const DeepCollectionEquality().equals(other.isDelete, isDelete) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(userId),
        const DeepCollectionEquality().hash(user),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(location),
        const DeepCollectionEquality().hash(date),
        const DeepCollectionEquality().hash(time),
        const DeepCollectionEquality().hash(remindBefore),
        const DeepCollectionEquality().hash(startDate),
        const DeepCollectionEquality().hash(endDate),
        const DeepCollectionEquality().hash(medicineTakenTimes),
        const DeepCollectionEquality().hash(medicineTakenDays),
        const DeepCollectionEquality().hash(medicineUnit),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(_notifications),
        const DeepCollectionEquality().hash(isDelete),
        const DeepCollectionEquality().hash(isPublic),
        const DeepCollectionEquality().hash(imageUrl),
        const DeepCollectionEquality().hash(createdBy),
        const DeepCollectionEquality().hash(createdFrom),
        const DeepCollectionEquality().hash(createdDate),
        const DeepCollectionEquality().hash(modifiedBy),
        const DeepCollectionEquality().hash(modifiedFrom),
        const DeepCollectionEquality().hash(modifiedDate)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      __$$_EventModelCopyWithImpl<_$_EventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventModelToJson(this);
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {@JsonKey(includeIfNull: true)
      @JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(name: 'user_id', includeIfNull: true)
          final String? userId,
      @JsonKey(name: 'user', includeIfNull: true)
          final User? user,
      @JsonKey(includeIfNull: true)
          final String? type,
      @JsonKey(includeIfNull: true)
          final String? title,
      @JsonKey(includeIfNull: true)
          final String? description,
      @JsonKey(includeIfNull: true)
          final String? location,
      @JsonKey(includeIfNull: true)
          final String? date,
      @JsonKey(includeIfNull: true)
          final String? time,
      @JsonKey(name: 'remind_before', includeIfNull: true)
          final int? remindBefore,
      @JsonKey(name: 'start_date', includeIfNull: true)
          final String? startDate,
      @JsonKey(name: 'end_date', includeIfNull: true)
          final String? endDate,
      @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
          final int? medicineTakenTimes,
      @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
          final int? medicineTakenDays,
      @JsonKey(name: 'medicine_unit', includeIfNull: true)
          final String? medicineUnit,
      @JsonKey(includeIfNull: true)
          final String? status,
      @JsonKey(name: 'notifications', includeIfNull: true)
          final List<NotificationModel>? notifications,
      @JsonKey(name: 'is_delete', includeIfNull: true)
          final bool? isDelete,
      @JsonKey(name: 'is_public', includeIfNull: true)
          final bool? isPublic,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
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
      @JsonKey(name: 'modified_date', includeIfNull: true)
          final String? modifiedDate}) = _$_EventModel;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$_EventModel.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id', includeIfNull: true)
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user', includeIfNull: true)
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'remind_before', includeIfNull: true)
  int? get remindBefore => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'start_date', includeIfNull: true)
  String? get startDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'end_date', includeIfNull: true)
  String? get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'medicine_taken_times', includeIfNull: true)
  int? get medicineTakenTimes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'medicine_taken_days', includeIfNull: true)
  int? get medicineTakenDays => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'medicine_unit', includeIfNull: true)
  String? get medicineUnit => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notifications', includeIfNull: true)
  List<NotificationModel>? get notifications =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_delete', includeIfNull: true)
  bool? get isDelete => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_public', includeIfNull: true)
  bool? get isPublic => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'modified_date', includeIfNull: true)
  String? get modifiedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventModelCopyWith<_$_EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id', includeIfNull: true)
  String? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'schedule_id', includeIfNull: true) String? scheduleId,
      @JsonKey(includeIfNull: true) String? time,
      @JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  final NotificationModel _value;
  // ignore: unused_field
  final $Res Function(NotificationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleId = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$_NotificationModelCopyWith(_$_NotificationModel value,
          $Res Function(_$_NotificationModel) then) =
      __$$_NotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true) String? id,
      @JsonKey(name: 'schedule_id', includeIfNull: true) String? scheduleId,
      @JsonKey(includeIfNull: true) String? time,
      @JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class __$$_NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res>
    implements _$$_NotificationModelCopyWith<$Res> {
  __$$_NotificationModelCopyWithImpl(
      _$_NotificationModel _value, $Res Function(_$_NotificationModel) _then)
      : super(_value, (v) => _then(v as _$_NotificationModel));

  @override
  _$_NotificationModel get _value => super._value as _$_NotificationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleId = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_NotificationModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel implements _NotificationModel {
  const _$_NotificationModel(
      {@JsonKey(includeIfNull: true) this.id,
      @JsonKey(name: 'schedule_id', includeIfNull: true) this.scheduleId,
      @JsonKey(includeIfNull: true) this.time,
      @JsonKey(includeIfNull: true) this.status});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationModelFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? id;
  @override
  @JsonKey(name: 'schedule_id', includeIfNull: true)
  final String? scheduleId;
  @override
  @JsonKey(includeIfNull: true)
  final String? time;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;

  @override
  String toString() {
    return 'NotificationModel(id: $id, scheduleId: $scheduleId, time: $time, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      __$$_NotificationModelCopyWithImpl<_$_NotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationModelToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {@JsonKey(includeIfNull: true)
          final String? id,
      @JsonKey(name: 'schedule_id', includeIfNull: true)
          final String? scheduleId,
      @JsonKey(includeIfNull: true)
          final String? time,
      @JsonKey(includeIfNull: true)
          final String? status}) = _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'schedule_id', includeIfNull: true)
  String? get scheduleId => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
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
  @JsonKey(includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url', includeIfNull: true)
  String? get coverUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(includeIfNull: true)
          String? name,
      @JsonKey(includeIfNull: true)
          String? dob,
      @JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? mobile,
      @JsonKey(includeIfNull: true)
          String? username,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(name: 'is_patient', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isVerified,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          String? coverUrl});
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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? id,
      @JsonKey(includeIfNull: true)
          String? name,
      @JsonKey(includeIfNull: true)
          String? dob,
      @JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? mobile,
      @JsonKey(includeIfNull: true)
          String? username,
      @JsonKey(includeIfNull: true)
          String? status,
      @JsonKey(name: 'is_patient', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          bool? isVerified,
      @JsonKey(name: 'image_url', includeIfNull: true)
          String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          String? coverUrl});
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
class _$_User implements _User {
  const _$_User(
      {@JsonKey(includeIfNull: true)
          this.id,
      @JsonKey(includeIfNull: true)
          this.name,
      @JsonKey(includeIfNull: true)
          this.dob,
      @JsonKey(includeIfNull: true)
          this.email,
      @JsonKey(includeIfNull: true)
          this.mobile,
      @JsonKey(includeIfNull: true)
          this.username,
      @JsonKey(includeIfNull: true)
          this.status,
      @JsonKey(name: 'is_patient', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          this.isVerified,
      @JsonKey(name: 'image_url', includeIfNull: true)
          this.imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true)
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
  @JsonKey(includeIfNull: true)
  final bool? isPatient;
  @override
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  final bool? isMidwife;
  @override
  @JsonKey(name: 'is_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  final bool? isAdmin;
  @override
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  final bool? isSuperAdmin;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  final bool? isVerified;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  final String? imageUrl;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  final String? coverUrl;

  @override
  String toString() {
    return 'User(id: $id, name: $name, dob: $dob, email: $email, mobile: $mobile, username: $username, status: $status, isPatient: $isPatient, isMidwife: $isMidwife, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, isVerified: $isVerified, imageUrl: $imageUrl, coverUrl: $coverUrl)';
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
      @JsonKey(includeIfNull: true)
          final bool? isPatient,
      @JsonKey(name: 'is_midwife', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          final bool? isMidwife,
      @JsonKey(name: 'is_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          final bool? isAdmin,
      @JsonKey(name: 'is_super_admin', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          final bool? isSuperAdmin,
      @JsonKey(name: 'is_verified', includeIfNull: true)
      @JsonKey(includeIfNull: true)
          final bool? isVerified,
      @JsonKey(name: 'image_url', includeIfNull: true)
          final String? imageUrl,
      @JsonKey(name: 'cover_url', includeIfNull: true)
          final String? coverUrl}) = _$_User;

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
  @JsonKey(includeIfNull: true)
  bool? get isPatient => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_midwife', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isMidwife => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_super_admin', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isSuperAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_verified', includeIfNull: true)
  @JsonKey(includeIfNull: true)
  bool? get isVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url', includeIfNull: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cover_url', includeIfNull: true)
  String? get coverUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
