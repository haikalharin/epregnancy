import 'app_exception.dart';

class NewBornErrorException extends AppException {

  NewBornErrorException(String message)
      : super(
          error: 'NewBornErrorException',
          message: message,
        );
}
