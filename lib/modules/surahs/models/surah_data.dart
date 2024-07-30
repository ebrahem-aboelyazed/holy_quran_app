import 'package:freezed_annotation/freezed_annotation.dart';

part 'surah_data.freezed.dart';
part 'surah_data.g.dart';

@freezed
class SurahData with _$SurahData {
  const factory SurahData({
    required int number,
    required String name,
    required String englishName,
    required String englishNameTranslation,
    required int numberOfAyahs,
    required String revelationType,
  }) = _SurahData;

  factory SurahData.fromJson(Map<String, dynamic> json) =>
      _$SurahDataFromJson(json);
}
