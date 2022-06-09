import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/person_model/person_model.dart';
import '../model/user_model/user_model.dart';

class AppSharedPreference {
  static final String _userLogin = "user_login";
  static final String _userChangedProfile = "user_changed_profile";
  static final String _user = "user";
  static final String _lastLogin = "lastLogin";
  static final String _ukCount = "ukCount";
  static final String _ukVerifCount = "ukVerifCount";
  static final String bmSignature = "bm_signature";
  static final String _flagSijaka = "flagSijaka";
  static final String _AkunSukarela = "AkunSukarela";
  static final String _countVerifikasiOrder = 'count_verifikasi_order';
  static final String _countWakalahOrder = 'count_wakalah_order';
  static final String _countBastOrder = 'count_bast_order';
  static final String _countAktivasiOrder = 'count_aktivasi_order';
  static final String _sirelaCount = "sirelaCount";
  static final String _sijakaCount = "sijakaCount";
  static final String _collCount = "collCount";


  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_user);
    Map<String,dynamic> map = jsonDecode(json!);
    return UserModel.fromJson(map);
  }

  static setUser(UserModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_user, json);
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
