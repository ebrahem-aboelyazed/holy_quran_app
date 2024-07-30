import 'package:flutter/material.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class AyatListView extends StatelessWidget {
  const AyatListView({
    required this.ayat,
    super.key,
  });

  final Map<String, dynamic> ayat;

  @override
  Widget build(BuildContext context) {
    final result =
        List<Map<String, dynamic>>.from(ayat['result'] as List<dynamic>);
    final ayatLength = ayat['occurrences'] as int? ?? 0;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ayatLength,
      itemBuilder: (context, index) {
        final data = result[index];
        final surahNumber = data['surah'] as int;
        final verseNumber = data['verse'] as int;
        final name = getSurahNameArabic(surahNumber);
        final verse = getVerse(surahNumber, verseNumber, verseEndSymbol: true);
        return Card(
          child: ListTile(
            onTap: () {
              final pageNumber = getPageNumber(surahNumber, verseNumber);
              context.goTo(
                QuranPage(
                  pageNumber: pageNumber,
                  verseToHighlight: verseNumber,
                ),
              );
            },
            title: Text(
              'سورة $name',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              verse,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        );
      },
    );
  }
}
