import 'app_exception.dart';

class HomeErrorException extends AppException {

  HomeErrorException(String message)
      : super(
          error: 'HomeErrorException',
          message: message,
        );
}
