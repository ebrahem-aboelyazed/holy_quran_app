part of 'quran_cubit.dart';

@freezed
class QuranState with _$QuranState {
  const factory QuranState.initial() = InitialQuran;

  const factory QuranState.loading() = QuranLoading;

  const factory QuranState.loaded() = QuranLoaded;

  const factory QuranState.notLoaded() = QuranNotLoaded;

  const factory QuranState.updating() = QuranUpdating;

  const factory QuranState.updated() = QuranUpdated;
}
