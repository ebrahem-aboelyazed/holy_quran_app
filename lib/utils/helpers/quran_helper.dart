// ignore_for_file: use_string_buffers
import 'package:holy_quran/core/core.dart';

List<Map<String, dynamic>> getPageData(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    return [];
  }
  return pageData[pageNumber - 1];
}

String getSurahNameByPage(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    return '';
  }
  final data = quranText.firstWhere(
    (e) => e['page'] == pageNumber,
  );
  return data['sura_name_ar'] as String;
}

Map<String, dynamic> searchWords(String words) {
  final result = <Map<String, dynamic>>[];
  for (final i in quranText) {
    if (i['aya_text_emlaey']
        .toString()
        .toLowerCase()
        .contains(words.toLowerCase())) {
      result.add({'surah': i['sura_no'], 'verse': i['aya_no']});
    }
  }

  return {'occurrences': result.length, 'result': result};
}

///Takes [surahNumber] returns the Surah name in Arabic
String getSurahNameArabic(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    return '';
  }
  return surahData[surahNumber - 1]['arabic'].toString();
}

///Takes [surahNumber], [verseNumber] & [verseEndSymbol] (optional)
/// and returns the Verse in Arabic
String getVerse(
  int surahNumber,
  int verseNumber, {
  bool verseEndSymbol = false,
}) {
  var verse = '';
  for (final i in quranText) {
    if (i['sura_no'] == surahNumber && i['aya_no'] == verseNumber) {
      verse = i['aya_text_emlaey'].toString();
      break;
    }
  }

  if (verse == '') {
    throw Exception(
      'No verse found with given surahNumber and verseNumber.\n\n',
    );
  }

  return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : '');
}

///Takes [verseNumber], [arabicNumeral] (optional)
/// and returns '۝' symbol with verse number
String getVerseEndSymbol(int verseNumber, {bool arabicNumeral = true}) {
  var arabicNumeric = '';
  final digits = verseNumber.toString().split('').toList();

  if (!arabicNumeral) return '\u06dd$verseNumber';

  const arabicNumbers = <String, dynamic>{
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
  };

  for (final e in digits) {
    arabicNumeric += arabicNumbers[e] as String;
  }

  return '\u06dd$arabicNumeric';
}

String normalise(String input) {
  return input
      .replaceAll('\u0610', '') //ARABIC SIGN SALLALLAHOU ALAYHE WA SALLAM
      .replaceAll('\u0611', '') //ARABIC SIGN ALAYHE ASSALLAM
      .replaceAll('\u0612', '') //ARABIC SIGN RAHMATULLAH ALAYHE
      .replaceAll('\u0613', '') //ARABIC SIGN RADI ALLAHOU ANHU
      .replaceAll('\u0614', '') //ARABIC SIGN TAKHALLUS

      //Remove koranic anotation
      .replaceAll('\u0615', '') //ARABIC SMALL HIGH TAH
      .replaceAll(
        '\u0616',
        '',
      ) //ARABIC SMALL HIGH LIGATURE ALEF WITH LAM WITH YEH
      .replaceAll('\u0617', '') //ARABIC SMALL HIGH ZAIN
      .replaceAll('\u0618', '') //ARABIC SMALL FATHA
      .replaceAll('\u0619', '') //ARABIC SMALL DAMMA
      .replaceAll('\u061A', '') //ARABIC SMALL KASRA
      .replaceAll(
        '\u06D6',
        '',
      ) //ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
      .replaceAll(
        '\u06D7',
        '',
      ) //ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
      .replaceAll('\u06D8', '') //ARABIC SMALL HIGH MEEM INITIAL FORM
      .replaceAll('\u06D9', '') //ARABIC SMALL HIGH LAM ALEF
      .replaceAll('\u06DA', '') //ARABIC SMALL HIGH JEEM
      .replaceAll('\u06DB', '') //ARABIC SMALL HIGH THREE DOTS
      .replaceAll('\u06DC', '') //ARABIC SMALL HIGH SEEN
      .replaceAll('\u06DD', '') //ARABIC END OF aya
      .replaceAll('\u06DE', '') //ARABIC START OF RUB EL HIZB
      .replaceAll('\u06DF', '') //ARABIC SMALL HIGH ROUNDED ZERO
      .replaceAll('\u06E0', '') //ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
      .replaceAll('\u06E1', '') //ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
      .replaceAll('\u06E2', '') //ARABIC SMALL HIGH MEEM ISOLATED FORM
      .replaceAll('\u06E3', '') //ARABIC SMALL LOW SEEN
      .replaceAll('\u06E4', '') //ARABIC SMALL HIGH MADDA
      .replaceAll('\u06E5', '') //ARABIC SMALL WAW
      .replaceAll('\u06E6', '') //ARABIC SMALL YEH
      .replaceAll('\u06E7', '') //ARABIC SMALL HIGH YEH
      .replaceAll('\u06E8', '') //ARABIC SMALL HIGH NOON
      .replaceAll('\u06E9', '') //ARABIC PLACE OF SAJDAH
      .replaceAll('\u06EA', '') //ARABIC EMPTY CENTRE LOW STOP
      .replaceAll('\u06EB', '') //ARABIC EMPTY CENTRE HIGH STOP
      .replaceAll('\u06EC', '') //ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
      .replaceAll('\u06ED', '') //ARABIC SMALL LOW MEEM
      .replaceAll('\u0640', '') //Remove tatweel
      //Remove tashkeel
      .replaceAll('\u064B', '') //ARABIC FATHATAN
      .replaceAll('\u064C', '') //ARABIC DAMMATAN
      .replaceAll('\u064D', '') //ARABIC KASRATAN
      .replaceAll('\u064E', '') //ARABIC FATHA
      .replaceAll('\u064F', '') //ARABIC DAMMA
      .replaceAll('\u0650', '') //ARABIC KASRA
      .replaceAll('\u0651', '') //ARABIC SHADDA
      .replaceAll('\u0652', '') //ARABIC SUKUN
      .replaceAll('\u0653', '') //ARABIC MADDAH ABOVE
      .replaceAll('\u0654', '') //ARABIC HAMZA ABOVE
      .replaceAll('\u0655', '') //ARABIC HAMZA BELOW
      .replaceAll('\u0656', '') //ARABIC SUBSCRIPT ALEF
      .replaceAll('\u0657', '') //ARABIC INVERTED DAMMA
      .replaceAll('\u0658', '') //ARABIC MARK NOON GHUNNA
      .replaceAll('\u0659', '') //ARABIC ZWARAKAY
      .replaceAll('\u065A', '') //ARABIC VOWEL SIGN SMALL V ABOVE
      .replaceAll('\u065B', '') //ARABIC VOWEL SIGN INVERTED SMALL V ABOVE
      .replaceAll('\u065C', '') //ARABIC VOWEL SIGN DOT BELOW
      .replaceAll('\u065D', '') //ARABIC REVERSED DAMMA
      .replaceAll('\u065E', '') //ARABIC FATHA WITH TWO DOTS
      .replaceAll('\u065F', '') //ARABIC WAVY HAMZA BELOW
      .replaceAll('\u0670', '') //ARABIC LETTER SUPERSCRIPT ALEF
      //Replace Waw Hamza Above by Waw
      .replaceAll('\u0624', '\u0648')
      //Replace Ta Marbuta by Ha
      .replaceAll('\u0629', '\u0647')
      //Replace Ya
      // and Ya Hamza Above by Alif Maksura
      .replaceAll('\u064A', '\u0649')
      .replaceAll('\u0626', '\u0649')
      // Replace Alifs with Hamza Above/Below
      // and with Madda Above by Alif
      .replaceAll('\u0622', '\u0627')
      .replaceAll('\u0623', '\u0627')
      .replaceAll('\u0625', '\u0627');
}

String removeDiacritics(String input) {
  final diacriticsMap = <String, String>{
    'َ': '', // Fatha
    'ُ': '', // Damma
    'ِ': '', // Kasra
    'ّ': '', // Shadda
    'ً': '', // Tanwin Fatha
    'ٌ': '', // Tanwin Damma
    'ٍ': '', // Tanwin Kasra
  };

  // Create a regular expression pattern that matches Arabic diacritics
  final diacriticsPattern = diacriticsMap.keys.map(RegExp.escape).join('|');
  final exp = RegExp('[$diacriticsPattern]');

  // Remove diacritics using the regular expression
  final textWithoutDiacritics = input.replaceAll(exp, '');

  return textWithoutDiacritics;
}
