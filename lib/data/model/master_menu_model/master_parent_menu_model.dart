
import 'master_menu_model.dart';

class MasterParentMenuModel {
  int? badge = 0;
  int? sort;
  String? parentMenuCode;
  String? parentMenuTitle;
  String? parentMenuSubtitle;
  String? parentMenuDesc;
  List<MasterMenuModel>? masterMenu;

  MasterParentMenuModel(
      {this.sort,
      this.parentMenuCode,
      this.parentMenuTitle,
      this.parentMenuSubtitle,
      this.parentMenuDesc,
      this.masterMenu});

  MasterParentMenuModel.fromJson(Map<String, dynamic> json) {
    sort = json['sort'];
    parentMenuCode = json['parent_menu_code'];
    parentMenuTitle = json['parent_menu_title'];
    parentMenuSubtitle = json['parent_menu_subtitle'];
    parentMenuDesc = json['parent_menu_desc'];
    if (json['master_menu'] != null) {
      masterMenu =  <MasterMenuModel>[];
      json['master_menu'].forEach((v) {
        masterMenu!.add(MasterMenuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sort'] = this.sort;
    data['parent_menu_code'] = this.parentMenuCode;
    data['parent_menu_title'] = this.parentMenuTitle;
    data['parent_menu_subtitle'] = this.parentMenuSubtitle;
    data['parent_menu_desc'] = this.parentMenuDesc;
    if (this.masterMenu != null) {
      data['master_menu'] = this.masterMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
