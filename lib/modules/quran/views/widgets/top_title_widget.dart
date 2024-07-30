import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:holy_quran/gen/fonts.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class TopTitleWidget extends StatelessWidget {
  const TopTitleWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    final surahName = cubit.getSurahNameFromPage(index);
    final juzNo = cubit.getJuzByPage(index).juz.toString();
    final convertedNo = convertNumbers(juzNo);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Gap(16),
          Text(
            '${'جزء'}: $convertedNo',
            style: TextStyle(
              fontSize: context.customOrientationDouble(18, 22),
              fontFamily: FontFamily.naskh,
              color: const Color(0xff77554B),
            ),
          ),
          const Spacer(),
          Text(
            surahName,
            style: TextStyle(
              fontSize: context.customOrientationDouble(18, 22),
              fontFamily: FontFamily.naskh,
              color: const Color(0xff77554B),
            ),
          ),
          const SizedBox(width: 30),
          // GestureDetector(
          //   onTap: () {},
          //   child: Assets.svg.bookmarkIcon.svg(
          //     height: context.customOrientationDouble(30, 40),
          //   ),
          // ),
        ],
      ),
    );
  }
}
