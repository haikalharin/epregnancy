part of 'profile_page_bloc.dart';

class ProfilePageState with FormzMixin {
  final UserModel? user;
  final BabyModelApi? baby;
  final int? ageBabyInWeeks;
  final int? ageBabyInDay;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  ProfilePageState(
      {this.user,
      this.baby,
      this.ageBabyInWeeks,
      this.ageBabyInDay,
      this.submitStatus = FormzStatus.pure,
      this.errorMessage,
      this.type});

  ProfilePageState copyWith(
      {FormzStatus? submitStatus,
      UserModel? user,
      BabyModelApi? baby,
      int? ageBabyInWeeks,
      int? ageBabyInDay,
      String? errorMessage,
      String? type}) {
    return ProfilePageState(
        submitStatus: submitStatus,
        user: user ?? this.user,
        baby: baby ?? this.baby,
        ageBabyInWeeks: ageBabyInWeeks ?? this.ageBabyInWeeks,
        ageBabyInDay: ageBabyInDay ?? this.ageBabyInDay,
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
