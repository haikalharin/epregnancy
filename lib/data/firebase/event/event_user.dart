import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../model/person_model/person_model.dart';

class EventUser {
  static Future<UserModelFirebase> checkUser(
      String email, String password) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('USERS')
        .where('Userid', isEqualTo: email)
        .where('Password', isEqualTo: password)
        .get()
        .catchError((onError) => print(onError));
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      if (querySnapshot.docs.isNotEmpty) {
        final data = getDataValue(querySnapshot.docs[0].data());
        UserModelFirebase userModelFirebase = UserModelFirebase.fromJson(data);
        return userModelFirebase;
      } else {
        return UserModelFirebase.empty();
      }
    }
    return UserModelFirebase.empty();
  }

  static Future<bool> updateActiveUser({String? myUid, String? status}) async {
    try {
      final data = FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .update({'Status': status})
          .then((value) => null)
          .catchError((onError) => print(onError));
      if(data != null){
        return true;
      } else{
        return false;
      }

    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateConditionUser({
    String? myUid,
    String? condition,
  }) async {
    try {
      FirebaseFirestore.instance
          .collection('USER_ROLES')
          .doc(myUid)
          .update({'Condition': condition})
          .then((value) => null)
          .catchError((onError) => print(onError));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
