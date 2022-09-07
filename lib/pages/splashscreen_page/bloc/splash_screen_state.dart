part of 'splash_screen_bloc.dart';

class SplashscreenState {
  final String? role;
  final bool isExist;
  final FormzStatus submitStatus;
  final String? errorMessage;

  SplashscreenState(
      {
      this.role,
        this.isExist = false,
        this.submitStatus = FormzStatus.pure,
        this.errorMessage});

  SplashscreenState copyWith(
      {FormzStatus? submitStatus,
        bool? isExist,
        String? role,
        String? errorMessage}) {
    return SplashscreenState(
        submitStatus: submitStatus ?? this.submitStatus,
        isExist: isExist ?? this.isExist,
        role: role ?? this.role,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [submitStatus];
}

class  SplashScreenInitial extends SplashscreenState {}