import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/user_example_model/user_example_model.dart';
import '../../configurations/configurations.dart';
import '../../remote/url/service_url.dart';
import '../http_constants.dart';
import 'http_util.dart';

class HttpClient {
  Client? _client;
  String? host = Configurations.host;
  Map<String, String>? header;

   HttpClient() {
    _client = Client();
    header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Uri _getParsedUrl(String path, {Map<String, String>? queryParameters}) {
    String h = host!;
    if (h.contains("//")) {
      h = h.split("//")[1];
    }

    if (h.contains("/")) {
      h = h.replaceAll("/", "");
    }

    // return Uri.http(h, path, queryParameters);
    return Uri.http(h, ServiceUrl.prefix + "/" + path, queryParameters);
  }

  dynamic get(String path, {Map<String, String>? queryParameters}) async {
    debugPrint('>>>>>>> [GET] ${_getParsedUrl(path)}');

    String? token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    final response = await _client
        !.get(
      _getParsedUrl(path, queryParameters: queryParameters),
      headers: header,
    )
        .timeout(Duration(minutes: 2));

    return HttpUtil.getResponse(response);
  }

  Future<Response?> downloadFile(String path) async {
    final response = await _client!.get(
      _getParsedUrl(path),
      headers: header,
    );
    return response.statusCode == 201 ? response : null;
  }

  dynamic post(String path, dynamic data,
      {Map<String, String>? overrideHeader}) async {
    final Map<String, String>? requestHeader = overrideHeader ?? header;

    debugPrint('>>>>>>> [POST] ${_getParsedUrl(path)}');
    debugPrint('>>>>>>> [HEADER] ${header.toString()}');
    debugPrint('>>>>>>> [DATA] ${data.toString()}');

    String? token = await getToken();

    header![HttpHeaders.authorizationHeader] = 'Bearer $token';

    final response = await _client!.post(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          json.encode(data), requestHeader![HttpConstants.contentType]!),
      headers: requestHeader,
    );

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

    final response = await _client!.put(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          json.encode(data), requestHeader![HttpConstants.contentType]!),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(response);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString == null) return null;
    Map <String, dynamic> userMap = jsonDecode(userString);
    return UserExampleModel.fromJson(userMap).token;
  }
}
