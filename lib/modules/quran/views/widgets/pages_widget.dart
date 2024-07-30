import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/gen/assets.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class PagesWidget extends StatelessWidget {
  const PagesWidget({
    required this.pageIndex,
    this.verseToHighlight,
    super.key,
  });

  final int pageIndex;
  final int? verseToHighlight;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final verses = cubit.getCurrentPageAyahsSeparatedForBasmalah(pageIndex);
        return Container(
          padding: pageIndex == 0 || pageIndex == 1
              ? EdgeInsets.symmetric(horizontal: width * .13)
              : EdgeInsets.zero,
          margin: pageIndex == 0 || pageIndex == 1
              ? EdgeInsets.symmetric(vertical: width * .34)
              : const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          child: SingleChildScrollView(
            child: RepaintBoundary(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(verses.length, (i) {
                  final ayahs = verses[i];
                  final firstAyah = ayahs.first;
                  final surahNo = cubit.getSurahNumberByAyah(firstAyah);
                  return Column(
                    children: [
                      context.surahBannerFirstPlace(pageIndex, i, cubit),
                      if (surahNo == 9 || surahNo == 1) ...{
                        const SizedBox.shrink(),
                      } else ...{
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: firstAyah.ayahNumber == 1
                              ? (surahNo == 95 || surahNo == 97)
                                  ? Assets.svg.besmAllah2.svg(height: 30)
                                  : Assets.svg.besmAllah.svg(height: 30)
                              : const SizedBox.shrink(),
                        ),
                      },
                      VersesView(
                        pageIndex: pageIndex,
                        ayahs: ayahs,
                        verseToHighlight: verseToHighlight,
                      ),
                      context.surahBannerLastPlace(pageIndex, i, cubit),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
