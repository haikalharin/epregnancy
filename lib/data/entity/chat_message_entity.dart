class ChatMessageEntity {
  String? name;
  String? message;
  String? imageUrl;
  String? imagePath;
  String? dateTime;
  bool? mine;
  String? profileImage;

  ChatMessageEntity({this.message, this.name, this.dateTime, this.mine, this.profileImage, this.imageUrl, this.imagePath});
}