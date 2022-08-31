import 'app_exception.dart';

class HomeErrorException extends AppException {

  HomeErrorException(String message)
      : super(
          error: 'HomeErrorException',
          message: message,
        );
}

class PointErrorException extends AppException {

  PointErrorException(String message)
      : super(
    error: 'PointErrorException',
    message: message,
  );
}
