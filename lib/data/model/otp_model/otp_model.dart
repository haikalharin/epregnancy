import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class OtpModel implements BaseModel {
  String? otp;
  String? type;
  String? value;

  OtpModel({this.otp, this.type, this.value});

  static OtpModel fromJson(Map<String, dynamic> json) {
    return OtpModel(
      otp: json['otp'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static OtpModel empty() {
    return OtpModel(
      otp: '',
      type: '',
      value: '',
    );
  }
}
