import 'dart:convert';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holy_quran/modules/quran/quran.dart';

part 'quran_cubit.freezed.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState.initial()) {
    loadQuran();
  }

  List<Surah> surahs = [];
  List<List<Ayah>> pages = [];
  List<Ayah> allAyahs = [];

  List<int> downThePageIndex = [
    75,
    206,
    330,
    340,
    348,
    365,
    375,
    413,
    416,
    444,
    451,
    497,
    505,
    524,
    547,
    554,
    556,
    583,
  ];
  List<int> topOfThePageIndex = [
    76,
    207,
    331,
    341,
    349,
    366,
    376,
    414,
    417,
    435,
    445,
    452,
    498,
    506,
    525,
    548,
    554,
    555,
    557,
    583,
    584,
  ];

  Future<void> loadQuran() async {
    emit(const QuranState.loading());
    final jsonString = await rootBundle.loadString('assets/json/quranV2.json');
    final jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
    final data = jsonResponse['data'] as Map<String, dynamic>;
    final surahsJson = data['surahs'] as List<dynamic>;
    final castedSurahs = List<Map<String, dynamic>>.from(surahsJson);
    surahs = castedSurahs.map(Surah.fromJson).toList();

    for (final surah in surahs) {
      allAyahs.addAll(surah.ayahs);
    }
    List.generate(604, (pageIndex) {
      pages.add(allAyahs.where((ayah) => ayah.page == pageIndex + 1).toList());
    });
    emit(const QuranState.loaded());
  }

  List<List<Ayah>> getCurrentPageAyahsSeparatedForBasmalah(int pageIndex) {
    return pages[pageIndex]
        .splitBetween((f, s) => f.ayahNumber > s.ayahNumber)
        .toList();
  }

  List<Ayah> getCurrentPageAyahs(int pageIndex) => pages[pageIndex];

  /// will return the surah number of the first ayahs..
  /// even if the page contains another surah..
  /// if you wanna get the last's ayah's surah information
  /// you can use ayahs.last.
  int getSurahNumberFromPage(int pageNumber) {
    return surahs.firstWhere(
      (s) {
        final currentAyah = getCurrentPageAyahs(pageNumber).first;
        return s.ayahs.contains(currentAyah);
      },
    ).surahNumber;
  }

  Surah getCurrentSurahByPage(int pageNumber) {
    return surahs.firstWhere((s) {
      final currentAyah = getCurrentPageAyahs(pageNumber).first;
      return s.ayahs.contains(currentAyah);
    });
  }

  String getSurahNameFromPage(int pageNumber) {
    try {
      return surahs.firstWhere(
        (s) {
          final currentAyah = getCurrentPageAyahs(pageNumber).first;
          return s.ayahs.contains(currentAyah);
        },
      ).arabicName;
    } catch (e) {
      return 'Surah not found';
    }
  }

  int getSurahNumberByAyah(Ayah ayah) =>
      surahs.firstWhere((s) => s.ayahs.contains(ayah)).surahNumber;

  Surah getSurahDataByAyahUQ(int ayah) =>
      surahs.firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah));

  Ayah getJuzByPage(int page) => allAyahs.firstWhere((a) => a.page == page + 1);

  String getSurahByAyahUQ(int ayah) => surahs
      .firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah))
      .arabicName;

  // Assuming `lastDisplayedHizbQuarter` is a class variable that keeps track of
  // the last displayed Hizb quarter.
  int? lastDisplayedHizbQuarter;
  Map<int, int> pageToHizbQuarterMap = {};

  String getHizbQuarterDisplayByPage(int pageNumber) {
    final currentPageAyahs =
        allAyahs.where((ayah) => ayah.page == pageNumber).toList();
    if (currentPageAyahs.isEmpty) return '';

    // Find the highest Hizb quarter on the current page
    final currentMaxHizbQuarter =
        currentPageAyahs.map((ayah) => ayah.hizbQuarter).reduce(math.max);

    // Store/update the highest Hizb quarter for this page
    pageToHizbQuarterMap[pageNumber] = currentMaxHizbQuarter;

    if (pageNumber == 1 ||
        pageToHizbQuarterMap[pageNumber - 1] != currentMaxHizbQuarter) {
      final hizbNumber = ((currentMaxHizbQuarter - 1) ~/ 4) + 1;
      final quarterPosition = (currentMaxHizbQuarter - 1) % 4;

      switch (quarterPosition) {
        case 0:
          return "الحزب ${convertNumbers('$hizbNumber')}";
        case 1:
          return "١/٤ الحزب ${convertNumbers('$hizbNumber')}";
        case 2:
          return "١/٢ الحزب ${convertNumbers('$hizbNumber')}";
        case 3:
          return "٣/٤ الحزب ${convertNumbers('$hizbNumber')}";
        default:
          return '';
      }
    }

    // If the page's Hizb quarter is the same
    // as the previous page, do not display it again
    return '';
  }
}
