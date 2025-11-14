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
import 'package:vitalingu/database/app_settings_database.dart' as _i185;
import 'package:vitalingu/database/language_session_settings_database.dart'
    as _i490;
import 'package:vitalingu/di/modules.dart' as _i938;
import 'package:vitalingu/router/app_router.dart' as _i5;
import 'package:vitalingu/services/app_settings_service.dart' as _i621;
import 'package:vitalingu/services/language_settings_service.dart' as _i1009;
import 'package:vitalingu/services/navigation_service.dart' as _i19;
import 'package:vitalingu/services/scope_manager_service.dart' as _i830;
import 'package:vitalingu/viewmodels/app_startup_loading_view_model.dart'
    as _i256;
import 'package:vitalingu/viewmodels/language_view_model.dart' as _i1052;
import 'package:vitalingu/viewmodels/select_language_view_model.dart' as _i914;
import 'package:vitalingu/viewmodels/settings_view_model.dart' as _i587;
import 'package:vitalingu/widgets/target_language_selectable_text.dart'
    as _i521;

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
    final databaseModule = _$DatabaseModule();
    gh.factory<_i521.TargetLanguageSelectableTextController>(
        () => _i521.TargetLanguageSelectableTextController());
    await gh.singletonAsync<_i185.AppSettingsDatabase>(
      () => databaseModule.provideAppSettingsDatabase(),
      preResolve: true,
    );
    await gh.singletonAsync<_i490.LanguageSettingsDatabase>(
      () => databaseModule.provideLanguageSettingsDatabase(),
      preResolve: true,
    );
    gh.singleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.singleton<_i830.ScopeManagerService>(() => _i830.ScopeManagerService());
    gh.singleton<_i621.AppSettingsService>(
        () => _i621.AppSettingsService(gh<_i185.AppSettingsDatabase>()));
    gh.singleton<_i1009.LanguageSettingsService>(() =>
        _i1009.LanguageSettingsService(gh<_i490.LanguageSettingsDatabase>()));
    gh.singleton<_i19.NavigationService>(
        () => _i19.NavigationService(gh<_i5.AppRouter>()));
    gh.factory<_i256.AppStartupLoadingViewModel>(
        () => _i256.AppStartupLoadingViewModel(
              appSettingsService: gh<_i621.AppSettingsService>(),
              navigationService: gh<_i19.NavigationService>(),
              scopeManagerService: gh<_i830.ScopeManagerService>(),
            ));
    gh.factory<_i1052.LanguageViewModel>(() => _i1052.LanguageViewModel(
          navigationService: gh<_i19.NavigationService>(),
          scopeManagerService: gh<_i830.ScopeManagerService>(),
        ));
    gh.factory<_i587.SettingsViewModel>(() => _i587.SettingsViewModel(
          gh<_i621.AppSettingsService>(),
          navigationService: gh<_i19.NavigationService>(),
          scopeManagerService: gh<_i830.ScopeManagerService>(),
        ));
    gh.factory<_i914.SelectLanguageViewModel>(
        () => _i914.SelectLanguageViewModel(
              languageSessionService: gh<_i1009.LanguageSettingsService>(),
              navigationService: gh<_i19.NavigationService>(),
              scopeManagerService: gh<_i830.ScopeManagerService>(),
            ));
    return this;
  }
}

class _$DatabaseModule extends _i938.DatabaseModule {}
