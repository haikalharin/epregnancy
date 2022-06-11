import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../model/person_model/person_model.dart';

class EventUser {
  static Future<UserModelFirebase> checkUser(String email, String password) async {
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
        return userModelFirebase ;
      } else {
        return UserModelFirebase.empty();
      }
    }
    return UserModelFirebase.empty();
  }

}
