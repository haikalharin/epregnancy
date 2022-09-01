import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/baby_model/baby_model.dart';
import '../model/baby_progress_model/baby_progress_model.dart';
import '../model/person_model/person_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/user_model_api.dart';
import '../model/user_info/user_info.dart';
import '../model/user_roles_model_firebase/user_roles_model_firebase.dart';

class AppSharedPreference {
  static final String _user = "user";
  static final String _usernameRegister = "_usernameRegister";
  static final String _userRegister = "_userRegister";
  static final String _role = "role";
  static final String _baby = "baby";
  static final String _babyProgress = "babyProfress";
  static final String _person = "person";

  static final String bmSignature = "bm_signature";

  static final String checkIn = "checkin";

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<UserModelApi> getUserRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_userRegister);
    Map<String, dynamic> map = jsonDecode(json!);
    return UserModelApi.fromJson(map);
  }

  static setUserRegister(UserModelApi data) async {
  static setUserInfo(UserInfo data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(checkIn, json);
  }

  static Future<UserInfo> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(checkIn);
    Map<String, dynamic> map = jsonDecode(json!);
    return UserInfo.fromJson(map);
  }

  static setUserRegister(UserModelFirebase data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userRegister, json);
  }

  static Future<String> getUsernameRegisterUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(_usernameRegister);
    return data ?? '';
  }

  static setUsernameRegisterUser(String data) async {
    String dataFix = data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernameRegister, dataFix);
  }

  static Future<UserModelFirebase> getUserFirebaseInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    Map<String, dynamic> map = jsonDecode(json!);
    return UserModelFirebase.fromJson(map);
  }

  static Future<UserModelFirebase> getUserFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return UserModelFirebase.fromJson(map);
    } else {
      return UserModelFirebase.empty();
    }
  }

  static setUserFirebase(UserModelFirebase data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_user, json);
  }

  static Future<UserModelApi> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    Map<String, dynamic> map = jsonDecode(json!);
    return UserModelApi.fromJson(map);
  }

  static setUser(UserModelApi data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_user, json);
  }

  static Future<UserRolesModelFirebase> getUserRoleFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_role);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return UserRolesModelFirebase.fromJson(map);
    } else {
      return UserRolesModelFirebase.empty();
    }
  }

  static setUserRoleFirebase(UserRolesModelFirebase data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_role, json);
  }

  static Future<BabyModel> getUserBabyirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_baby);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return BabyModel.fromJson(map);
    } else {
      return BabyModel.empty();
    }
  }

  static setUserBabyFirebase(BabyModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_baby, json);
  }

  static Future<BabyProgressModel> getBabyProgressFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_babyProgress);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return BabyProgressModel.fromJson(map);
    } else {
      return BabyProgressModel.empty();
    }
  }

  static setBabyProgressFirebase(BabyModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_babyProgress, json);
  }

  static Future<PersonModel> getPerson() async {
    PersonModel? person = PersonModel.empty();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      String? personString = await AppSharedPreference.getString('person');
      if (personString != null) {
        Map<String, dynamic> personJson = json.decode(personString);
        person = PersonModel.fromJson(personJson);
      }
    } catch (e) {
      print(e);
    }
    return person!;
  }

  static Future<void> setPerson(PersonModel person) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('person', json.encode(person.toJson()));
  }
}
