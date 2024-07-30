import 'package:go_router/go_router.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

part 'app_routes.dart';

class AppPages {
  AppPages();

  final initial = Routes.initial;

  late final router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const SurahsPage(),
      ),
    ],
  );
}
