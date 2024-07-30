import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/gen/assets.gen.dart';
import 'package:holy_quran/gen/fonts.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    required this.ayahNo,
    super.key,
  });

  final int ayahNo;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    final surah = cubit.getSurahDataByAyahUQ(ayahNo);
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              Assets.images.a88802.path,
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'اياتها\n${surah.ayahs.length}',
                  style: const TextStyle(
                    fontSize: 5,
                    fontFamily: FontFamily.hafsSmart,
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    surah.arabicName,
                    style: const TextStyle(
                      fontFamily: FontFamily.hafsSmart,
                      fontSize: 22,
                    ),
                  ),
                ),
                Text(
                  'ترتيبها\n${surah.surahNumber}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 5,
                    fontFamily: FontFamily.hafsSmart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
