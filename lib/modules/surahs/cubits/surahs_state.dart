part of 'surahs_cubit.dart';

@freezed
class SurahsState with _$SurahsState {
  const factory SurahsState.initial() = SurahsInitial;

  const factory SurahsState.loading() = SurahsLoading;

  const factory SurahsState.searching() = SurahsSearching;

  const factory SurahsState.searched() = SurahsSearced;

  const factory SurahsState.loaded({
    required List<SurahData> surahs,
  }) = SurahsLoaded;

  const factory SurahsState.notLoaded({
    required Failure failure,
  }) = SurahsNotLoaded;
}
