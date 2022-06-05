import 'package:flutter/cupertino.dart';

import '../base_model/base_model.dart';
import '../master_menu_model/master_parent_menu_model.dart';

class UserModel implements BaseModel {
  String? userId;
  String? userName;
  String? userPassword;
  String? userCreated;
  String? userCreatedBy;
  String? userUpdated;
  String? userUpdateBy;
  String? userPersonId;
  String? userStartDate;
  String? userEndDate;
  String? userDescription;
  String? userLastLogon;
  String? userLastPassword;
  String? userPassLifespan;
  String? userPassNeedChg;
  String? userEnableSts;
  String? userCoyoutlet;
  String? referralCode;
  String? token;
  String? userImgUrl;
  List<MasterParentMenuModel>? masterParent;
  String? jobName;
  String? userType;
  List<String?>? cluster;
  String? outletNickName;

  UserModel({
    this.userId,
    this.userName,
    this.userPassword,
    this.userCreated,
    this.userCreatedBy,
    this.userUpdated,
    this.userUpdateBy,
    this.userPersonId,
    this.userStartDate,
    this.userEndDate,
    this.userDescription,
    this.userLastLogon,
    this.userLastPassword,
    this.userPassLifespan,
    this.userPassNeedChg,
    this.userEnableSts,
    this.userCoyoutlet,
    this.referralCode,
    this.token,
    this.userImgUrl,
    this.masterParent,
    this.jobName,
    this.userType,
    this.cluster,
    this.outletNickName,
  });

  UserModel copyWith(
      {String? userId,
      String? userName,
      String? userPassword,
      String? userCreated,
      String? userCreatedBy,
      String? userUpdated,
      String? userUpdateBy,
      String? userPersonId,
      String? userStartDate,
      String? userEndDate,
      String? userDescription,
      String? userLastLogon,
      String? userLastPassword,
      String? userPassLifespan,
      String? userPassNeedChg,
      String? userEnableSts,
      String? userCoyoutlet,
      String? referralCode,
      String? token,
      String? userImgUrl,
      List<MasterParentMenuModel>? masterParent,
      String? jobName,
      String? userType,
      List<String?>? cluster,
      String? outletNickName}) {
    return UserModel(
      // DATA
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      userCreated: userCreated ?? this.userCreated,
      userCreatedBy: userCreatedBy ?? this.userCreatedBy,
      userUpdated: userUpdated ?? this.userUpdated,
      userUpdateBy: userUpdateBy ?? this.userUpdateBy,
      userPersonId: userPersonId ?? this.userPersonId,
      userStartDate: userStartDate ?? this.userStartDate,
      userEndDate: userEndDate ?? this.userEndDate,
      userDescription: userDescription ?? this.userDescription,
      userLastLogon: userLastLogon ?? this.userLastLogon,
      userLastPassword: userLastPassword ?? this.userLastPassword,
      userPassLifespan: userPassLifespan ?? this.userPassLifespan,
      userPassNeedChg: userPassNeedChg ?? this.userPassNeedChg,
      userEnableSts: userEnableSts ?? this.userEnableSts,
      userCoyoutlet: userCoyoutlet ?? this.userCoyoutlet,
      referralCode: referralCode ?? this.referralCode,
      token: token ?? this.token,
      userImgUrl: userImgUrl ?? this.userImgUrl,
      masterParent: masterParent ?? this.masterParent,
      jobName: jobName ?? this.jobName,
      userType: userType ?? this.userType,
      cluster: cluster ?? this.cluster,
      outletNickName: outletNickName ?? this.outletNickName,
    );
  }

//UserModel(
//    {this.id,
//      this.userCode,
//      this.userName,
//      this.defaultPasswordStatus,
//      this.userFrom,
//      this.jobCode,
//      this.passwordOci,
//      this.personId,
//      this.startDate,
//      this.endDate,
//      this.outletCode,
//      this.userStatus,
//      this.token}),

  Map<String?, dynamic> toLoginJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['userCode'] = this.userId;
    data['userPassword'] = this.userPassword;
    data['userType'] = this.userType;
    return data;
  }

  Map<String, dynamic> toChangeProfileJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_img'] = this.userImgUrl;

    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_password'] = this.userPassword;
    data['user_created'] = this.userCreated;
    data['user_created_by'] = this.userCreatedBy;
    data['user_updated'] = this.userUpdated;
    data['user_update_by'] = this.userUpdateBy;
    data['user_person_id'] = this.userPersonId;
    data['user_start_date'] = this.userStartDate;
    data['user_end_date'] = this.userEndDate;
    data['user_description'] = this.userDescription;
    data['user_last_logon'] = this.userLastLogon;
    data['user_last_password'] = this.userLastPassword;
    data['user_pass_lifespan'] = this.userPassLifespan;
    data['user_pass_need_chg'] = this.userPassNeedChg;
    data['user_enable_sts'] = this.userEnableSts;
    data['user_coyoutlet'] = this.userCoyoutlet;
    data['referral_code'] = this.referralCode;
    data['token'] = this.token;
    data['user_img_url'] = this.userImgUrl;
    if (this.masterParent != null) {
      data['master_parent'] =
          this.masterParent!.map((v) => v.toJson()).toList();
    }
    data['job_name'] = this.jobName;
    data['user_type'] = this.userType;
    data['cluster'] = this.cluster;
    data['outlet_nick_name'] = this.outletNickName;
    return data;
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    List<MasterParentMenuModel> masterParentMenus = <MasterParentMenuModel>[];

    try {
      if (json['master_parent'] != null) {
        json['master_parent'].forEach((v) {
          masterParentMenus.add(MasterParentMenuModel.fromJson(v));
        });
      }
    } on Exception catch (e) {
      print(e);
    }

    List<String?> clusters = [];
    if (json['cluster'] != null) {
      clusters = json['cluster'].cast<String?>();
    }

    return UserModel(
      userId: json['user_id'],
      userName: json['user_name'],
      userPassword: json['user_password'],
      userCreated: json['user_created'],
      userCreatedBy: json['user_created_by'],
      userUpdated: json['user_updated'],
      userUpdateBy: json['user_update_by'],
      userPersonId: json['user_person_id'],
      userStartDate: json['user_start_date'],
      userEndDate: json['user_end_date'],
      userDescription: json['user_description'],
      userLastLogon: json['user_last_logon'],
      userLastPassword: json['user_last_password'],
      userPassLifespan: json['user_pass_lifespan'],
      userPassNeedChg: json['user_pass_need_chg'],
      userEnableSts: json['user_enable_sts'],
      userCoyoutlet: json['user_coyoutlet'],
      referralCode: json['referral_code'],
      token: json['token'],
      userImgUrl: json['user_img_url'],
      masterParent: masterParentMenus,
      jobName: json['job_name'],
      userType: json['user_type'],
      cluster: clusters,
      outletNickName: json['outlet_nick_name'],
    );
  }

  @override
  jsonToModel(Map<String, dynamic> json) {
    return fromJson(json);
  }

  static UserModel empty(Map<String, dynamic> json) {
    return UserModel(
        userId: "",
        userName: "",
        userPassword: "",
        userCreated: "",
        userCreatedBy: "",
        userUpdated: "",
        userUpdateBy: "",
        userPersonId: "",
        userStartDate: "",
        userEndDate: "",
        userDescription: "",
        userLastLogon: "",
        userLastPassword: "",
        userPassLifespan: "",
        userPassNeedChg: "",
        userEnableSts: "",
        userCoyoutlet: "",
        referralCode: "",
        token: "",
        userImgUrl: "",
        masterParent: [],
        jobName: "",
        userType: "",
        cluster: [],
        outletNickName: "");
  }
}
