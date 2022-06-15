import '../base_model/base_model.dart';

class PersonModel implements BaseModel {
  String? phoneNumber;
  String? name;
  String? photo;
  String? token;
  String? uid;

  PersonModel({this.phoneNumber, this.name, this.photo, this.token, this.uid});

  static PersonModel fromJson(Map<String, dynamic> json) {
    return PersonModel(
      phoneNumber: json['phoneNumber'] ?? '',
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      token: json['token'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'name': name,
        'photo': photo,
        'token': token,
        'uid': uid,
      };

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static PersonModel empty() {
    return PersonModel(
      phoneNumber: '',
      name:  '',
      photo:  '',
      token:  '',
      uid:  '',
    );
  }
}
