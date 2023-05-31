
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_list_model.freezed.dart';
part 'notification_list_model.g.dart';

@freezed
class NotificationListModel with _$NotificationListModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NotificationListModel({
    final String? id,
    final String? title,
    final String? body,
    final bool? read,
    final String? actionType,
    final String? actionValue,
    final String? createdDate,
  }) = _NotificationListModel;

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => _$NotificationListModelFromJson(json);
}
