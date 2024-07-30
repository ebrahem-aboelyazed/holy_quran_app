class Ayah {
  Ayah({
    required this.ayahUQNumber,
    required this.ayahNumber,
    required this.text,
    required this.ayaTextEmlaey,
    required this.codeV2,
    required this.juz,
    required this.page,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      ayahUQNumber: json['number'] as int,
      ayahNumber: json['numberInSurah'] as int,
      text: json['text'] as String,
      ayaTextEmlaey: json['aya_text_emlaey'] as String,
      codeV2: json['code_v2'] as String,
      juz: json['juz'] as int,
      page: json['page'] as int,
      hizbQuarter: json['hizbQuarter'] as int,
      sajda: json['sajda'],
    );
  }

  final int ayahUQNumber;
  final int ayahNumber;
  final String text;
  final String ayaTextEmlaey;
  final String codeV2;
  final int juz;
  final int page;
  final int hizbQuarter;
  dynamic sajda;
}

// class Ayah {
//   Ayah({
//     required this.id,
//     required this.jozz,
//     required this.suraNo,
//     required this.suraNameEn,
//     required this.suraNameAr,
//     required this.page,
//     required this.lineStart,
//     required this.lineEnd,
//     required this.ayaNo,
//     required this.ayaText,
//     required this.ayaTextEmlaey,
//   });
//
//   factory Ayah.fromJson(Map<String, dynamic> json) {
//     return Ayah(
//       id: json['id'] as int,
//       jozz: json['jozz'] as int,
//       suraNo: json['sura_no'] as int,
//       suraNameEn: json['sura_name_en'] as String,
//       suraNameAr: json['sura_name_ar'] as String,
//       page: json['page'] as int,
//       lineStart: json['line_start'] as int,
//       lineEnd: json['line_end'] as int,
//       ayaNo: json['aya_no'] as int,
//       ayaText: json['aya_text'] as String,
//       ayaTextEmlaey: json['aya_text_emlaey'] as String,
//     );
//   }
//
//   final int id;
//   final int jozz;
//   final int suraNo;
//   final String suraNameEn;
//   final String suraNameAr;
//   final int page;
//   final int lineStart;
//   final int lineEnd;
//   final int ayaNo;
//   final String ayaText;
//   final String ayaTextEmlaey;
// }
