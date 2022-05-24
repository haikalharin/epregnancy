
import '../master_menu_model/master_parent_menu_model.dart';

class UserEntity {
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

  UserEntity(
      {
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
      this.outletNickName});
}
//
// class UserEntity {
//   int id;
//   String? userCode;
//   String? userPassword;
//   String? userType;
//   String? userName;
//   String? defaultPasswordStatus;
//   String? userFrom;
//   String? jobCode;
//   String? passwordOci;
//   String? personId;
//   String? startDate;
//   String? endDate;
//   String? outletCode;
//   String? userStatus;
//   String? token;
//   List<MasterParentMenuModel> masterParent;
//
//   UserEntity(
//       {this.id,
//       this.userCode,
//       this.userPassword,
//       this.userType,
//       this.userName,
//       this.defaultPasswordStatus,
//       this.userFrom,
//       this.jobCode,
//       this.passwordOci,
//       this.personId,
//       this.startDate,
//       this.endDate,
//       this.outletCode,
//       this.userStatus,
//       this.token,
//       this.masterParentMenu});
// }
