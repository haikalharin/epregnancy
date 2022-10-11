part of 'pin_checkin_bloc.dart';



@immutable
abstract class PinCheckInEvent extends Equatable{
  const PinCheckInEvent();

  @override
  List<Object> get props => [];
}

class PinSubmitted extends PinCheckInEvent {
  const PinSubmitted(this.pin);
  final String? pin;

  @override
  List<Object> get props => [];
}
