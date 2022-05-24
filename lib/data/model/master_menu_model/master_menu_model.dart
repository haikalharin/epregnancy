class MasterMenuModel {
  int? badge = 0;
  String? menuCode;
  String? menuTitle;
  String? menuDesc;
  int? menuSort;
  String? status;

  MasterMenuModel({this.menuCode, this.menuDesc, this.status, this.menuSort});

  MasterMenuModel.fromJson(Map<String, dynamic> json) {
    menuCode = json['menu_code'];
    menuTitle = json['menu_title'];
    menuDesc = json['menu_desc'];
    status = json['status'];
    menuSort = json['menu_sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_code'] = this.menuCode;
    data['menu_title'] = this.menuTitle;
    data['menu_desc'] = this.menuDesc;
    data['status'] = this.status;
    data['menu_sort'] = this.menuSort;
    return data;
  }
}
