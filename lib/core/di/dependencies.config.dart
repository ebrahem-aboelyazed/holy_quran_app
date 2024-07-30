// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/audio/audio.dart' as _i1044;
import '../../modules/surahs/services/surahs_service_impl.dart' as _i1001;
import '../../modules/surahs/surahs.dart' as _i325;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i1044.QuranAudioHandler>(
      () => registerModule.audioHandler,
      preResolve: true,
    );
    gh.lazySingleton<_i325.SurahsService>(() => _i1001.SurahsServiceImpl());
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
