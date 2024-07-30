import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/modules/audio/audio.dart';

class MinimizedPlayer extends StatelessWidget {
  const MinimizedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        if (state.currentAudio == null) return const SizedBox.shrink();
        return GestureDetector(
          onTap: () => context.read<AudioPlayerCubit>().toggleMinimized(),
          child: Container(
            height: 60,
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Surah ${state.currentAudio!.surahNumber},'
                        ' Ayah ${state.currentAudio!.ayahNumber}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(state.currentAudio!.translation),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () => state.isPlaying
                      ? context.read<AudioPlayerCubit>().pause()
                      : context.read<AudioPlayerCubit>().play(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
