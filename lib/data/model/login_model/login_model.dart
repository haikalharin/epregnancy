import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class LoginModel implements BaseModel {
  String? username;
  String? password;

  LoginModel({this.username, this.password});



  static LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],

    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    // TODO: implement jsonToModel
    throw UnimplementedError();
  }
}