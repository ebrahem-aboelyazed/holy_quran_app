import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:holy_quran/core/core.dart';
import 'package:holy_quran/modules/surahs/surahs.dart';

@LazySingleton(as: SurahsService)
class SurahsServiceImpl implements SurahsService {
  @override
  Future<Either<Failure, List<SurahData>>> getSurahs() async {
    try {
      final data = await rootBundle.loadString('assets/json/surahs.json');
      final json = jsonDecode(data) as List<dynamic>?;
      if (json == null) return const Left(Failure());
      final castedJson = List<Map<String, dynamic>>.from(json);
      final surahs = castedJson.map(SurahData.fromJson).toList();
      return Right(surahs);
    } catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      return Left(Failure(message: e.toString()));
    }
  }
}
