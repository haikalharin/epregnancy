class ChatMessageEntity {
  String? name;
  String? message;
  String? dateTime;
  bool? mine;

  ChatMessageEntity({this.message, this.name, this.dateTime, this.mine});
}