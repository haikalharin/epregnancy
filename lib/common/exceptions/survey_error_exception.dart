import 'app_exception.dart';

class SurveyErrorException extends AppException {

  SurveyErrorException(String message)
      : super(
          error: 'SurveyErrorException',
          message: message,
        );
}
