// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurahData _$SurahDataFromJson(Map<String, dynamic> json) {
  return _SurahData.fromJson(json);
}

/// @nodoc
mixin _$SurahData {
  int get number => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String get englishName => throw _privateConstructorUsedError;

  String get englishNameTranslation => throw _privateConstructorUsedError;

  int get numberOfAyahs => throw _privateConstructorUsedError;

  String get revelationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SurahDataCopyWith<SurahData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurahDataCopyWith<$Res> {
  factory $SurahDataCopyWith(SurahData value, $Res Function(SurahData) then) =
      _$SurahDataCopyWithImpl<$Res, SurahData>;

  @useResult
  $Res call(
      {int number,
      String name,
      String englishName,
      String englishNameTranslation,
      int numberOfAyahs,
      String revelationType});
}

/// @nodoc
class _$SurahDataCopyWithImpl<$Res, $Val extends SurahData>
    implements $SurahDataCopyWith<$Res> {
  _$SurahDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? englishName = null,
    Object? englishNameTranslation = null,
    Object? numberOfAyahs = null,
    Object? revelationType = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      englishNameTranslation: null == englishNameTranslation
          ? _value.englishNameTranslation
          : englishNameTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAyahs: null == numberOfAyahs
          ? _value.numberOfAyahs
          : numberOfAyahs // ignore: cast_nullable_to_non_nullable
              as int,
      revelationType: null == revelationType
          ? _value.revelationType
          : revelationType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurahDataImplCopyWith<$Res>
    implements $SurahDataCopyWith<$Res> {
  factory _$$SurahDataImplCopyWith(
          _$SurahDataImpl value, $Res Function(_$SurahDataImpl) then) =
      __$$SurahDataImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int number,
      String name,
      String englishName,
      String englishNameTranslation,
      int numberOfAyahs,
      String revelationType});
}

/// @nodoc
class __$$SurahDataImplCopyWithImpl<$Res>
    extends _$SurahDataCopyWithImpl<$Res, _$SurahDataImpl>
    implements _$$SurahDataImplCopyWith<$Res> {
  __$$SurahDataImplCopyWithImpl(
      _$SurahDataImpl _value, $Res Function(_$SurahDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? englishName = null,
    Object? englishNameTranslation = null,
    Object? numberOfAyahs = null,
    Object? revelationType = null,
  }) {
    return _then(_$SurahDataImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      englishNameTranslation: null == englishNameTranslation
          ? _value.englishNameTranslation
          : englishNameTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAyahs: null == numberOfAyahs
          ? _value.numberOfAyahs
          : numberOfAyahs // ignore: cast_nullable_to_non_nullable
              as int,
      revelationType: null == revelationType
          ? _value.revelationType
          : revelationType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurahDataImpl implements _SurahData {
  const _$SurahDataImpl(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberOfAyahs,
      required this.revelationType});

  factory _$SurahDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurahDataImplFromJson(json);

  @override
  final int number;
  @override
  final String name;
  @override
  final String englishName;
  @override
  final String englishNameTranslation;
  @override
  final int numberOfAyahs;
  @override
  final String revelationType;

  @override
  String toString() {
    return 'SurahData(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, numberOfAyahs: $numberOfAyahs, revelationType: $revelationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurahDataImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.englishNameTranslation, englishNameTranslation) ||
                other.englishNameTranslation == englishNameTranslation) &&
            (identical(other.numberOfAyahs, numberOfAyahs) ||
                other.numberOfAyahs == numberOfAyahs) &&
            (identical(other.revelationType, revelationType) ||
                other.revelationType == revelationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, name, englishName,
      englishNameTranslation, numberOfAyahs, revelationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurahDataImplCopyWith<_$SurahDataImpl> get copyWith =>
      __$$SurahDataImplCopyWithImpl<_$SurahDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurahDataImplToJson(
      this,
    );
  }
}

abstract class _SurahData implements SurahData {
  const factory _SurahData(
      {required final int number,
      required final String name,
      required final String englishName,
      required final String englishNameTranslation,
      required final int numberOfAyahs,
      required final String revelationType}) = _$SurahDataImpl;

  factory _SurahData.fromJson(Map<String, dynamic> json) =
      _$SurahDataImpl.fromJson;

  @override
  int get number;

  @override
  String get name;

  @override
  String get englishName;

  @override
  String get englishNameTranslation;

  @override
  int get numberOfAyahs;

  @override
  String get revelationType;

  @override
  @JsonKey(ignore: true)
  _$$SurahDataImplCopyWith<_$SurahDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
