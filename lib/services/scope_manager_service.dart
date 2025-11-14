import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';
import 'package:vitalingu/services/word_prompts_service.dart';
import 'package:vitalingu/word/word.dart';

@singleton
class ScopeManagerService {
  static const String userConfigScopeName = 'user-config-session';
  static const String languageScopeName = 'language-session';

  Future<void> createUserConfigScope(
      String geminiApiKey, String pixabayApiKey) async {
    if (getIt.hasScope(userConfigScopeName)) {
      await getIt.popScopesTill(userConfigScopeName);
    }

    await getIt.pushNewScopeAsync(
      scopeName: userConfigScopeName,
      init: (getIt) async {
        getIt.registerSingleton<GeminiPromptService>(
            GeminiPromptService(geminiApiKey));
        getIt.registerSingleton<PixabayService>(PixabayService(pixabayApiKey));
      },
    );
  }

  Future<void> createLanguageScope(
      Language nativeLanguage,
      Language targetLanguage,
      LanguageSettings sessionSettings,
      Word languageWord) async {
    if (getIt.hasScope(languageScopeName)) {
      await getIt.popScopesTill(languageScopeName);
    }

    WordPromptsService wordPromptsService = WordPromptsService(
      nativeLanguage: nativeLanguage,
      targetLanguage: targetLanguage,
      languageWord: languageWord,
      geminiPromptService: getIt<GeminiPromptService>(),
    );

    LanguageSessionScopeSettings languageSessionScopeSettings =
        LanguageSessionScopeSettings(
      targetLanguage: targetLanguage,
      languageSettings: sessionSettings,
      wordPromptsService: wordPromptsService,
    );

    await getIt.pushNewScopeAsync(
      scopeName: languageScopeName,
      init: (getIt) async {
        getIt.registerSingleton<LanguageSessionScopeSettings>(
            languageSessionScopeSettings);
        getIt.registerSingleton<WordPromptsService>(wordPromptsService);
      },
    );
  }
}
