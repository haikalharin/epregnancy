import 'app_exception.dart';

class ProfileErrorException extends AppException {

  ProfileErrorException(String message)
      : super(
          error: 'ProfileErrorException',
          message: message,
        );
}
