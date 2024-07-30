import 'package:dartz/dartz.dart';
import 'package:holy_quran/core/core.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

abstract class SurahsService {
  Future<Either<Failure, List<SurahData>>> getSurahs();
}
