import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/utils/utils.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({
    required this.pageNumber,
    this.verseToHighlight,
    super.key,
  });

  final int pageNumber;
  final int? verseToHighlight;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstants.quranPagesColor,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: 604,
          padEnds: false,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, i) {
            final isMobile = Responsive.isMobile(context) ||
                Responsive.isMobileLarge(context);
            final padding = isMobile
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 32);
            return Center(
              child: Padding(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    TopTitleWidget(index: i),
                    Expanded(
                      child: Center(
                        child: PagesWidget(
                          pageIndex: i,
                          verseToHighlight: widget.verseToHighlight,
                        ),
                      ),
                    ),
                    QuranBottomWidget(index: i),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void initData() {
    _pageController = PageController(initialPage: widget.pageNumber - 1);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WakelockPlus.enable();
  }
}
