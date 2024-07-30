import 'package:holy_quran/modules/quran/quran.dart';

class Surah {
  Surah({
    required this.surahNumber,
    required this.arabicName,
    required this.englishName,
    required this.revelationType,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    final ayahsFromJson = json['ayahs'] as List<dynamic>;
    final castedAyahs = List<Map<String, dynamic>>.from(ayahsFromJson);
    final ayahsList = castedAyahs.map(Ayah.fromJson).toList();

    return Surah(
      surahNumber: json['number'] as int,
      arabicName: json['name'] as String,
      englishName: json['englishName'] as String,
      revelationType: json['revelationType'] as String,
      ayahs: ayahsList,
    );
  }

  final int surahNumber;
  final String arabicName;
  final String englishName;
  final String revelationType;
  final List<Ayah> ayahs;
}
