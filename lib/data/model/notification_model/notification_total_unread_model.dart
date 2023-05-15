
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_total_unread_model.freezed.dart';
part 'notification_total_unread_model.g.dart';

@freezed
class NotificationTotalUnreadModel with _$NotificationTotalUnreadModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NotificationTotalUnreadModel({
    final int? total,
  }) = _NotificationTotalUnreadModel;

  factory NotificationTotalUnreadModel.fromJson(Map<String, dynamic> json) => _$NotificationTotalUnreadModelFromJson(json);
}
