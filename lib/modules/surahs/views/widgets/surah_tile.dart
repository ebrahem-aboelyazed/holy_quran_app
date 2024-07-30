import 'package:flutter/material.dart';
import 'package:holy_quran/gen/fonts.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';
import 'package:holy_quran/utils/utils.dart';

class SurahTile extends StatelessWidget {
  const SurahTile({
    required this.e,
    super.key,
  });

  final SurahData e;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        onTap: () {
          final pageNumber = getPageNumber(e.number, 1);
          context.goTo(QuranPage(pageNumber: pageNumber));
        },
        leading: SizedBox(
          width: 45,
          height: 45,
          child: Center(
            child: Text(
              e.number.toString(),
              style: const TextStyle(
                color: AppConstants.orangeColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        // trailing: IconButton(
        //   onPressed: () {
        //     final audioUrl = getAudioURLBySurah(e.number);
        //     final quranAudio = QuranAudio(
        //       surahNumber: e.number,
        //       ayahNumber: 1,
        //       audioUrl: audioUrl,
        //       arabicText: e.name,
        //       translation: e.englishName,
        //       reciter: '',
        //     );
        //     context.goTo(MediaPlayerPage(quranAudio: quranAudio));
        //   },
        //   icon: const Icon(Icons.audio_file),
        // ),
        minVerticalPadding: 0,
        title: SizedBox(
          width: 90,
          child: Text(
            e.name,
            style: const TextStyle(
              color: AppConstants.blueColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.naskh,
            ),
          ),
        ),
        subtitle: Text(
          ' عدد الايات : ${e.numberOfAyahs} ',
          style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(.8)),
        ),
      ),
    );
  }
}
