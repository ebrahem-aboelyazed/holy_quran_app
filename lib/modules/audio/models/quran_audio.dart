class QuranAudio {
  QuranAudio({
    required this.surahNumber,
    required this.ayahNumber,
    required this.audioUrl,
    required this.arabicText,
    required this.translation,
    required this.reciter,
  });

  final int surahNumber;
  final int ayahNumber;
  final String audioUrl;
  final String arabicText;
  final String translation;
  final String reciter;
}
