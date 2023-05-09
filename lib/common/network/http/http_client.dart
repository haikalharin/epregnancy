import 'dart:convert';
import 'dart:io';

import 'package:PregnancyApp/common/constants/app_constants.dart';
import 'package:PregnancyApp/data/model/login_model/login_response_data.dart';
import 'package:PregnancyApp/data/model/response_model/response_model.dart';
import 'package:PregnancyApp/data/model/user_model_api/user_model.dart';
import 'package:PregnancyApp/data/repository/user_repository/user_repository.dart';
import 'package:PregnancyApp/env.dart';
import 'package:PregnancyApp/main_development.dart';
import 'package:PregnancyApp/main_production.dart';
import 'package:PregnancyApp/main_staging.dart';
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
import '../../exceptions/server_error_exception.dart';
import '../../remote/url/service_url.dart';
import '../http_constants.dart';
import 'http_util.dart';

class HttpClient {
  Client? _client;
  String? host = Configurations.host;
  String? token = '';
  String? refreshToken = '';
  Map<String, String>? header;
  bool cookieFromSp = true;
  bool isRefresh = false;

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
    String _subHost = Configurations.sub_host + "/";
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

  Future<Response?> getAccess(String path,
      {Map<String, String>? queryParameters}) async {
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .get(
            _getParsedUrl(path, queryParameters: queryParameters),
            headers: header,
          )
          .timeout(Duration(minutes: 2))
          .interceptWithAlice(
              F.appFlavor == Flavor.PRODUCTION
                  ? aliceProd
                  : F.appFlavor == Flavor.STAGING
                      ? aliceStaging
                      : aliceDev,
              body: path);
    } else {
      response = await _client!
          .get(
            _getParsedUrl(path, queryParameters: queryParameters),
            headers: header,
          )
          .timeout(Duration(minutes: 2));
    }

    return response;
  }

  dynamic get(String path, {Map<String, String>? queryParameters}) async {
    debugPrint('>>>>>>> [GET] ${_getParsedUrl(path)}');
    token = await getToken();
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    print('cookie : $cookie');
    if (cookie != null) {
      setCookieFromSession(cookie);
    }

    // TODO DO NOT USE THIS STATIC TOKEN FOR PROD
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    Response? response =
        await getAccess(path, queryParameters: queryParameters);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    if (responseData['code'] == 404 ||
        responseData['code'] == 403 ||
        responseData['code'] == 401) {
      Map<String, String> body = {};
      LoginResponseData data = await AppSharedPreference.getLoginResponse();
      body = {
        'access_token': data.token?.accessToken ?? '',
        'refresh_token': data.token?.refreshToken ?? ''
      };

      final Map<String, String>? requestHeader = header;
      response = await _client!
          .post(
            _getParsedUrl(ServiceUrl.refreshToken),
            body: HttpUtil.encodeRequestBody(
                json.encode(body), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .timeout(Duration(minutes: 2)).interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: body);
      updateCookie(response);

      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      if (dataResponse['code'] == 200) {
        isRefresh = true;
        String? newToken = dataResponse['data']['token']['access_token'];
        token = newToken;
        refreshToken = dataResponse['data']['token']['refresh_token'];
        await AppSharedPreference.setString(
            AppSharedPreference.token, newToken ?? '');
        await AppSharedPreference.setLoginResponse(dataResponse['data']);
        header![HttpHeaders.authorizationHeader] = 'Bearer $newToken';
        String? cookie =
            await AppSharedPreference.getString(AppSharedPreference.cookie);
        print('cookie : $cookie');
        if (cookie != null) {
          setCookieFromSession(cookie);
        }

        response = await getAccess(path, queryParameters: queryParameters);
        responseData = HttpUtil.getResponse(response ?? Response('', 0));
      } else if (dataResponse['code'] == 401 || dataResponse['code'] == 403) {
        responseData = UnAuthorizeException(
          json.decode(response.body),
        );
      }
    }
    return responseData;
  }

  Future<Response?> downloadAccess(String path) async {
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .get(
            _getParsedUrl(path),
            headers: header,
          )
          .interceptWithAlice(
              F.appFlavor == Flavor.PRODUCTION
                  ? aliceProd
                  : F.appFlavor == Flavor.STAGING
                      ? aliceStaging
                      : aliceDev,
              body: path);
    } else {
      response = await _client!.get(
        _getParsedUrl(path),
        headers: header,
      );
    }

    return response;
  }

  Future<Response?> downloadFile(String path) async {
    Response? response = await downloadAccess(path);
    return response?.statusCode == 201 ? response : null;
  }

  dynamic postAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .post(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .interceptWithAlice(
              F.appFlavor == Flavor.PRODUCTION
                  ? aliceProd
                  : F.appFlavor == Flavor.STAGING
                      ? aliceStaging
                      : aliceDev,
              body: data);

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

    return response;
  }

  dynamic post(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    // todo fix refresh token
    Response? response = await postAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    if (responseData['code'] == 404 || responseData['code'] == 403 || responseData['code'] == 401) {
      Map<String, String> body = {};
      LoginResponseData loginData = await AppSharedPreference.getLoginResponse();
      body = {
        'access_token': loginData.token?.accessToken ?? '',
        'refresh_token': loginData.token?.refreshToken ?? ''
      };

      final Map<String, String>? requestHeader = header;
      response = await _client!
          .post(
            _getParsedUrl(ServiceUrl.refreshToken),
            body: HttpUtil.encodeRequestBody(
                json.encode(body), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .timeout(Duration(minutes: 2)).interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: body);
      updateCookie(response);

      updateCookie(response);

      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      if (dataResponse['code'] == 200) {
        isRefresh = true;
        String? newToken = dataResponse['data']['token']['access_token'];
        token = newToken;
        refreshToken = dataResponse['data']['token']['refresh_token'];
        await AppSharedPreference.setString(
            AppSharedPreference.token, newToken ?? '');
        await AppSharedPreference.setLoginResponse(dataResponse['data']);
        header![HttpHeaders.authorizationHeader] = 'Bearer $newToken';


        String? cookie =
            await AppSharedPreference.getString(AppSharedPreference.cookie);
        print('cookie : $cookie');
        if (cookie != null) {
          setCookieFromSession(cookie);
        }

        response = await postAccess(path, data, overrideHeader: overrideHeader);
        responseData = HttpUtil.getResponse(response ?? Response('', 0));
      } else if (dataResponse['code'] == 401 || dataResponse['code'] == 403) {
        responseData = UnAuthorizeException(
          json.decode(response.body),
        );
      }
    }

    return responseData;
  }

  dynamic postLogin(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    // todo fix refresh token
    Response? response =
        await postAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));
    return responseData;
  }

  dynamic deleteAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .delete(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .interceptWithAlice(
              F.appFlavor == Flavor.PRODUCTION
                  ? aliceProd
                  : F.appFlavor == Flavor.STAGING
                      ? aliceStaging
                      : aliceDev,
              body: data);
    } else {
      response = await _client!.delete(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
    }
    return response;
  }

  dynamic delete(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;
    Response? response =
        await deleteAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    if (responseData['code'] == 404 ||
        responseData['code'] == 403 ||
        responseData['code'] == 401) {
      Map<String, String> body = {};

      LoginResponseData loginData = await AppSharedPreference.getLoginResponse();
      body = {
        'access_token': loginData.token?.accessToken ?? '',
        'refresh_token': loginData.token?.refreshToken ?? ''
      };

      final Map<String, String>? requestHeader = header;
      response = await _client!
          .post(
            _getParsedUrl(ServiceUrl.refreshToken),
            body: HttpUtil.encodeRequestBody(
                json.encode(body), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .timeout(Duration(minutes: 2)).interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: body);
      updateCookie(response);

      updateCookie(response);

      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      if (dataResponse['code'] == 200) {

        isRefresh = true;
        String? newToken = dataResponse['data']['token']['access_token'];
        token = newToken;
        refreshToken = dataResponse['data']['token']['refresh_token'];
        await AppSharedPreference.setString(
            AppSharedPreference.token, newToken ?? '');
        await AppSharedPreference.setLoginResponse(dataResponse['data']);
        header![HttpHeaders.authorizationHeader] = 'Bearer $newToken';

        String? cookie =
            await AppSharedPreference.getString(AppSharedPreference.cookie);
        print('cookie : $cookie');
        if (cookie != null) {
          setCookieFromSession(cookie);
        }
        response =
            await deleteAccess(path, data, overrideHeader: overrideHeader);
        responseData = HttpUtil.getResponse(response ?? Response('', 0));
      } else if (dataResponse['code'] == 401 || dataResponse['code'] == 403) {
        responseData = UnAuthorizeException(
          json.decode(response.body),
        );
      }
    }

    return responseData;
  }

  dynamic putAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .put(
            _getParsedUrl(path),
            body: HttpUtil.encodeRequestBody(
                json.encode(data), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .interceptWithAlice(
              F.appFlavor == Flavor.PRODUCTION
                  ? aliceProd
                  : F.appFlavor == Flavor.STAGING
                      ? aliceStaging
                      : aliceDev,
              body: data);
    } else {
      response = await _client!.put(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
    }

    return response;
  }

  dynamic put(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${data.toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }

    Response? response =
        await putAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    if (responseData['code'] == 404 ||
        responseData['code'] == 403 ||
        responseData['code'] == 401) {
      Map<String, String> body = {};

      LoginResponseData loginData = await AppSharedPreference.getLoginResponse();
      body = {
        'access_token': loginData.token?.accessToken ?? '',
        'refresh_token': loginData.token?.refreshToken ?? ''
      };

      final Map<String, String>? requestHeader = header;
      response = await _client!
          .post(
            _getParsedUrl(ServiceUrl.refreshToken),
            body: HttpUtil.encodeRequestBody(
                json.encode(body), requestHeader![HttpConstants.contentType]!),
            headers: requestHeader,
          )
          .timeout(Duration(minutes: 2)).interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: body);
      updateCookie(response);

      updateCookie(response);

      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      if (dataResponse['code'] == 200) {
        isRefresh = true;
        String? newToken = dataResponse['data']['token']['access_token'];
        token = newToken;
        refreshToken = dataResponse['data']['token']['refresh_token'];
        await AppSharedPreference.setString(
            AppSharedPreference.token, newToken ?? '');
        await AppSharedPreference.setLoginResponse(dataResponse['data']);
        header![HttpHeaders.authorizationHeader] = 'Bearer $newToken';
        String? cookie =
            await AppSharedPreference.getString(AppSharedPreference.cookie);
        print('cookie : $cookie');
        if (cookie != null) {
          setCookieFromSession(cookie);
        }

        response = await putAccess(path, data, overrideHeader: overrideHeader);
        responseData = HttpUtil.getResponse(response ?? Response('', 0));
      } else if (dataResponse['code'] == 401 || dataResponse['code'] == 403) {
        responseData = UnAuthorizeException(
          json.decode(response.body),
        );
      }
    }

    return responseData;
  }

  dynamic patchAccess(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;
    late Response response;
    if (Configurations.isShowChucker == true) {
      response = await _client!
          .patch(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      )
          .interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: data);

      updateCookie(response);
    } else {
      response = await _client!.patch(
        _getParsedUrl(path),
        body: HttpUtil.encodeRequestBody(
            json.encode(data), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      );
      updateCookie(response);
    }

    return response;
  }

  dynamic patch(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${json.encode(data).toString()}');

    token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    String? cookie =
    await AppSharedPreference.getString(AppSharedPreference.cookie);
    if (cookie != null) {
      setCookieFromSession(cookie);
    }
    header![HttpHeaders.authorizationHeader] = 'Bearer $token';
    // TODO REMOVE THIS JUST FOR DEV PURPOSE
    // header![HttpHeaders.authorizationHeader] = AppConstants.token;

    // todo fix refresh token
    Response? response = await patchAccess(path, data, overrideHeader: overrideHeader);
    var responseData = HttpUtil.getResponse(response ?? Response('', 0));

    if (responseData['code'] == 404 || responseData['code'] == 403 || responseData['code'] == 401) {
      Map<String, String> body = {};
      LoginResponseData loginData = await AppSharedPreference.getLoginResponse();
      body = {
        'access_token': loginData.token?.accessToken ?? '',
        'refresh_token': loginData.token?.refreshToken ?? ''
      };

      final Map<String, String>? requestHeader = header;
      response = await _client!
          .post(
        _getParsedUrl(ServiceUrl.refreshToken),
        body: HttpUtil.encodeRequestBody(
            json.encode(body), requestHeader![HttpConstants.contentType]!),
        headers: requestHeader,
      )
          .timeout(Duration(minutes: 2)).interceptWithAlice(
          F.appFlavor == Flavor.PRODUCTION
              ? aliceProd
              : F.appFlavor == Flavor.STAGING
              ? aliceStaging
              : aliceDev,
          body: body);
      updateCookie(response);

      updateCookie(response);

      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      if (dataResponse['code'] == 200) {
        isRefresh = true;
        String? newToken = dataResponse['data']['token']['access_token'];
        token = newToken;
        refreshToken = dataResponse['data']['token']['refresh_token'];
        await AppSharedPreference.setString(
            AppSharedPreference.token, newToken ?? '');
        await AppSharedPreference.setLoginResponse(dataResponse['data']);
        header![HttpHeaders.authorizationHeader] = 'Bearer $newToken';


        String? cookie =
        await AppSharedPreference.getString(AppSharedPreference.cookie);
        print('cookie : $cookie');
        if (cookie != null) {
          setCookieFromSession(cookie);
        }

        response = await postAccess(path, data, overrideHeader: overrideHeader);
        responseData = HttpUtil.getResponse(response ?? Response('', 0));
      } else if (dataResponse['code'] == 401 || dataResponse['code'] == 403) {
        responseData = UnAuthorizeException(
          json.decode(response.body),
        );
      }
    }

    return responseData;
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
