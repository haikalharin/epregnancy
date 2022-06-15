part of 'home_page_bloc.dart';



class HomePageState {
  final UserModelFirebase? user;
  final FormzStatus status;
  final String? errorMessage;

  HomePageState(
      {this.user,
        this.status = FormzStatus.pure,
        this.errorMessage});

  HomePageState copyWith(
      {FormzStatus? status,
       UserModelFirebase? user,
        String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
      user: user ?? this.user,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [status];
}

class HomePageInitial extends HomePageState {}