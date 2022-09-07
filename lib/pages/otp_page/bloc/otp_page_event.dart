part of 'otp_page_bloc.dart';



@immutable
abstract class OtpPageEvent extends Equatable{
  const OtpPageEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestOtp extends OtpPageEvent {
  const LoginRequestOtp();
}

class OtpNumberChanged extends OtpPageEvent {
  const OtpNumberChanged(this.otp);

  final String otp;

  @override
  List<Object> get props => [];
}
