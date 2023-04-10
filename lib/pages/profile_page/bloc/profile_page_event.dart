part of 'profile_page_bloc.dart';


@immutable
abstract class ProfilePageEvent extends Equatable{
  const ProfilePageEvent();

  @override
  List<Object> get props => [];
}

class ChangePhotoProfileEvent extends ProfilePageEvent {
  const ChangePhotoProfileEvent(this.path);

  final String path;

  @override
  List<Object> get props => [];
}

class InitialProfileEvent extends ProfilePageEvent {
  const InitialProfileEvent();


  @override
  List<Object> get props => [];
}

class BiodataViewEvent extends ProfilePageEvent {
  const BiodataViewEvent(this.password);
  final String password;

  @override
  List<Object> get props => [];
}