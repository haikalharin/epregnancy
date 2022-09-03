import 'app_exception.dart';

class OtpErrorException extends AppException {

  OtpErrorException(String message)
      : super(
          error: 'OtpErrorException',
          message: message,
        );
}
