import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holy_quran/core/core.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';
import 'package:holy_quran/utils/utils.dart';
import 'package:string_validator/string_validator.dart';

part 'surahs_cubit.freezed.dart';
part 'surahs_state.dart';

class SurahsCubit extends Cubit<SurahsState> {
  SurahsCubit({
    required this.surahsService,
  }) : super(const SurahsState.initial());

  final SurahsService surahsService;

  String searchQuery = '';
  List<SurahData> surahsList = [];
  List<SurahData> filteredData = [];
  Map<String, dynamic> ayatFiltered = {};
  Set<int> pageNumbers = {};

  Future<void> getSurahs() async {
    if (surahsList.isNotEmpty) {
      emit(const SurahsState.loading());
      emit(SurahsLoaded(surahs: surahsList));
      return;
    }
    emit(const SurahsState.loading());
    final data = await surahsService.getSurahs();
    clearData();
    data.fold(
      (failure) {
        emit(SurahsNotLoaded(failure: failure));
      },
      (surahs) {
        surahsList.addAll(surahs);
        emit(SurahsLoaded(surahs: surahs));
      },
    );
  }

  Future<void> searchSurahs(String query) async {
    emit(const SurahsState.searching());
    clearData();
    searchQuery = query;

    if (searchQuery.isEmpty) {
      await getSurahs();
      return;
    }

    _queryPages();
    _queryAyahs();
    _querySurahs();
    emit(const SurahsState.searched());
  }

  void _queryPages() {
    try {
      if (searchQuery.isNotEmpty &&
          isInt(searchQuery) &&
          toInt(searchQuery) < 605 &&
          toInt(searchQuery) > 0) {
        final page = toInt(searchQuery).toInt();
        final pageData = getPageData(page);
        if (pageData.isNotEmpty) pageNumbers.add(page);
      }
    } catch (_) {}
  }

  void _queryAyahs() {
    try {
      if (searchQuery.length > 3 || searchQuery.contains(' ')) {
        ayatFiltered.addAll(searchWords(searchQuery));
      }
    } catch (_) {}
  }

  void _querySurahs() {
    try {
      if (searchQuery.length > 1 || searchQuery.contains(' ')) {
        final data = surahsList.where((sura) {
          final englishName = sura.englishName.toLowerCase();
          final arabicName = normalise(sura.name);
          final containsArabicName = arabicName.contains(searchQuery);
          final containsEnglishName = englishName.contains(searchQuery);
          return containsArabicName || containsEnglishName;
        }).toList();
        if (data.isNotEmpty) {
          filteredData.addAll(data);
        }
      }
    } catch (_) {}
  }

  void clearData() {
    searchQuery = '';
    filteredData.clear();
    ayatFiltered.clear();
    pageNumbers.clear();
  }
}
