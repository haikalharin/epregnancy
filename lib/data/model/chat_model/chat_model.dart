import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class ChatModel implements BaseModel {
  int? dateTime;
  bool? isRead;
  String? message;
  String? type;
  String? uidReceiver;
  String? uidSender;

  ChatModel({
    this.dateTime,
    this.isRead,
    this.message,
    this.type,
    this.uidReceiver,
    this.uidSender,
  });

  static ChatModel fromJson(Map<String, dynamic> json) {
    return ChatModel(
      dateTime: json['dateTime'] ?? 0,
      isRead: json['isRead'] ?? false,
      message: json['message'] ?? '',
      type: json['type'] ?? '',
      uidReceiver: json['uidReceiver'] ?? '',
      uidSender: json['uidSender'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        'dateTime': dateTime,
        'isRead': isRead,
        'message': message,
        'type': type,
        'uidReceiver': uidReceiver,
        'uidSender': uidSender,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }
  static ChatModel empty() {
    return ChatModel(
      dateTime: 0,
      isRead:  false,
      message:  '',
      type:  '',
      uidReceiver:  '',
      uidSender:  '',
    );
  }
}
