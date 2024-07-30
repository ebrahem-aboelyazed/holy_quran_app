part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  const AudioPlayerState({
    this.mediaItem,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isPlaying = false,
    this.isMinimized = false,
    this.currentAudio,
  });

  final MediaItem? mediaItem;
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final bool isMinimized;
  final QuranAudio? currentAudio;

  AudioPlayerState copyWith({
    MediaItem? mediaItem,
    Duration? position,
    Duration? duration,
    bool? isPlaying,
    bool? isMinimized,
    QuranAudio? currentAudio,
  }) {
    return AudioPlayerState(
      mediaItem: mediaItem ?? this.mediaItem,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
      isMinimized: isMinimized ?? this.isMinimized,
      currentAudio: currentAudio ?? this.currentAudio,
    );
  }

  @override
  List<Object?> get props {
    return [
      mediaItem,
      position,
      duration,
      isPlaying,
      isMinimized,
      currentAudio,
    ];
  }
}
