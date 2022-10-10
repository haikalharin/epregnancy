import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/baby_model/baby_model.dart';
import '../model/baby_progress_model/baby_progress_model.dart';
import '../model/person_model/person_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/user_model.dart';
import '../model/user_info/user_info.dart';
import '../model/user_roles_model_firebase/user_roles_model_firebase.dart';

class AppSharedPreference {
  static const String _user = "user";
  static const String _usernameRegister = "_usernameRegister";
  static const String _userRegister = "_userRegister";
  static const String _role = "role";
  static const String _baby = "baby";
  static const String _babyProgress = "babyProfress";
  static const String _person = "person";
  static const String otp = "otp";
  static const String bmSignature = "bm_signature";
  static const String checkIn = "checkin";
  static const String hospital = "hospital";
  static const String haveBpjsorKis = "haveBpjsorKis";
  static const String token = "token";
  static const String newInstall = "new_install";

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

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static setUserInfo(UserInfo data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encryptedJson = encrypt(json);
    prefs.setString(checkIn, encryptedJson);
  }

  static setHospital(HospitalModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(hospital, json);
  }

  static Future<HospitalModel> getHospital() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(hospital);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return HospitalModel.fromJson(map);
    } else {
      return const HospitalModel(
          id: "",
          alias: "",
          name: "",
          address: "",
          city: "",
          country: "",
          postalCode: "",
          phone: "",
          email: "",
          latitude: 0,
          longitude: 0,
          status: "",
          imageUrl: "",
          coverUrl: "",
          isDelete: false,
          createdBy: "",
          createdFrom: "",
          createdDate: "",
          modifiedBy: "",
          modifiedFrom: "",
          modifiedDate: "");
    }
  }

  static Future<UserInfo> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(checkIn);
    String decryptedJson = decrypty(json!);
    Map<String, dynamic> map = jsonDecode(decryptedJson);
    return UserInfo.fromJson(map);
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

  static Future<UserModel> getUserRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_userRegister);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return UserModel.fromJson(map);
    } else {
      return const UserModel();
    }
  }

  static setUserRegister(UserModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userRegister, json);
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return UserModel.fromJson(map);
    } else {
      return const UserModel();
    }
  }

  static setUser(UserModel data) async {
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

  static setOtp(OtpModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(otp, json);
  }

  static Future<OtpModel> getOtp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(otp);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return OtpModel.fromJson(map);
    } else {
      return OtpModel.empty();
    }
  }
}
