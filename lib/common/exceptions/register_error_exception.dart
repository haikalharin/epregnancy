import 'app_exception.dart';

class RegisterErrorException extends AppException {
  RegisterErrorException(String message)
      : super(
          error: 'RegisterErrorException',
          message: message,
        );
}
