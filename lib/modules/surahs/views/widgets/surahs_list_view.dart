import 'package:flutter/material.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

class SurahsListView extends StatelessWidget {
  const SurahsListView({
    required this.data,
    super.key,
  });

  final List<SurahData> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
        );
      },
      itemBuilder: (context, index) {
        return SurahTile(e: data[index]);
      },
    );
  }
}
