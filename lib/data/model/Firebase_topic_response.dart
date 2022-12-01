class FirebaseTopicResponse {
Content? content;
String? successMessage;
int? code;
String? errorMessage;

FirebaseTopicResponse(
    {this.content, this.successMessage, this.code, this.errorMessage});

FirebaseTopicResponse.fromJson(Map<String, dynamic> json) {
content =
json['content'] != null ? new Content.fromJson(json['content']) : null;
successMessage = json['successMessage'];
code = json['code'];
errorMessage = json['errorMessage'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.content != null) {
    data['content'] = this.content?.toJson();
  }
  data['successMessage'] = this.successMessage;
  data['code'] = this.code;
  data['errorMessage'] = this.errorMessage;
  return data;
}
}

class Content {
  List<String>? allAvailableTopics;
  List<String>? userRelatedTopics;

  Content({this.allAvailableTopics, this.userRelatedTopics});

  Content.fromJson(Map<String, dynamic> json) {
    allAvailableTopics = json['allAvailableTopics'].cast<String>();
    userRelatedTopics = json['userRelatedTopics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allAvailableTopics'] = this.allAvailableTopics;
    data['userRelatedTopics'] = this.userRelatedTopics;
    return data;
  }
}