import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/modules/audio/audio.dart';

class MediaPlayerPage extends StatefulWidget {
  const MediaPlayerPage({required this.quranAudio, super.key});

  final QuranAudio quranAudio;

  @override
  State<MediaPlayerPage> createState() => _MediaPlayerPageState();
}

class _MediaPlayerPageState extends State<MediaPlayerPage> {
  @override
  void initState() {
    context.read<AudioPlayerCubit>().loadQuranAudio(widget.quranAudio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Player'),
      ),
      body: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, state) {
          return state.isMinimized
              ? const MinimizedPlayer()
              : const FullPlayer();
        },
      ),
    );
  }
}
