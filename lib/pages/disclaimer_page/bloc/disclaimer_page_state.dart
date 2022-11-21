part of 'disclaimer_page_bloc.dart';

class DisclaimerPageState with FormzMixin {
  final UserModel? userModel;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;
  final bool? isSearch;

  DisclaimerPageState({
this.userModel,
    this.type,
    this.isSearch = false,
    this.submitStatus = FormzStatus.pure,
    this.errorMessage});

  DisclaimerPageState copyWith({FormzStatus? submitStatus,
UserModel? userModel,
    bool? isSearch,
    String? type,
    String? errorMessage}) {
    return DisclaimerPageState(
      userModel: userModel ?? this.userModel,
        submitStatus: submitStatus,
        isSearch: isSearch ?? this.isSearch,
        type: type,
        errorMessage: errorMessage);
  }

  @override
  List<Object> get props => [];

  @override
  List<FormzInput> get inputs => [];
}

class DisclaimerPageInitial extends DisclaimerPageState
{
}