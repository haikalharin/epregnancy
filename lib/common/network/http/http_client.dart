import 'dart:convert';
import 'dart:io';

import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/env.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/core/alice_http_extensions.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/user_example_model/user_example_model.dart';
import '../../../data/shared_preference/app_shared_preference.dart';
import '../../../flavors.dart';
import '../../../main_default.dart';
import '../../../utils/string_constans.dart';
import '../../configurations/configurations.dart';
import '../../remote/url/service_url.dart';
import '../http_constants.dart';
import 'http_util.dart';

class HttpClient {
  Client? _client;
  String? host = Configurations.host;
  Map<String, String>? header;
  bool cookieFromSp = true;

  HttpClient() {
    _client = Client();
    // todo delete hardcoded token
    header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Uri _getParsedUrl(String path, {Map<String, String>? queryParameters}) {
    String h = host!;
    String _subHost = Configurations.sub_host+ "/";
    String finalPath = _subHost + path;
    if (h.contains("//")) {
      h = h.split("//")[1];
    }

    if (h.contains("/")) {
      h = h.replaceAll("/", "");
    }
    // return Uri.http(h, path, queryParameters);
    return Uri.https(h, finalPath, queryParameters);
  }

  dynamic get(String path, {Map<String, String>? queryParameters}) async {
    debugPrint('>>>>>>> [GET] ${_getParsedUrl(path)}');

    String? token = await getToken();
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    print('cookie : $cookie');
    if (cookie != null) {
      setCookieFromSession(cookie);
    }

    // TODO DO NOT USE THIS STATIC TOKEN FOR PROD
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    late Response response;
    if (Configurations.isShowChucker == true) {
      if(F.appFlavor == Flavor.PRODUCTION){
        response = await _client!
            .get(
          _getParsedUrl(path, queryParameters: queryParameters),
          headers: header,
        )
            .timeout(Duration(minutes: 2))
            .interceptWithAlice(aliceProd);
      } else {
        response = await _client!
            .get(
          _getParsedUrl(path, queryParameters: queryParameters),
          headers: header,
        )
            .timeout(Duration(minutes: 2))
            .interceptWithAlice(aliceMain);
      }

    } else {
      response = await _client!
          .get(
            _getParsedUrl(path, queryParameters: queryParameters),
            headers: header,
          )
          .timeout(Duration(minutes: 2));
    }
    return HttpUtil.getResponse(response);
  }

  Future<Response?> downloadFile(String path) async {
    late Response response;
    if (Configurations.isShowChucker == true) {
      if(F.appFlavor == Flavor.PRODUCTION){
        response = await _client!
            .get(
          _getParsedUrl(path),
          headers: header,
        )
            .interceptWithAlice(aliceProd, body: path);
      } else {
        response = await _client!
            .get(
          _getParsedUrl(path),
          headers: header,
        )
            .interceptWithAlice(aliceMain, body: path);
      }
    } else {
      response = await _client!.get(
        _getParsedUrl(path),
        headers: header,
      );
    }
    return response.statusCode == 201 ? response : null;
  }

  dynamic post(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;

    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    String? token = await getToken();
    String? cookie = await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;
    late Response response;
    if (Configurations.isShowChucker == true) {
      if(F.appFlavor == Flavor.PRODUCTION) {
        response = await _client!
            .post(
          _getParsedUrl(path),
          body: HttpUtil.encodeRequestBody(
             json.encode(data), requestHeader![HttpConstants.contentType]!),
          headers: requestHeader,
        )
            .interceptWithAlice(aliceProd, body: data);
      } else  {
        response = await _client!
            .post(
          _getParsedUrl(path),
          body: HttpUtil.encodeRequestBody(
              json.encode(data), requestHeader![HttpConstants.contentType]!),
          headers: requestHeader,
        )
            .interceptWithAlice(aliceMain, body: data);
      }
      updateCookie(response);
    } else {
      response = await _client!.post(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
      updateCookie(response);
    }

    return HttpUtil.getResponse(response);
  }

  dynamic delete(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;

    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    String? token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .delete(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .interceptWithAlice(F.appFlavor == Flavor.PRODUCTION ? aliceProd : aliceMain, body: data);
    } else {
      response = await _client!.delete(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
    }
    return HttpUtil.getResponse(response);
  }

  dynamic put(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;

    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${data.toString()}');

    String? token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }

    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .put(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .interceptWithAlice(F.appFlavor == Flavor.PRODUCTION ? aliceProd : aliceMain, body: data);
    } else {
      response = await _client!.put(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
    }

    return HttpUtil.getResponse(response);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(AppSharedPreference.token);
    if (userString == null) return null;
    return userString;
  }

  void updateCookie(Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      AppSharedPreference.setString(AppSharedPreference.cookie, rawCookie);
      int index = rawCookie.indexOf(';');
      header!['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  void setCookieFromSession(String cookie) {
    if (cookie != null) {
      int index = cookie.indexOf(';');
      header!['cookie'] = (index == -1) ? cookie : cookie.substring(0, index);
    }
  }
}
