import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/modules/audio/audio.dart';

class FullPlayer extends StatelessWidget {
  const FullPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        if (state.currentAudio == null) {
          return const Center(child: Text('No audio loaded'));
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Surah ${state.currentAudio!.surahNumber}, '
              'Ayah ${state.currentAudio!.ayahNumber}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              state.currentAudio!.arabicText,
              style: const TextStyle(fontSize: 30, fontFamily: 'Arabic'),
            ),
            const SizedBox(height: 20),
            Text(
              state.currentAudio!.translation,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Slider(
              value: state.position.inMilliseconds.toDouble(),
              max: state.duration.inMilliseconds.toDouble(),
              onChanged: (value) {
                context
                    .read<AudioPlayerCubit>()
                    .seek(Duration(milliseconds: value.round()));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.position.toString().split('.').first),
                  Text(state.duration.toString().split('.').first),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () =>
                      context.read<AudioPlayerCubit>().skipToPrevious(),
                ),
                IconButton(
                  icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 64,
                  onPressed: () => state.isPlaying
                      ? context.read<AudioPlayerCubit>().pause()
                      : context.read<AudioPlayerCubit>().play(),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () =>
                      context.read<AudioPlayerCubit>().skipToNext(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  context.read<AudioPlayerCubit>().toggleMinimized(),
              child: const Text('Minimize'),
            ),
          ],
        );
      },
    );
  }
}
