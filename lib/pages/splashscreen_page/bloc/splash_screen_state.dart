part of 'splash_screen_bloc.dart';

class SplashscreenState {
  final String? role;
  final bool isExist;
  final FormzStatus submitStatus;
  final String? errorMessage;
  final UserModel? userModel;

  SplashscreenState(
      {
      this.role,
        this.isExist = false,
        this.submitStatus = FormzStatus.pure,
        this.userModel,
        this.errorMessage});

  SplashscreenState copyWith(
      {FormzStatus? submitStatus,
        bool? isExist,
        String? role,
        UserModel? userModel,
        String? errorMessage}) {
    return SplashscreenState(
        submitStatus: submitStatus ?? this.submitStatus,
        isExist: isExist ?? this.isExist,
        role: role ?? this.role,
        userModel: userModel ?? this.userModel,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [submitStatus];
}

class  SplashScreenInitial extends SplashscreenState {}