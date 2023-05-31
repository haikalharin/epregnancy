
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';


part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState>{
  AudioBloc() : super(AudioStateInitial());


  @override
  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    if (event is AudioEventChangePlaylist) {
      yield _mapAudioChangePlaylistEvent(event, state);
    }
  }

  AudioState _mapAudioChangePlaylistEvent(
      AudioEventChangePlaylist event,
      AudioState state,
      ) {
    return state.copyWith(
      currentPlaylist: event.playlist,
    );
  }

}