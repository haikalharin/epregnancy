part of 'audio_bloc.dart';

@immutable
abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

class AudioEventChangePlaylist extends AudioEvent {
  const AudioEventChangePlaylist(this.playlist);
  final String playlist;

  @override
  List<Object> get props => [];
}