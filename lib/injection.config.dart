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
import 'package:vitalingu/app_router.dart' as _i641;
import 'package:vitalingu/services/navigation_service.dart' as _i19;
import 'package:vitalingu/view_models/startup_level_configure_view_model.dart'
    as _i556;
import 'package:vitalingu/view_models/startup_native_language_view_model.dart'
    as _i431;
import 'package:vitalingu/view_models/startup_target_language_view_model.dart'
    as _i531;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i556.StartupLevelConfigureViewModel>(
      () => _i556.StartupLevelConfigureViewModel(),
    );
    gh.factory<_i431.StartupNativeLanguageViewModel>(
      () => _i431.StartupNativeLanguageViewModel(),
    );
    gh.factory<_i531.StartupTargetLanguageViewModel>(
      () => _i531.StartupTargetLanguageViewModel(),
    );
    gh.singleton<_i641.AppRouter>(() => _i641.AppRouter());
    gh.singleton<_i19.NavigationService>(
      () => _i19.NavigationService(gh<_i641.AppRouter>()),
    );
    return this;
  }
}
