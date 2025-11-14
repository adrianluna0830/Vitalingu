import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/services/app_settings_service.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';
import 'package:vitalingu/services/word_prompts_service.dart';

@singleton
class ScopeManagerService {
  static const String userConfigScopeName = 'user-config-session';
  static const String languageScopeName = 'language-session';

  Future<void> createUserConfigScope() async {
    if (getIt.hasScope(userConfigScopeName)) {
      await getIt.popScopesTill(userConfigScopeName);
    }

    final appSettingsService = getIt<AppSettingsService>();
    final appSettings = await appSettingsService.getSettings();
    if(appSettings == null) {
      throw Exception('App settings are null. Cannot create user config scope.');
    }
    await getIt.pushNewScopeAsync(
      scopeName: userConfigScopeName,
      init: (getIt) async {
        getIt.registerSingleton<GeminiPromptService>(
            GeminiPromptService(appSettings.geminiApiKey));
        getIt.registerSingleton<PixabayService>(
            PixabayService(appSettings.pixabayApiKey));
      },
    );
  }

  Future<void> createLanguageScope(LanguageSessionSettings sessionSettings) async {
    if (getIt.hasScope(languageScopeName)) {
      await getIt.popScopesTill(languageScopeName);
    }

    final appSettingsService = getIt<AppSettingsService>();
    final appSettings = await appSettingsService.getSettings();

    await getIt.pushNewScopeAsync(
      scopeName: languageScopeName,
      init: (getIt) async {
        final language = sessionSettings.targetLanguage;
        final languageWord = sessionSettings.languageWord;
        
        getIt.registerSingleton<LanguageSessionSettings>(sessionSettings);
        getIt.registerSingleton<Language>(language);
        
        WordPromptsService wordPromptsService = WordPromptsService(
          nativeLanguage: appSettings!.nativeLanguage,
          targetLanguage: language,
          languageWord: languageWord,
          geminiPromptService: getIt(),
        );
        getIt.registerSingleton<WordPromptsService>(wordPromptsService);
      },
    );
  }

  bool hasUserConfigScope() => getIt.hasScope(userConfigScopeName);

  bool hasLanguageScope() => getIt.hasScope(languageScopeName);
}
