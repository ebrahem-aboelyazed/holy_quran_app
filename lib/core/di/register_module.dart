import 'package:audio_service/audio_service.dart';
import 'package:injectable/injectable.dart';
import 'package:holy_quran/modules/audio/audio.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<QuranAudioHandler> get audioHandler {
    return AudioService.init(
      builder: QuranAudioHandler.new,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.quran.app.channel.audio',
        androidNotificationChannelName: 'Quran Audio playback',
        androidNotificationOngoing: true,
      ),
    );
  }
}
