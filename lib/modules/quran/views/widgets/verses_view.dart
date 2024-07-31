import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class VersesView extends StatefulWidget {
  const VersesView({
    required this.pageIndex,
    required this.ayahs,
    this.verseToHighlight,
    super.key,
  });

  final int pageIndex;
  final List<Ayah> ayahs;
  final int? verseToHighlight;

  @override
  State<VersesView> createState() => _VersesViewState();
}

class _VersesViewState extends State<VersesView> {
  int selectedAyah = 0;

  @override
  void initState() {
    super.initState();
    highlightVerse();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          return RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'page${widget.pageIndex + 1}',
                fontSize: 100,
                height: 1.7,
                letterSpacing: 2,
                color: Theme.of(context).colorScheme.inversePrimary,
                shadows: const [
                  Shadow(
                    blurRadius: 0.5,
                    color: Colors.transparent,
                    offset: Offset(0.5, 0.5),
                  ),
                ],
              ),
              children: List.generate(widget.ayahs.length, (ayahIndex) {
                final verse = widget.ayahs[ayahIndex].codeV2;
                final surahNo = cubit.getSurahNumberFromPage(widget.pageIndex);
                final currentAyah = widget.ayahs[ayahIndex];
                if (ayahIndex == 0) {
                  return verseSpan(
                    isFirstAyah: true,
                    text: '${verse[0]}${verse.substring(1)}',
                    pageIndex: widget.pageIndex,
                    isSelected: selectedAyah == currentAyah.ayahNumber,
                    fontSize: 100,
                    surahNum: surahNo,
                    ayahNum: currentAyah.ayahNumber,
                    recognizer: getRecognizer(currentAyah.ayahNumber),
                  );
                }
                return verseSpan(
                  isFirstAyah: false,
                  text: verse,
                  pageIndex: widget.pageIndex,
                  isSelected: selectedAyah == currentAyah.ayahNumber,
                  fontSize: 100,
                  surahNum: surahNo,
                  ayahNum: currentAyah.ayahNumber,
                  recognizer: getRecognizer(currentAyah.ayahNumber),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  LongPressGestureRecognizer getRecognizer(int ayahUQNumber) {
    return LongPressGestureRecognizer(
      duration: const Duration(milliseconds: 500),
    )
      ..onLongPressDown = (details) {
        setState(() => selectedAyah = ayahUQNumber);
      }
      ..onLongPressUp = () {
        setState(() => selectedAyah = 0);
      }
      ..onLongPressCancel = () {
        setState(() => selectedAyah = 0);
      };
  }

  void highlightVerse() {
    final highlightedVerse = widget.verseToHighlight;
    if (highlightedVerse != null && highlightedVerse != 0) {
      setState(() => selectedAyah = highlightedVerse);
      Timer.periodic(const Duration(milliseconds: 400), (timer) {
        if (timer.tick == 6) {
          if (mounted) {
            setState(() => selectedAyah = 0);
          }
          timer.cancel();
        }
      });
    }
  }
}
