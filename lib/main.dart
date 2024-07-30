import 'package:holy_quran/bootstrap.dart';
import 'package:holy_quran/modules/app/views/app.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
