part of 'child_list_bloc.dart';

class ChildListBlocState with FormzMixin {
  final List<ChildListResponse>? childs;
  final FormzStatus? submitStatus;
  final String? errorMessage;
  final String? type;

  ChildListBlocState(
      {this.childs,
        this.submitStatus = FormzStatus.pure,
        this.type,
        this.errorMessage
      });

  ChildListBlocState copyWith(
      {FormzStatus? submitStatus,
        List<ChildListResponse>? childs,
        String? type,
        String? errorMessage,
      }) {
    return ChildListBlocState(
      submitStatus: submitStatus,
      childs: childs ?? this.childs,
      type: type,
      errorMessage: errorMessage,
    );
  }


  @override
  // TODO: implement inputs
  List<FormzInput> get inputs =>[];
}

class ChildListStateInitial extends ChildListBlocState {}