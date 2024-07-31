import 'package:get_it/get_it.dart';
import 'package:holy_quran/core/core.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
)
Future<void> configureDependencies() async => getIt.init();
