import 'app_exception.dart';

class ProfileCustomerErrorException extends AppException {

  ProfileCustomerErrorException(String message)
      : super(
          error: 'ProfileCustomerErrorException',
          message: message,
        );
}
