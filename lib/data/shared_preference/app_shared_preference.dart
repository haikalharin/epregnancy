import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:PregnancyApp/data/model/chat_model/chat_dialog_model.dart';
import 'package:PregnancyApp/data/model/hospital_model/hospital_model.dart';
import 'package:PregnancyApp/data/model/login_model/login_response_data.dart';
import 'package:PregnancyApp/data/model/otp_model/otp_model.dart';
import 'package:PregnancyApp/data/model/room_model/room_model.dart';
import 'package:PregnancyApp/data/model/user_model_firebase/user_model_firebase.dart';
import 'package:PregnancyApp/flavors.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/main_staging.dart';
import 'package:PregnancyApp/utils/secure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main_default.dart';
import '../../main_development.dart';
import '../../pages/login_page/login_page.dart';
import '../model/baby_model/baby_model.dart';
import '../model/baby_model/new_baby_model.dart';
import '../model/baby_model_api/baby_Model_api.dart';
import '../model/baby_progress_model/baby_progress_model.dart';
import '../model/person_model/person_model.dart';
import '../model/user_example_model/user_example_model.dart';
import '../model/user_model_api/user_model.dart';
import '../model/user_info/user_info.dart';
import '../model/user_roles_model_firebase/user_roles_model_firebase.dart';

class AppSharedPreference {
  static const String user = "user";
  static const String _userFirebase = "user";
  static const String _usernameRegister = "_usernameRegister";
  static const String userRegister = "_userRegister";
  static const String loginResponse = "_loginResponse";
  static const String role = "role";
  static const String baby = "baby";
  static const String babyProgress = "babyProfress";
  static const String _person = "person";
  static const String otp = "otp";
  static const String bmSignature = "bm_signature";
  static const String checkIn = "checkin";
  static const String hospital = "hospital";
  static const String dateTime = "dateTime";
  static const String haveBpjsorKis = "haveBpjsorKis";
  static const String token = "token";
  static const String newInstall = "new_install";
  static const String isFirstLaunch = "isFirstLaunch";
  static const String isShowGuide = "show_guide";
  static const String cookie = "cookie";
  static const String playlist = "playlist";

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  static setShowDialogDoAndDonts(ChatDialogModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(dateTime, json);
  }

  static Future<ChatDialogModel?> getShowDialogDoAndDonts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? json = prefs.getString(dateTime);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      ChatDialogModel chatDialogModel = ChatDialogModel.fromJson(map);
      return chatDialogModel;
    } else {
      return ChatDialogModel.empty();
    }
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
      HospitalModel hospitalModel = HospitalModel.fromJson(map);
      // HospitalModel _hospitalModel = hospitalModel.copyWith(
      //   // id: await aesDecryptor(hospitalModel.id)
      // );
      return hospitalModel;
    } else {
      return const HospitalModel(
          id: "",
          pin: 0,
          pinValidEnd: "",
          pinValidStart: "",
          alias: "",
          name: "",
          address: "",
          city: "",
          country: "",
          postalCode: "",
          phone: "",
          email: "",
          latitude: 0.0,
          longitude: 0.0,
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
    String? json = prefs.getString(_userFirebase);
    Map<String, dynamic> map = jsonDecode(json!);
    return UserModelFirebase.fromJson(map);
  }

  static Future<UserModelFirebase> getUserFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(_userFirebase);
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
    prefs.setString(_userFirebase, json);
  }

  static Future<UserModel> getUserRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(userRegister);
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
    prefs.setString(userRegister, json);
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(user);
    if (json != null) {
      String decryptedJson = decrypty(json);
      Map<String, dynamic> map = jsonDecode(decryptedJson);
      UserModel _userModel = UserModel.fromJson(map);
      UserModel userModel = _userModel.copyWith(
        name: _userModel.name != null
            ? await aesDecryptor(_userModel.name)
            : null,
        id: _userModel.id != null ? await aesDecryptor(_userModel.id) : null,
        email: _userModel.email != null ? await aesDecryptor(_userModel.email) : null,
      );
      return userModel;
    } else {
      return const UserModel();
    }
  }

  static Future<UserModel> getUserWithoutDecrypt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(user);
    if (json != null) {
      String decryptedJson = decrypty(json);
      Map<String, dynamic> map = jsonDecode(decryptedJson);
      UserModel _userModel = UserModel.fromJson(map);
      return _userModel;
    } else {
      return const UserModel();
    }
  }

  static setUser(UserModel data) async {
    String json = jsonEncode(data.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encryptedJson = encrypt(json);
    prefs.setString(user, encryptedJson);
    // prefs.setString(_user, json);
  }

  static Future<UserRolesModelFirebase> getUserRoleFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(role);
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
    prefs.setString(role, json);
  }

  static Future<BabyModel> getUserBabyirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(baby);
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
    prefs.setString(baby, json);
  }

  static Future<BabyProgressModel> getBabyProgressFirebase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(babyProgress);
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
    prefs.setString(babyProgress, json);
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

  static Future<LoginResponseData> getLoginResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString(loginResponse);
    if (json != null) {
      Map<String, dynamic> map = jsonDecode(json);
      return LoginResponseData.fromJson(map);
    } else {
      return const LoginResponseData(
          user: UserLogin(
              id: '',
              name: '',
              dob: '',
              username: '',
              status: '',
              createdDate: '',
              modifiedDate: '',
              email: '',
              mobile: '',
              imageUrl: '',
              hospitalId: '',
              hospital: HospitalLogin(
                  id: '',
                  alias: '',
                  name: '',
                  address: '',
                  city: '',
                  postalCode: '',
                  phone: '',
                  email: '',
                  imageUrl: '')),
          token: Token(
              id: '',
              userId: '',
              accessToken: '',
              refreshToken: '',
              type: '',
              expiration: '',
              issuedAt: '',
              isExpired: false,
              isDelete: false));
    }
  }
  static setLoginModelResponse(LoginResponseData data) async {
    String json = jsonEncode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loginResponse, json);
  }

  static setLoginResponse(Map<String,dynamic> data) async {
    String json = jsonEncode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loginResponse, json);
  }

  static Future<void> setPerson(PersonModel person) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('person', json.encode(person.toJson()));
  }

  static Future<BabyModelApi> getBabyData() async {
    BabyModelApi? baby = BabyModelApi.empty();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      String? personString = pref.getString('babyData');
      if (personString != null) {
        Map<String, dynamic> personJson = json.decode(personString);
        baby = BabyModelApi.fromJson(personJson);
      }
    } catch (e) {
      print(e);
    }
    return baby!;
  }

  static Future<void> setBabyData(BabyModelApi baby) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('babyData', json.encode(baby.toJson()));
  }

  static Future<NewBabyModel> getBabyDataNew() async {
    NewBabyModel? baby = const NewBabyModel();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      String? personString = pref.getString('babyDataNew');
      if (personString != null) {
        Map<String, dynamic> personJson = json.decode(personString);
        baby = NewBabyModel.fromJson(personJson);
      }
    } catch (e) {
      print(e);
    }
    return baby!;
  }

  static Future<void> setBabyDataNew(NewBabyModel baby) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('babyDataNew', json.encode(baby.toJson()));
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

  static sessionExpiredEvent() async {
    await AppSharedPreference.remove(AppSharedPreference.user);
    await AppSharedPreference.remove(AppSharedPreference.userRegister);
    await AppSharedPreference.remove(AppSharedPreference.baby);
    await AppSharedPreference.remove(AppSharedPreference.baby);
    await AppSharedPreference.remove(AppSharedPreference.hospital);
    await AppSharedPreference.remove(AppSharedPreference.otp);
    await AppSharedPreference.remove(AppSharedPreference.token);
    await AppSharedPreference.remove(AppSharedPreference.cookie);
    if (F.appFlavor == Flavor.PRODUCTION) {
      aliceProd.getNavigatorKey()?.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(
                    tokenExpired: true,
                  )),
          (route) => false);
    } else if(F.appFlavor == Flavor.STAGING) {
      aliceStaging.getNavigatorKey()?.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(
                tokenExpired: true,
              )),
              (route) => false);
    }else {
      aliceDev.getNavigatorKey()?.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage(
                    tokenExpired: true,
                  )),
          (route) => false);
    }
    //navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen(isHavePopUpMessage: "401",)));
  }
}
