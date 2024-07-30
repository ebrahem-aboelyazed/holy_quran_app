import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/common/common.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';
import 'package:holy_quran/utils/utils.dart';

class SurahsPage extends StatelessWidget {
  const SurahsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahsCubit>();
    return Scaffold(
      backgroundColor: AppConstants.quranPagesColor,
      appBar: AppBar(
        title: const Text('القرآن الكريم'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SearchField(
              initialValue: cubit.searchQuery,
              onChanged: cubit.searchSurahs,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<SurahsCubit, SurahsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  searching: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  searched: SearchView.new,
                  orElse: () {
                    final data = cubit.surahsList;
                    return ListView.separated(
                      itemCount: data.length,
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
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
