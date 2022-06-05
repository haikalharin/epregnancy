import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class Chat implements BaseModel {
  int? dateTime;
  bool? isRead;
  String? message;
  String? type;
  String? uidReceiver;
  String? uidSender;

  Chat({
    this.dateTime,
    this.isRead,
    this.message,
    this.type,
    this.uidReceiver,
    this.uidSender,
  });

  static Chat fromJson(Map<String, dynamic> json) {
    return Chat(
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
}
