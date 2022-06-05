import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class Room implements BaseModel{
  String? email;
  bool? inRoom;
  String? lastChat;
  int? lastDateTime;
  String? lastUid;
  String? name;
  String? photo;
  String? type;
  String? uid;

  Room({
    this.email,
    this.inRoom,
    this.lastChat,
    this.lastDateTime,
    this.lastUid,
    this.name,
    this.photo,
    this.type,
    this.uid,
  });

  static Room fromJson(Map<String, dynamic> json) {
    return Room(
      email: json['email'] ?? '',
      inRoom: json['inRoom'] ?? false,
      lastChat: json['lastChat'] ?? '',
      lastDateTime: json['lastDateTime'] ?? 0,
      lastUid: json['lastUid'] ?? '',
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      type: json['type'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'inRoom': inRoom,
        'lastChat': lastChat,
        'lastDateTime': lastDateTime,
        'lastUid': lastUid,
        'name': name,
        'photo': photo,
        'type': type,
        'uid': uid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }
}
