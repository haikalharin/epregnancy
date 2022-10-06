import 'app_exception.dart';

class ArticleErrorException extends AppException {

  ArticleErrorException(String message)
      : super(
          error: 'ArticleErrorException',
          message: message,
        );
}
