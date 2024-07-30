import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:holy_quran/modules/audio/audio.dart';

class QuranAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  QuranAudioHandler() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    _player.durationStream.listen((duration) {
      mediaItem.add(mediaItem.value?.copyWith(duration: duration));
    });
  }

  final _player = AudioPlayer();
  final List<QuranAudio> _playlist = [];
  int _currentIndex = -1;

  Future<void> loadQuranAudio(QuranAudio quranAudio) async {
    _playlist
      ..clear()
      ..add(quranAudio);
    _currentIndex = 0;
    await _loadCurrentAudio();
  }

  Future<void> _loadCurrentAudio() async {
    if (_currentIndex < 0 || _currentIndex >= _playlist.length) return;

    final currentAudio = _playlist[_currentIndex];
    final item = MediaItem(
      id: currentAudio.audioUrl,
      title: 'Surah ${currentAudio.surahNumber}, '
          'Ayah ${currentAudio.ayahNumber}',
      artist: 'Quran Recitation',
      album: 'The Holy Quran',
      extras: {
        'arabicText': currentAudio.arabicText,
        'translation': currentAudio.translation,
      },
    );

    mediaItem.add(item);
    await _player.setAudioSource(
      AudioSource.uri(Uri.parse(currentAudio.audioUrl)),
    );
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }

  @override
  Future<void> skipToNext() async {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      await _loadCurrentAudio();
      await play();
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (_currentIndex > 0) {
      _currentIndex--;
      await _loadCurrentAudio();
      await play();
    }
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
