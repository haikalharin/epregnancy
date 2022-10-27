
import 'package:PregnancyApp/common/exceptions/server_exception.dart';

import '../constants/exception_constants.dart';


class ServerErrorException extends BaseException {
  ServerErrorException(Map<String, dynamic> error)
      : super(
          message: error['message'],
          code: error['code'],
          errors: <ErrorList>[],
        );
}

class UnAuthorizeException extends BaseException {
  UnAuthorizeException(Map<String, dynamic> error)
      : super(
    message: error['message'],
    code: error['code'],
    errors: <ErrorList>[],
  );
}
