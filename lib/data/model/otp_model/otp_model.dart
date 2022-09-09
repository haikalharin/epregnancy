import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class OtpModel implements BaseModel{
  String? otp;
  String? email;

  OtpModel({this.otp, this.email});



  static OtpModel fromJson(Map<String, dynamic> json) {
    return OtpModel(
        otp: json['otp'],
        email: json['email'],

    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['email'] = this.email;
    return data;
  }



  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static OtpModel empty() {
    return OtpModel(
        otp: '',
        email: '',
    );}
}
