import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holy_quran/modules/audio/audio.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit({required this.audioHandler})
      : super(const AudioPlayerState()) {
    _init();
  }

  final QuranAudioHandler audioHandler;

  void _init() {
    audioHandler.playbackState.listen((playbackState) {
      emit(
        state.copyWith(
          isPlaying: playbackState.playing,
          position: playbackState.position,
        ),
      );
    });

    audioHandler.mediaItem.listen((mediaItem) {
      if (mediaItem != null) {
        final arabicText = mediaItem.extras?['arabicText'] as String? ?? '';
        final translation = mediaItem.extras?['translation'] as String? ?? '';
        final surah = int.parse(mediaItem.title.split(',')[0].split(' ')[1]);
        final ayah = int.parse(mediaItem.title.split(',')[1].split(' ')[2]);
        emit(
          state.copyWith(
            mediaItem: mediaItem,
            duration: mediaItem.duration ?? Duration.zero,
            currentAudio: QuranAudio(
              surahNumber: surah,
              ayahNumber: ayah,
              audioUrl: mediaItem.id,
              arabicText: arabicText,
              translation: translation,
              reciter: '',
            ),
          ),
        );
      }
    });
  }

  void toggleMinimized() {
    emit(state.copyWith(isMinimized: !state.isMinimized));
  }

  Future<void> loadQuranAudio(QuranAudio quranAudio) async {
    await audioHandler.loadQuranAudio(quranAudio);
  }

  Future<void> play() => audioHandler.play();

  Future<void> pause() => audioHandler.pause();

  Future<void> seek(Duration position) => audioHandler.seek(position);

  Future<void> stop() => audioHandler.stop();

  Future<void> skipToNext() => audioHandler.skipToNext();

  Future<void> skipToPrevious() => audioHandler.skipToPrevious();
}
