
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../flavors.dart';
import '../main_development.dart' as dev;
import '../main_production.dart' as prod;

dynamic getDataValue(dynamic result) => result;

dynamic getGameUrl(dynamic result) => result['game_url'];

dynamic getGameName(dynamic result) => result['game_name'];

dynamic getRoleArgument(dynamic result) => result['role'];

dynamic getTokenExpiredArgument(dynamic result) => result['token_expired'];

dynamic getIsFromRegisterArgument(dynamic result) => result['is_from_register'];

dynamic getIsPatient(dynamic result) => result['is_patient'];
dynamic getIsEdit(dynamic result) => result['is_edit'];
dynamic getEditName(dynamic result) => result['edit_name'];

dynamic getkey(dynamic result) => result['key'];

dynamic getInitialIndex(dynamic result) => result['initial_index'];

dynamic getUserId(dynamic result) => result['user_id'];

dynamic getIsFromNotif(dynamic result) => result['is_from_notif'];

dynamic getUserName(dynamic result) => result['username'];

dynamic getName(dynamic result) => result['name'];

dynamic getFrom(dynamic result) => result['from'];

dynamic getOtp(dynamic result) => result['otp'];

dynamic getImageUrl(dynamic result) => result['image_url'];

dynamic getHospitalId(dynamic result) => result['hospital_id'];

dynamic getDataCondition(dynamic result) => result['Condition'];

dynamic cekPersonInRoom(dynamic result) => result['inRoom'];

dynamic getPersonTokenFirebase(dynamic result) => result['token'];

dynamic getDateTimeFirebase(dynamic result) => result['dateTime'];

dynamic getPersonUid(dynamic result) => result['uid'];

dynamic getData(dynamic result) => result['data'];

int getCode(dynamic result) => result['code'];

dynamic getDataList(dynamic result) => result['total_results'];

dynamic getErrorResult(dynamic result) => result['error'];

String getFormattedUrl(String? url, Map<String, String>? variables) {
  return url!.replaceAllMapped(RegExp(r'{{\w+}}'), (match) {
    final key = match.group(0)!.replaceAll(RegExp(r'[{}]'), '');
    return variables![key]!;
  });
}

String remoteConfigGetString(String key) {
  if(F.appFlavor == Flavor.PRODUCTION){
    return prod.firebaseService.remoteConfig.getString(key);
  } else {
    var data =  dev.firebaseServiceUtils.remoteConfig.getString(key);
    print(data);
    return dev.firebaseServiceUtils.remoteConfig.getString(key);
  }
}

int remoteConfigGetInt(FirebaseRemoteConfig remoteConfig, String key) {
  if(F.appFlavor == Flavor.PRODUCTION){
    return prod.firebaseService.remoteConfig.getInt(key);
  } else {
    return dev.firebaseServiceUtils.remoteConfig.getInt(key);
  }
}


