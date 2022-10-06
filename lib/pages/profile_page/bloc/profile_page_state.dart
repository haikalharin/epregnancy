part of 'profile_page_bloc.dart';

class ProfilePageState with FormzMixin {
  final UserModel? user;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  ProfilePageState(
      {this.user,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.type});

  ProfilePageState copyWith(
      {FormzStatus? submitStatus,
      UserModel? user,
      String? errorMessage,
      String? type}) {
    return ProfilePageState(
        submitStatus: submitStatus,
        user: user ?? this.user,
        type: type,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class ProfilePageInitial extends ProfilePageState {}
