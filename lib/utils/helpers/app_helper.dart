import 'package:holy_quran/core/core.dart';

class AppHelper {
  const AppHelper._();

  static Future<void> configureApp() async {
    await configureDependencies();
  }
}
