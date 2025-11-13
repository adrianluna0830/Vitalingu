import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/language_session_settings_database.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_session_settings.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/register_languages.dart';

@singleton
class LanguageSessionService {
  final LanguageSessionSettingsDatabase _database;

  LanguageSessionService(this._database);

  Future<LanguageSessionSettings?> getSessionSettings(String bcp47Code) async {
    return await _database.getSessionSettings(bcp47Code);
  }

  Future<void> saveSessionSettings(String bcp47Code, LanguageSessionSettings settings) async {
    await _database.saveSessionSettings(bcp47Code, settings);
  }

  Future<LanguageSessionSettings> getOrCreateSessionSettings(Language language) async {
    final bcp47Code = language.bcp47Code;
    var sessionSettings = await getSessionSettings(bcp47Code);

    if (sessionSettings == null) {
      sessionSettings = _createDefaultSessionSettings(language);
      await saveSessionSettings(bcp47Code, sessionSettings);
    }

    return sessionSettings;
  }

  LanguageSessionSettings _createDefaultSessionSettings(Language language) {
    final languageWord = LanguageRegistry.getWordForLanguage(language);

    if (languageWord == null) {
      throw Exception('No Word implementation found for language: ${language.nativeName}');
    }

    return LanguageSessionSettings(
      targetLanguage: language,
      languageSettings: LanguageSettings(
        maleVoiceCode: "defaultMaleVoiceCode",
        femaleVoiceCode: "defaultFemaleVoiceCode",
      ),
      languageWord: languageWord,
    );
  }
}
