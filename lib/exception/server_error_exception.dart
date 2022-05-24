




import 'package:PragnancyApps/exception/server_exception.dart';

import 'constant/exception_constants.dart';

class ServerErrorException extends BaseException {
  ServerErrorException(Map<String, dynamic> error)
      : super(
          message: error['message'],
          code: ExceptionConstants.internalServerError,
          errors: <ErrorList>[],
        );
}
