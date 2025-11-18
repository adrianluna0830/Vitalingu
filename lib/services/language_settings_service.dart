import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/database_interface.dart';
import 'package:vitalingu/models/language_settings.dart';

@singleton
class LanguageSettingsService {
  final DatabaseInterface<LanguageSettings> _database;

  LanguageSettingsService(this._database);

  Future<LanguageSettings?> getSettings(String bcp47Code) async {
    return await _database.get(bcp47Code);
  }

  Future<void> saveSettings(String bcp47Code, LanguageSettings settings) async {
    await _database.save(bcp47Code, settings);
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
    return const LanguageSettings(
      examplesTranslatedSpeechEnabled: false,
      imagesEnabled: false,
      examplesUntranslatedSpeechEnabled: false,
      dynamicGenerativeFrontcards: false,
      numberOfExamples: 3,
      maleVoiceCode: null,
      femaleVoiceCode: null,
    );
  }
}
