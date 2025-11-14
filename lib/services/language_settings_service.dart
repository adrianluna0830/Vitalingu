import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/language_session_settings_database.dart';
import 'package:vitalingu/models/language_settings.dart';

@singleton
class LanguageSettingsService {
  final LanguageSettingsDatabase _database;

  LanguageSettingsService(this._database);

  Future<LanguageSettings?> getSettings(String bcp47Code) async {
    return await _database.getSettings(bcp47Code);
  }

  Future<void> saveSettings(String bcp47Code, LanguageSettings settings) async {
    await _database.saveSettings(bcp47Code, settings);
  }

  Future<LanguageSettings> getOrCreateLanguageSettings(String bcp47Code) async {
    var sessionSettings = await getSettings(bcp47Code);

    if (sessionSettings == null) {
      sessionSettings = _createDefaultSettings();
      await saveSettings(bcp47Code, sessionSettings);
    }

    return sessionSettings;
  }

  LanguageSettings _createDefaultSettings() {
    return LanguageSettings(examplesTranslatedSpeechEnabled: false, imagesEnabled: false, examplesUntranslatedSpeechEnabled: false, dynamicGenerativeFrontcards: false, numberOfExamples: 0, maleVoiceCode: '', femaleVoiceCode: ''
      
    );
  }
}
