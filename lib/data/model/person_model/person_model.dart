import '../base_model/base_model.dart';

class PersonModel implements BaseModel {
  String? email;
  String? name;
  String? photo;
  String? token;
  String? uid;

  PersonModel({this.email, this.name, this.photo, this.token, this.uid});

  static PersonModel fromJson(Map<String, dynamic> json) {
    return PersonModel(
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
