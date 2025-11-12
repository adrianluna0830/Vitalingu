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
import 'package:sembast/sembast_io.dart' as _i156;
import 'package:vitalingu/database/app_settings_database.dart' as _i185;
import 'package:vitalingu/database/sembast_database.dart' as _i500;
import 'package:vitalingu/di/modules.dart' as _i938;
import 'package:vitalingu/interfaces/database_interface.dart' as _i475;
import 'package:vitalingu/language/language.dart' as _i473;
import 'package:vitalingu/services/gemini_prompt_service.dart' as _i657;
import 'package:vitalingu/services/navigation_service.dart' as _i19;
import 'package:vitalingu/services/pixabay_service.dart' as _i626;
import 'package:vitalingu/viewmodels/app_startup_loading_view_model.dart'
    as _i256;
import 'package:vitalingu/viewmodels/language_viewmodel.dart' as _i621;
import 'package:vitalingu/viewmodels/select_language_view_models.dart' as _i459;
import 'package:vitalingu/viewmodels/settings_viewmodel.dart' as _i543;

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
    await gh.singletonAsync<_i156.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    await gh.singletonAsync<String>(
      () => databaseModule.applicationDocumentsPath,
      preResolve: true,
    );
    gh.singleton<_i19.NavigationService>(() => _i19.NavigationService());
    gh.factory<_i459.SelectLanguageViewModel>(() =>
        _i459.SelectLanguageViewModel(
            navigationService: gh<_i19.NavigationService>()));
    gh.lazySingleton<_i475.DatabaseInterface<String, String>>(
        () => _i500.SembastDatabase(
              database: gh<_i310.Database>(),
              storeName: gh<String>(),
            ));
    gh.singleton<_i500.SembastDatabase>(
        () => databaseModule.wordDatabase(gh<_i156.Database>()));
    gh.factory<_i621.LanguageViewModel>(() => _i621.LanguageViewModel(
          language: gh<_i473.Language>(),
          navigationService: gh<_i19.NavigationService>(),
        ));
    gh.factory<_i185.AppSettingsDatabase>(() => _i185.AppSettingsDatabase(
        gh<_i475.DatabaseInterface<String, String>>()));
    await gh.lazySingletonAsync<_i657.GeminiPromptService>(
      () => databaseModule.geminiPromptService(gh<_i185.AppSettingsDatabase>()),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i626.PixabayService>(
      () => databaseModule.pixabayService(gh<_i185.AppSettingsDatabase>()),
      preResolve: true,
    );
    gh.factory<_i543.SettingsViewModel>(() => _i543.SettingsViewModel(
          gh<_i185.AppSettingsDatabase>(),
          navigationService: gh<_i19.NavigationService>(),
        ));
    gh.factory<_i256.AppStartupLoadingViewModel>(
        () => _i256.AppStartupLoadingViewModel(
              appSettingsDatabase: gh<_i185.AppSettingsDatabase>(),
              navigationService: gh<_i19.NavigationService>(),
            ));
    return this;
  }
}

class _$DatabaseModule extends _i938.DatabaseModule {}
