// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurahDataImpl _$$SurahDataImplFromJson(Map<String, dynamic> json) =>
    _$SurahDataImpl(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
      englishName: json['englishName'] as String,
      englishNameTranslation: json['englishNameTranslation'] as String,
      numberOfAyahs: (json['numberOfAyahs'] as num).toInt(),
      revelationType: json['revelationType'] as String,
    );

Map<String, dynamic> _$$SurahDataImplToJson(_$SurahDataImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
