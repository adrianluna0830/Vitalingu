import 'package:vitalingu/interfaces/database_interface.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/models/language_session_settings_persistent.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/register_languages.dart';

class LanguageSessionSettingsDatabase {
  final DatabaseInterface<String, LanguageSessionSettingsPersistent> _database;

  LanguageSessionSettingsDatabase({required DatabaseInterface<String, LanguageSessionSettingsPersistent> database}) : _database = database;

  Future<LanguageSessionSettings?> getSessionSettings(String bcp47Code) async {
    final persistent = await _database.getItem(bcp47Code);
    if (persistent == null) return null;

    final language = LanguageRegistry.getLanguageByCode(persistent.targetLanguageBcp47);
    if (language == null) return null;

    final languageWord = LanguageRegistry.getWordForLanguage(language);
    if (languageWord == null) return null;

    return LanguageSessionSettings(
      targetLanguage: language,
      languageSettings: LanguageSettings(
        imagesEnabled: persistent.imagesEnabled,
        examplesSpeechEnabled: persistent.examplesSpeechEnabled,
        dynamicGenerativeFrontcards: persistent.dynamicGenerativeFrontcards,
        numberOfExamples: persistent.numberOfExamples,
        maleVoiceCode: persistent.maleVoiceCode,
        femaleVoiceCode: persistent.femaleVoiceCode,
      ),
      languageWord: languageWord,
    );
  }

  Future<void> saveSessionSettings(String bcp47Code, LanguageSessionSettings settings) async {
    final persistent = LanguageSessionSettingsPersistent(
      targetLanguageBcp47: settings.targetLanguage.bcp47Code,
      imagesEnabled: settings.languageSettings.imagesEnabled,
      examplesSpeechEnabled: settings.languageSettings.examplesSpeechEnabled,
      dynamicGenerativeFrontcards: settings.languageSettings.dynamicGenerativeFrontcards,
      numberOfExamples: settings.languageSettings.numberOfExamples,
      maleVoiceCode: settings.languageSettings.maleVoiceCode,
      femaleVoiceCode: settings.languageSettings.femaleVoiceCode,
    );
    await _database.saveItem(persistent, bcp47Code);
  }
}
