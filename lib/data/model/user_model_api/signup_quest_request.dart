class SignupQuestRequest {
  String? id;
  bool? isPregnant;
  bool? isPlanningPregnancy;
  bool? isHaveBaby;

  SignupQuestRequest(
      {this.id, this.isPregnant, this.isPlanningPregnancy, this.isHaveBaby});

  SignupQuestRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPregnant = json['is_pregnant'];
    isPlanningPregnancy = json['is_planning_pregnancy'];
    isHaveBaby = json['is_have_baby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_pregnant'] = this.isPregnant;
    data['is_planning_pregnancy'] = this.isPlanningPregnancy;
    data['is_have_baby'] = this.isHaveBaby;
    return data;
  }
}