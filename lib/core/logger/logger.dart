import 'package:logger/logger.dart';

final prettyPrinter = PrettyPrinter();

final logger = Logger(printer: PrettyPrinter(colors: false, lineLength: 0));
