import '../base_model/base_model.dart';

class Person implements BaseModel {
  String? email;
  String? name;
  String? photo;
  String? token;
  String? uid;

  Person({this.email, this.name, this.photo, this.token, this.uid});

  static Person fromJson(Map<String, dynamic> json) {
    return Person(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      token: json['token'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'photo': photo,
        'token': token,
        'uid': uid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }
}
