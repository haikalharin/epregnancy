import '../../exception/constant/exception_constants.dart';
import '../../exception/server_exception.dart';

class ServerErrorException extends BaseException {
  ServerErrorException(Map<String, dynamic> error)
      : super(
          message: error['message'],
          code: ExceptionConstants.internalServerError,
          errors: <ErrorList>[],
        );
}
