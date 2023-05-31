part of 'audio_bloc.dart';

class AudioState with FormzMixin  {
  final String? currentPlaylist;

  AudioState({
    this.currentPlaylist
  });

  AudioState copyWith({String? currentPlaylist}) {
    return AudioState(currentPlaylist: currentPlaylist ?? this.currentPlaylist,);
  }

  @override
  List<Object> get props => [];

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();
}

class AudioStateInitial extends AudioState {}
