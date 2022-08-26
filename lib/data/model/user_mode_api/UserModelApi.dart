import '../base_model/base_model.dart';

class UserModelApi implements BaseModel{
  String? name;
  String? username;
  String? password;
  String? dob;
  String? mobile;
  String? email;
  bool? is_patient;

  UserModelApi(
      {this.name,
      this.username,
      this.password,
      this.dob,
      this.mobile,
      this.email,
      this.is_patient
      });

  static UserModelApi fromJson(Map<String, dynamic> json) {
    return UserModelApi(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      dob: json['dob'] ?? '',
      mobile: json['mobile'] ?? '',
      username: json['username'] ?? '',
      is_patient: json['is_patient'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['is_patient'] = this.is_patient;
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static UserModelApi empty() {
    return UserModelApi(
        email: '',
        name: '',
        password: '',
      dob: '',
      mobile: '',
      username: '',
      is_patient: true,
    );
  }
}
