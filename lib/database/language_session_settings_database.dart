import 'package:vitalingu/interfaces/database_interface.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/models/language_session_settings_persistent.dart';
import 'package:vitalingu/register_languages.dart';

class LanguageSessionSettingsDatabase {
  final DatabaseInterface<String, LanguageSessionSettings> _database;

  LanguageSessionSettingsDatabase({required DatabaseInterface<String, LanguageSessionSettings> database}) : _database = database;

  Future<LanguageSessionScopeSettings?> getSessionSettings(String bcp47Code) async {
    final persistent = await _database.getItem(bcp47Code);
    if (persistent == null) return null;

    final language = LanguageRegistry.getLanguageByCode(bcp47Code);
    if (language == null) return null;

    final languageWord = LanguageRegistry.getWordForLanguage(language);
    if (languageWord == null) return null;

    return LanguageSessionScopeSettings(
      targetLanguage: language,
      languageSettings: LanguageSessionSettings(
        imagesEnabled: persistent.imagesEnabled,
        dynamicGenerativeFrontcards: persistent.dynamicGenerativeFrontcards,
        numberOfExamples: persistent.numberOfExamples,
        maleVoiceCode: persistent.maleVoiceCode,
        femaleVoiceCode: persistent.femaleVoiceCode, examplesTranslatedSpeechEnabled: persistent.examplesTranslatedSpeechEnabled, examplesUntranslatedSpeechEnabled: persistent.examplesUntranslatedSpeechEnabled,
      ),
      languageWord: languageWord,
    );
  }

  Future<void> saveSessionSettings(String bcp47Code, LanguageSessionScopeSettings settings) async {
    final persistent = LanguageSessionSettings(
      examplesTranslatedSpeechEnabled: settings.languageSettings.examplesTranslatedSpeechEnabled,
      imagesEnabled: settings.languageSettings.imagesEnabled,
      examplesUntranslatedSpeechEnabled: settings.languageSettings.examplesUntranslatedSpeechEnabled,
      dynamicGenerativeFrontcards: settings.languageSettings.dynamicGenerativeFrontcards,
      numberOfExamples: settings.languageSettings.numberOfExamples,
      maleVoiceCode: settings.languageSettings.maleVoiceCode,
      femaleVoiceCode: settings.languageSettings.femaleVoiceCode,
    );
    await _database.saveItem(persistent, bcp47Code);
  }
}
