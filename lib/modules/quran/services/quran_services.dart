import 'package:holy_quran/core/core.dart';
import 'package:holy_quran/modules/quran/quran.dart';

List<Ayah> getAyahsByPage(int page) {
  if (page < 1 || page > 604) {
    return [];
  }
  final surahs = quranData.map(Surah.fromJson);
  final allAyahs = <Ayah>[];
  for (final surah in surahs) {
    final ayahs = surah.ayahs.where((e) => e.page == page);
    allAyahs.addAll(ayahs);
  }
  return allAyahs;
}

///Takes [surahNumber], [verseNumber] and returns the page number of the Quran
int getPageNumber(int surahNumber, int verseNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw Exception('No Surah found with given surahNumber');
  }

  for (var pageIndex = 0; pageIndex < pageData.length; pageIndex++) {
    for (var surahIndexInPage = 0;
        surahIndexInPage < pageData[pageIndex].length;
        surahIndexInPage++) {
      final e = pageData[pageIndex][surahIndexInPage];
      final surah = e['surah'] ?? 0;
      final start = e['start'] ?? 0;
      final end = e['end'] ?? 0;
      if (surah == surahNumber && start <= verseNumber && end >= verseNumber) {
        return pageIndex + 1;
      }
    }
  }

  throw Exception('Invalid verse number.');
}

String convertNumbers(String inputStr) {
  var str = inputStr;
  final numberSets = <String, Map<String, String>>{
    'العربية': {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    },
    'English': {
      '0': '0',
      '1': '1',
      '2': '2',
      '3': '3',
      '4': '4',
      '5': '5',
      '6': '6',
      '7': '7',
      '8': '8',
      '9': '9',
    },
    'বাংলা': {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    },
    'اردو': {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    },
  };

  final numSet = numberSets['العربية'];

  if (numSet == null) {
    return str;
  }

  for (final entry in numSet.entries) {
    str = str.replaceAll(entry.key, entry.value);
  }

  return str;
}
