import 'app_exception.dart';

class EventErrorException extends AppException {

  EventErrorException(String message)
      : super(
          error: 'LoginErrorException',
          message: message,
        );
}
