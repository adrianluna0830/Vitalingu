import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';
import 'package:vitalingu/services/word_prompts_service.dart';

@singleton
class ScopeManagerService {
  static const String userConfigScopeName = 'user-config-session';
  static const String languageScopeName = 'language-session';

  Future<void> createUserConfigScope(AppSettings appSettings) async {
    if (getIt.hasScope(userConfigScopeName)) {
      await getIt.popScope();
    }

    await getIt.pushNewScopeAsync(
      scopeName: userConfigScopeName,
      init: (getIt) async {
        getIt.registerSingleton<AppSettings>(appSettings);
        getIt.registerSingleton<GeminiPromptService>(
            GeminiPromptService(appSettings.geminiApiKey));
        getIt.registerSingleton<PixabayService>(
            PixabayService(appSettings.pixabayApiKey));
      },
    );
  }

  Future<void> createLanguageScope(LanguageSessionSettings sessionSettings) async {
    if (getIt.hasScope(languageScopeName)) {
      await getIt.popScope();
    }

    // Obtener AppSettings del scope actual antes de crear el nuevo scope
    final appSettings = getIt<AppSettings>();

    await getIt.pushNewScopeAsync(
      scopeName: languageScopeName,
      init: (getIt) async {
        final language = sessionSettings.targetLanguage;
        final languageWord = sessionSettings.languageWord;
        
        getIt.registerSingleton<LanguageSessionSettings>(sessionSettings);
        getIt.registerSingleton<Language>(language);
        
        WordPromptsService wordPromptsService = WordPromptsService(
          nativeLanguage: appSettings.nativeLanguage,
          targetLanguage: language,
          languageWord: languageWord,
          geminiPromptService: getIt(),
        );
        getIt.registerSingleton<WordPromptsService>(wordPromptsService);
      },
    );
  }

  Future<void> disposeUserConfigScope() async {
    if (getIt.hasScope(userConfigScopeName)) {
      await getIt.popScope();
    }
  }

  Future<void> disposeLanguageScope() async {
    if (getIt.hasScope(languageScopeName)) {
      await getIt.popScope();
    }
  }

  bool hasUserConfigScope() => getIt.hasScope(userConfigScopeName);

  bool hasLanguageScope() => getIt.hasScope(languageScopeName);
}
