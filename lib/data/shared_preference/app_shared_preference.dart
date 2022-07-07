import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/person_model/person_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_roles_model_firebase/user_roles_model_firebase.dart';

class AppSharedPreference {

  static final String _user = "user";
  static final String _role= "role";
  static final String _person = "person";

  static final String bmSignature = "bm_signature";



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


  static Future<UserExampleModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    Map<String,dynamic> map = jsonDecode(json!);
    return UserExampleModel.fromJson(map);
  }

  static setUser(UserExampleModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_user, json);
  }
  static Future<UserModelFirebase> getUserFirebaseInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    Map<String,dynamic> map = jsonDecode(json!);
    return UserModelFirebase.fromJson(map);
  }
  static Future<UserModelFirebase> getUserFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return UserModelFirebase.fromJson(map);
    } else{
      return UserModelFirebase.empty();
    }
  }

  static setUserFirebase(UserModelFirebase data) async {
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
    } else{
      return UserRolesModelFirebase.empty();
    }
  }

  static setUserRoleFirebase(UserRolesModelFirebase data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_role, json);
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
