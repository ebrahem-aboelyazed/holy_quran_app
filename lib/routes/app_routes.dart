part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const initial = Paths.initial;
  static const home = Paths.home;
}

abstract class Paths {
  Paths._();

  static const String initial = '/';
  static const String home = '/';
}
