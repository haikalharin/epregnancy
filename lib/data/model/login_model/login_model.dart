import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class LoginModel implements BaseModel {
  String? username;
  String? password;
  String? fcmToken;

  LoginModel({this.username, this.password, this.fcmToken});



  static LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
      fcmToken: json['fcm_token'],

    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['fcm_token'] = this.fcmToken;
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    // TODO: implement jsonToModel
    throw UnimplementedError();
  }
}