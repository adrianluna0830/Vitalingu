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
import 'package:vitalingu/controllers/word_overlay_controller.dart' as _i790;
import 'package:vitalingu/core/database/database_interface.dart' as _i64;
import 'package:vitalingu/core/di/modules.dart' as _i298;
import 'package:vitalingu/core/navigation/app_router.dart' as _i419;
import 'package:vitalingu/core/services/ai/gemini_prompt_service.dart'
    as _i1061;
import 'package:vitalingu/core/services/ai_wrappers/selectable_text_service.dart'
    as _i897;
import 'package:vitalingu/core/services/ai_wrappers/word_generation_service.dart'
    as _i748;
import 'package:vitalingu/core/services/audio_service.dart' as _i548;
import 'package:vitalingu/core/services/language_settings_service.dart'
    as _i983;
import 'package:vitalingu/core/services/navigation_service.dart' as _i161;
import 'package:vitalingu/core/services/overlay_global_manager.dart' as _i495;
import 'package:vitalingu/core/services/pixabay_service.dart' as _i611;
import 'package:vitalingu/core/services/settings_service.dart' as _i405;
import 'package:vitalingu/features/language_management/data/model/language_settings.dart'
    as _i736;
import 'package:vitalingu/features/language_management/presentation/view/language_view.dart'
    as _i125;
import 'package:vitalingu/features/language_management/presentation/view_model/select_language_view_model.dart'
    as _i419;
import 'package:vitalingu/features/settings/data/model/settings.dart' as _i1049;
import 'package:vitalingu/features/settings/presentation/view_model/settings_view_model.dart'
    as _i487;
import 'package:vitalingu/features/startup/presentation/view_model/app_startup_loading_view_model.dart'
    as _i264;
import 'package:vitalingu/features/voice_chat/presentation/view_model/voice_chat_view_model.dart'
    as _i647;
import 'package:vitalingu/features/word_overlay/presentation/controller/overlay_controller.dart'
    as _i399;
import 'package:vitalingu/features/word_overlay/presentation/controller/word_overlay_controller.dart'
    as _i721;

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
    gh.factory<_i790.WordOverlayController>(
        () => _i790.WordOverlayController());
    await gh.factoryAsync<_i64.DatabaseInterface<_i736.LanguageSettings>>(
      () => registerModule.languageSettingsDatabase,
      preResolve: true,
    );
    gh.factory<_i399.OverlayController>(() => _i399.OverlayController());
    gh.factory<_i721.WordOverlayController>(
        () => _i721.WordOverlayController());
    gh.singleton<_i419.AppRouter>(() => _i419.AppRouter());
    gh.singleton<_i548.AudioService>(() => _i548.AudioService());
    gh.singleton<_i495.OverlayGlobalManager>(
        () => _i495.OverlayGlobalManager());
    gh.lazySingleton<_i1049.GeminiSettings>(() => _i1049.GeminiSettings());
    gh.lazySingleton<_i1049.PixabaySettings>(() => _i1049.PixabaySettings());
    gh.lazySingleton<_i1049.MicrosoftSpeechSettings>(
        () => _i1049.MicrosoftSpeechSettings());
    gh.lazySingleton<_i1049.NativeLanguage>(() => _i1049.NativeLanguage());
    gh.lazySingleton<_i1049.SessionTargetLanguage>(
        () => _i1049.SessionTargetLanguage());
    gh.singleton<_i405.SettingsService>(() => _i405.SettingsService(
          gh<_i1049.GeminiSettings>(),
          gh<_i1049.PixabaySettings>(),
          gh<_i1049.MicrosoftSpeechSettings>(),
          gh<_i1049.NativeLanguage>(),
        ));
    gh.singleton<_i983.LanguageSettingsService>(() =>
        _i983.LanguageSettingsService(
            gh<_i64.DatabaseInterface<_i736.LanguageSettings>>()));
    gh.factory<_i611.PixabayService>(() =>
        _i611.PixabayService(pixabaySettings: gh<_i1049.PixabaySettings>()));
    gh.factory<_i1061.GeminiPromptService>(() => _i1061.GeminiPromptService(
        geminiSettings: gh<_i1049.GeminiSettings>()));
    gh.singleton<_i161.NavigationService>(
        () => _i161.NavigationService(gh<_i419.AppRouter>()));
    gh.factory<_i264.AppStartupLoadingViewModel>(
        () => _i264.AppStartupLoadingViewModel(
              settingsService: gh<_i405.SettingsService>(),
              navigationService: gh<_i161.NavigationService>(),
            ));
    gh.factory<_i897.SelectableTextService>(() => _i897.SelectableTextService(
          gh<_i1049.NativeLanguage>(),
          gh<_i1049.SessionTargetLanguage>(),
          gh<_i1061.GeminiPromptService>(),
        ));
    gh.factory<_i748.WordGenerationService>(() => _i748.WordGenerationService(
          nativeLanguage: gh<_i1049.NativeLanguage>(),
          targetLanguage: gh<_i1049.SessionTargetLanguage>(),
          geminiPromptService: gh<_i1061.GeminiPromptService>(),
        ));
    gh.factory<_i487.SettingsViewModel>(() => _i487.SettingsViewModel(
          gh<_i1049.GeminiSettings>(),
          gh<_i1049.PixabaySettings>(),
          gh<_i1049.MicrosoftSpeechSettings>(),
          gh<_i1049.NativeLanguage>(),
          gh<_i405.SettingsService>(),
          navigationService: gh<_i161.NavigationService>(),
        ));
    gh.factory<_i125.LanguageViewModel>(() => _i125.LanguageViewModel(
        navigationService: gh<_i161.NavigationService>()));
    gh.factory<_i647.VoiceChatViewModel>(() => _i647.VoiceChatViewModel(
        navigationService: gh<_i161.NavigationService>()));
    gh.factory<_i419.SelectLanguageViewModel>(
        () => _i419.SelectLanguageViewModel(
              gh<_i1049.SessionTargetLanguage>(),
              languageSettingsService: gh<_i983.LanguageSettingsService>(),
              navigationService: gh<_i161.NavigationService>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i298.RegisterModule {}
