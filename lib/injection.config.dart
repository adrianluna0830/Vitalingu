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
import 'package:vitalingu/models/private_settings.dart' as _i806;
import 'package:vitalingu/models/shared_preferences_store.dart' as _i680;
import 'package:vitalingu/repository/grammar_topics_repository.dart' as _i700;
import 'package:vitalingu/repository/user_settings.dart' as _i413;
import 'package:vitalingu/services/load_language_topics_service.dart' as _i475;
import 'package:vitalingu/services/navigation_service.dart' as _i19;
import 'package:vitalingu/view_models/startup/startup_introduction_view_model.dart'
    as _i377;
import 'package:vitalingu/view_models/startup/startup_level_configure_view_model.dart'
    as _i1048;
import 'package:vitalingu/view_models/startup/startup_native_language_view_model.dart'
    as _i75;
import 'package:vitalingu/view_models/startup/startup_target_language_view_model.dart'
    as _i731;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i680.SharedPreferencesStore>(
      () => _i680.SharedPreferencesStore(),
    );
    gh.factory<_i377.StartupIntroductionViewModel>(
      () => _i377.StartupIntroductionViewModel(),
    );
    gh.factory<_i75.StartupNativeLanguageViewModel>(
      () => _i75.StartupNativeLanguageViewModel(),
    );
    gh.singleton<_i641.AppRouter>(() => _i641.AppRouter());
    await gh.singletonAsync<_i700.GrammarTopicsRepository>(
      () => _i700.GrammarTopicsRepository.create(),
      preResolve: true,
    );
    gh.singleton<_i413.UserSettings>(() => _i413.UserSettings());
    gh.factory<_i731.StartupTargetLanguageViewModel>(
      () => _i731.StartupTargetLanguageViewModel(gh<_i413.UserSettings>()),
    );
    gh.singleton<_i19.NavigationService>(
      () => _i19.NavigationService(gh<_i641.AppRouter>()),
    );
    await gh.singletonAsync<_i806.HasLoadedDataSignal>(
      () => _i806.HasLoadedDataSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i806.IsStartupCompletedSignal>(
      () => _i806.IsStartupCompletedSignal.create(
        sharedPreferencesStore: gh<_i680.SharedPreferencesStore>(),
      ),
      preResolve: true,
    );
    gh.factory<_i1048.StartupLevelConfigureViewModel>(
      () => _i1048.StartupLevelConfigureViewModel(gh<_i19.NavigationService>()),
    );
    gh.factory<_i475.LoadLanguageTopicsService>(
      () => _i475.LoadLanguageTopicsService(
        gh<_i700.GrammarTopicsRepository>(),
        hasLoadedDataSignal: gh<_i806.HasLoadedDataSignal>(),
      ),
    );
    return this;
  }
}
