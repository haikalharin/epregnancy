import '../base_model/base_model.dart';

class ChatDialogModel implements BaseModel {
  String? dateTime;
  bool? isFirst;

  ChatDialogModel({
    this.dateTime,
    this.isFirst,

  });

  static ChatDialogModel fromJson(Map<String, dynamic> json) {
    return ChatDialogModel(
      dateTime: json['dateTime'] ?? 0,
      isFirst: json['isRead'] ?? false
    );
  }
  Map<String, dynamic> toJson() => {
    'dateTime': dateTime,
    'isRead': isFirst,
  };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }
  static ChatDialogModel empty() {
    return ChatDialogModel(
      dateTime:"0000-00-00 00:00:00",
      isFirst:  true,

    );
  }
}