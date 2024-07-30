import 'package:flutter/material.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';

class PagesListView extends StatelessWidget {
  const PagesListView({
    required this.pageNumbers,
    super.key,
  });

  final List<int> pageNumbers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pageNumbers.length,
      reverse: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
        );
      },
      itemBuilder: (ctx, index) {
        final page = pageNumbers[index];
        final name = getSurahNameByPage(page);
        return Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                context.goTo(
                  QuranPage(pageNumber: page),
                );
              },
              child: ListTile(
                title: Text('الصفحه $page'),
                trailing: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
