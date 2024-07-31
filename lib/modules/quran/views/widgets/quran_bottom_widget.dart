import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/gen/fonts.gen.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class QuranBottomWidget extends StatelessWidget {
  const QuranBottomWidget({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    final hizb = cubit.getHizbQuarterDisplayByPage(index + 1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hizb,
            style: TextStyle(
              fontSize: context.customOrientationDouble(18, 22),
              fontFamily: FontFamily.naskh,
              color: const Color(0xff77554B),
            ),
          ),
          Center(
            child: Text(
              convertNumbers('${index + 1}'),
              style: TextStyle(
                fontSize: context.customOrientationDouble(25, 30),
                fontFamily: FontFamily.naskh,
                color: const Color(0xff77554B),
              ),
            ),
          ),
          if (hizb.isNotEmpty) ...{
            Container(),
          },
          Container(),
        ],
      ),
    );
  }
}
