part of 'landing_page_bloc.dart';


@immutable
abstract class LandingPageEvent extends Equatable{
  const LandingPageEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends LandingPageEvent {
  const LoginRequest();
}

