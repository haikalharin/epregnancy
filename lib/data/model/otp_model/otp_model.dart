import 'package:PregnancyApp/data/model/base_model/base_model.dart';

class OtpModel implements BaseModel {
  String? id;
  String? createdDate;
  String? otp;
  String? type;
  String? value;

  OtpModel({this.otp, this.type, this.value,this.id,this.createdDate});

  static OtpModel fromJson(Map<String, dynamic> json) {
    return OtpModel(
      id: json['id'],
      createdDate: json['created_date'],
      otp: json['otp'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_date'] = this.createdDate;
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
      id: '',
      createdDate: '',
      otp: '',
      type: '',
      value: '',
    );
  }
}
