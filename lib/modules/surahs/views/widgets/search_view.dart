import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahsCubit>();
    final ayat = cubit.ayatFiltered;
    final ayatLength = cubit.ayatFiltered['occurrences'] as int? ?? 0;
    final surahs = cubit.filteredData;
    final pageNumbers = cubit.pageNumbers;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cubit.pageNumbers.isNotEmpty) ...{
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('الصفحات (${cubit.pageNumbers.length})'),
            ),
            const SizedBox(height: 4),
            PagesListView(
              pageNumbers: pageNumbers.toList(),
            ),
          },
          if (surahs.isNotEmpty) ...{
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('السور (${surahs.length})'),
            ),
            SurahsListView(data: surahs),
          },
          if (ayatLength > 0) ...{
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('الايات ($ayatLength)'),
            ),
            AyatListView(ayat: ayat),
          },
        ],
      ),
    );
  }
}
