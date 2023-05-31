part of 'growth_bloc.dart';

class GrowthState {
  final FormzStatus? status;
  final String? type;
  final String? errorMessage;
  final List<GrowthModel>? growths;

  GrowthState(
      {this.growths, this.type, this.status, this.errorMessage});

  GrowthState copyWith(
      {FormzStatus? status,
        String? type,
        String? errorMessage,
        List<GrowthModel>? growths}) {
    return GrowthState(
        type: type ?? this.type,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        growths: growths ?? this.growths);
  }
}

class GrowthBlocInitialState extends GrowthState {}
