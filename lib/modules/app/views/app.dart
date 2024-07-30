import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:holy_quran/core/core.dart';
import 'package:holy_quran/modules/audio/audio.dart';
import 'package:holy_quran/modules/quran/quran.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranCubit>(
          lazy: false,
          create: (context) {
            return QuranCubit();
          },
        ),
        BlocProvider<SurahsCubit>(
          create: (context) {
            return SurahsCubit(
              surahsService: getIt.get<SurahsService>(),
            )..getSurahs();
          },
        ),
        BlocProvider<AudioPlayerCubit>(
          create: (context) {
            return AudioPlayerCubit(
              audioHandler: getIt.get<QuranAudioHandler>(),
            );
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('ar'),
        builder: DevicePreview.appBuilder,
        home: SurahsPage(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar'),
          Locale('en'),
        ],
      ),
    );
  }
}
