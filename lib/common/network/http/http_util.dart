import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import '../../../utils/remote_utils.dart';
import '../../exceptions/server_auth_error_exception.dart';
import '../../exceptions/server_error_exception.dart';
import '../http_constants.dart';


class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }

  static dynamic getResponse(Response response) {
    debugPrint('>>>>>>> ${response.body}');
    switch (response.statusCode) {
      case 200:
        return _getSuccessResponse(response);
      case 400:
        return _getSuccessResponse(response);
      case 403:
        return _getSuccessResponse(response);
      case 404:
        return _getSuccessResponse(response);
      case 402:
        return _getSuccessResponse(response);
      case 405:
        return _getSuccessResponse(response);
      case 500:
        return _getSuccessResponse(response);
      default:
        throw ServerErrorException(
          getErrorResult(json.decode(response.body)),
        );
    }
  }

  static dynamic _getSuccessResponse(Response response) {
    final _responseJson = json.decode(response.body);

    debugPrint('>>>>>>> [RESPONSE] $_responseJson');

    return _responseJson;
  }
}
