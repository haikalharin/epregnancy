class RequestConsultationModel {
  String? message;
  String? imageBase64;

  RequestConsultationModel({this.message, this.imageBase64});

  RequestConsultationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    imageBase64 = json['image_base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['image_base64'] = this.imageBase64;
    return data;
  }
}