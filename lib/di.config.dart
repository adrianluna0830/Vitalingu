// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sembast/sembast.dart' as _i310;
import 'package:vitalingu/modules.dart' as _i127;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    await gh.singletonAsync<_i310.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    await gh.singletonAsync<String>(
      () => databaseModule.applicationDocumentsPath,
      preResolve: true,
    );
    return this;
  }
}

class _$DatabaseModule extends _i127.DatabaseModule {}
