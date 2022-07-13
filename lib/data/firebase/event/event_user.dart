import 'dart:math';

import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/data/model/user_roles_model_firebase/user_roles_model_firebase.dart';
import 'package:PregnancyApp/utils/remote_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../data/model/person_model/person_model.dart';
import '../../model/baby_model/baby_model.dart';
import '../../model/baby_progress_model/baby_progress_model.dart';

class EventUser {
  static Future<UserModelFirebase> checkUser(
      String username, String password) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('USERS')
        .where('Userid', isEqualTo: username)
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
  static Future<BabyProgressModel> checkBabyProgress(String babyAgeInWeeks) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('BABY_PROGRESS')
        .where('BabyAgeInWeeks', isEqualTo: babyAgeInWeeks)
        .get()
        .catchError((onError) => print(onError));
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      if (querySnapshot.docs.isNotEmpty) {
        final data = getDataValue(querySnapshot.docs[0].data());
        BabyProgressModel babyProgressModel = BabyProgressModel.fromJson(data);
        return babyProgressModel;
      } else {
        return BabyProgressModel.empty();
      }
    }
    return BabyProgressModel.empty();
  }

  static Future<UserModelFirebase> checkUserExist(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('USERS')
        .where('Userid', isEqualTo: userId)
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

  static Future<UserRolesModelFirebase> checkRoleExist(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('USER_ROLES')
        .where('UserId', isEqualTo: userId)
        .get()
        .catchError((onError) => print(onError));
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      if (querySnapshot.docs.isNotEmpty) {
        final data = getDataValue(querySnapshot.docs[0].data());
        UserRolesModelFirebase userRolesModelFirebase =
            UserRolesModelFirebase.fromJson(data);
        return userRolesModelFirebase;
      } else {
        return UserRolesModelFirebase.empty();
      }
    }
    return UserRolesModelFirebase.empty();
  }

  static Future<BabyModel> checkBabyExist(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('BABY_PROFILE')
        .where('UserUid', isEqualTo: userId)
        .get()
        .catchError((onError) => print(onError));
    if (querySnapshot != null && querySnapshot.docs.isNotEmpty) {
      if (querySnapshot.docs.isNotEmpty) {
        final data = getDataValue(querySnapshot.docs[0].data());
        BabyModel babyModel =
        BabyModel.fromJson(data);
        return babyModel;
      } else {
        return BabyModel.empty();
      }
    }
    return BabyModel.empty();
  }

  static Future<String> getUserToken(String uid) async {
    String token = '';
    try {
      DocumentSnapshot response = await FirebaseFirestore.instance
          .collection('USERS')
          .doc(uid)
          .get()
          .catchError((onError) => print(onError));
      token = getPersonTokenFirebase(response.data());
    } catch (e) {
      print(e);
    }
    return token;
  }

  static void addUser(UserModelFirebase user) {
    try {
      FirebaseFirestore.instance
          .collection('USERS')
          .doc(user.uid)
          .set(user.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> updateActiveUser({String? myUid, String? status}) async {
    try {
      final data = FirebaseFirestore.instance
          .collection('USERS')
          .doc(myUid)
          .update({'Status': status})
          .then((value) => null)
          .catchError((onError) => print(onError));
      if (data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> updateConditionUser({
    UserRolesModelFirebase? data,
  }) async {
    try {
      FirebaseFirestore.instance
          .collection('USER_ROLES')
          .doc(data!.uid)
          .set(data.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> addConditionUser({
    UserRolesModelFirebase? data,
  }) async {
    try {

      FirebaseFirestore.instance
          .collection('USER_ROLES')
          .doc(data!.uid)
          .set(data.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  static Future<bool> addBabyUser({
    BabyModel? data,
  }) async {
    try {

      FirebaseFirestore.instance
          .collection('BABY_PROFILE')
          .doc(data!.babyProfileid)
          .set(data.toJson())
          .then((value) => null)
          .catchError((onError) => print(onError));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<UserModelFirebase> getUser(String? uid) async {
    UserModelFirebase? user;
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('USERS')
          .doc(uid!)
          .get()
          .catchError((onError) => print(onError));
      final data = getDataValue(documentSnapshot.data());
      user = UserModelFirebase.fromJson(data);
    } catch (e) {
      print(e);
    }
    return user!;
  }
}
