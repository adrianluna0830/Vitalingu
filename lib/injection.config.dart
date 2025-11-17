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
import 'package:vitalingu/database/database_interface.dart' as _i855;
import 'package:vitalingu/di/modules.dart' as _i938;
import 'package:vitalingu/models/language_settings.dart' as _i973;
import 'package:vitalingu/models/settings.dart' as _i688;
import 'package:vitalingu/router/app_router.dart' as _i5;
import 'package:vitalingu/services/custom_overlay.dart' as _i1047;
import 'package:vitalingu/services/gemini_prompt_service.dart' as _i657;
import 'package:vitalingu/services/language_settings_service.dart' as _i1009;
import 'package:vitalingu/services/navigation_service.dart' as _i19;
import 'package:vitalingu/services/pixabay_service.dart' as _i626;
import 'package:vitalingu/services/selectable_text_service.dart' as _i593;
import 'package:vitalingu/services/settings_service.dart' as _i763;
import 'package:vitalingu/services/word_generation_service.dart' as _i196;
import 'package:vitalingu/viewmodels/app_startup_loading_view_model.dart'
    as _i256;
import 'package:vitalingu/viewmodels/select_language_view_model.dart' as _i914;
import 'package:vitalingu/viewmodels/settings_view_model.dart' as _i587;
import 'package:vitalingu/widgets/custom_overlay_manager.dart' as _i290;

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
    await gh.factoryAsync<_i855.DatabaseInterface<_i973.LanguageSettings>>(
      () => registerModule.languageSettingsDatabase,
      preResolve: true,
    );
    gh.factory<_i290.CustomOverlayManager>(() => _i290.CustomOverlayManager());
    gh.singleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.singleton<_i1047.CustomOverlay>(() => _i1047.CustomOverlay());
    gh.lazySingleton<_i688.GeminiSettings>(() => _i688.GeminiSettings());
    gh.lazySingleton<_i688.PixabaySettings>(() => _i688.PixabaySettings());
    gh.lazySingleton<_i688.MicrosoftSpeechSettings>(
        () => _i688.MicrosoftSpeechSettings());
    gh.lazySingleton<_i688.NativeLanguage>(() => _i688.NativeLanguage());
    gh.lazySingleton<_i688.SessionTargetLanguage>(
        () => _i688.SessionTargetLanguage());
    gh.singleton<_i1009.LanguageSettingsService>(() =>
        _i1009.LanguageSettingsService(
            gh<_i855.DatabaseInterface<_i973.LanguageSettings>>()));
    gh.factory<_i657.GeminiPromptService>(() =>
        _i657.GeminiPromptService(geminiSettings: gh<_i688.GeminiSettings>()));
    gh.factory<_i626.PixabayService>(() =>
        _i626.PixabayService(pixabaySettings: gh<_i688.PixabaySettings>()));
    gh.singleton<_i763.SettingsService>(() => _i763.SettingsService(
          gh<_i688.GeminiSettings>(),
          gh<_i688.PixabaySettings>(),
          gh<_i688.MicrosoftSpeechSettings>(),
          gh<_i688.NativeLanguage>(),
        ));
    gh.singleton<_i19.NavigationService>(
        () => _i19.NavigationService(gh<_i5.AppRouter>()));
    gh.factory<_i196.WordGenerationService>(() => _i196.WordGenerationService(
          nativeLanguage: gh<_i688.NativeLanguage>(),
          targetLanguage: gh<_i688.SessionTargetLanguage>(),
          geminiPromptService: gh<_i657.GeminiPromptService>(),
        ));
    gh.factory<_i587.SettingsViewModel>(() => _i587.SettingsViewModel(
          gh<_i688.GeminiSettings>(),
          gh<_i688.PixabaySettings>(),
          gh<_i688.MicrosoftSpeechSettings>(),
          gh<_i688.NativeLanguage>(),
          gh<_i763.SettingsService>(),
          navigationService: gh<_i19.NavigationService>(),
        ));
    gh.factory<_i593.SelectableTextService>(() => _i593.SelectableTextService(
          gh<_i688.NativeLanguage>(),
          gh<_i688.SessionTargetLanguage>(),
          gh<_i657.GeminiPromptService>(),
        ));
    gh.factory<_i256.AppStartupLoadingViewModel>(
        () => _i256.AppStartupLoadingViewModel(
              settingsService: gh<_i763.SettingsService>(),
              navigationService: gh<_i19.NavigationService>(),
            ));
    gh.factory<_i914.SelectLanguageViewModel>(
        () => _i914.SelectLanguageViewModel(
              gh<_i688.SessionTargetLanguage>(),
              languageSettingsService: gh<_i1009.LanguageSettingsService>(),
              navigationService: gh<_i19.NavigationService>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i938.RegisterModule {}
