import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holy_quran/gen/assets.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';

extension ContextExtensions on BuildContext {
  EdgeInsets customOrientation(EdgeInsets n1, EdgeInsets n2) {
    final orientation = MediaQuery.orientationOf(this);
    return orientation == Orientation.portrait ? n1 : n2;
  }

  double customOrientationDouble(double n1, double n2) {
    final orientation = MediaQuery.orientationOf(this);
    return orientation == Orientation.portrait ? n1 : n2;
  }

  Widget surahNameWidget(
    String num,
    Color color, {
    double? height,
    double? width,
  }) {
    return SvgPicture.asset(
      'assets/svg/surah_name/00$num.svg',
      height: height ?? 30,
      width: width,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  Widget bannerWithSurahName(Widget child, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          SizedBox(
            // height: 27.h,
            width: 120,
            child: surahNameWidget(
              number,
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget surahBannerWidget(String number) {
    return bannerWithSurahName(Assets.svg.surahBanner1.svg(), number);
  }

  Widget surahBannerLastPlace(int pageIndex, int i, QuranCubit cubit) {
    final ayahs = cubit.getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
    return cubit.downThePageIndex.contains(pageIndex)
        ? surahBannerWidget(
            (cubit.getSurahNumberByAyah(ayahs.first) + 1).toString(),
          )
        : const SizedBox.shrink();
  }

  Widget surahBannerFirstPlace(int pageIndex, int i, QuranCubit cubit) {
    final ayahs = cubit.getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
    return ayahs.first.ayahNumber == 1
        ? cubit.topOfThePageIndex.contains(pageIndex)
            ? const SizedBox.shrink()
            : surahBannerWidget(
                cubit.getSurahNumberByAyah(ayahs.first).toString(),
              )
        : const SizedBox.shrink();
  }
}
