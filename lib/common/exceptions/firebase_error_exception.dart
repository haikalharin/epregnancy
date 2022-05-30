import 'app_exception.dart';

class FirebaseErrorException extends AppException {

  FirebaseErrorException(String message)
      : super(
          error: 'FirebaseErrorException',
          message: message,
        );
}
