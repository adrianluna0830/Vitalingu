import 'package:vitalingu/interfaces/database_interface.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/app_settings_persistent.dart';
import 'package:vitalingu/register_languages.dart';

class AppSettingsDatabase {
  final DatabaseInterface<String, AppSettingsPersistent> _database;
  final String _settingsKey = 'app_settings';
  
  AppSettingsDatabase({required DatabaseInterface<String, AppSettingsPersistent> database}) : _database = database;

  Future<AppSettings?> getAppSettings() async {
    final persistent = await _database.getItem(_settingsKey);
    if (persistent == null) return null;

    final nativeLanguage = LanguageRegistry.getLanguageByCode(persistent.nativeLanguageBcp47);
    if (nativeLanguage == null) return null;

    return AppSettings(
      geminiApiKey: persistent.geminiApiKey,
      pixabayApiKey: persistent.pixabayApiKey,
      microsoftSpeechApiKey: persistent.microsoftSpeechApiKey,
      microsoftSpeechRegion: persistent.microsoftSpeechRegion,
      nativeLanguage: nativeLanguage,
    );
  }

  Future<void> saveAppSettings(AppSettings settings) async {
    final persistent = AppSettingsPersistent(
      geminiApiKey: settings.geminiApiKey,
      pixabayApiKey: settings.pixabayApiKey,
      microsoftSpeechApiKey: settings.microsoftSpeechApiKey,
      microsoftSpeechRegion: settings.microsoftSpeechRegion,
      nativeLanguageBcp47: settings.nativeLanguage.bcp47Code,
    );
    await _database.saveItem(persistent, _settingsKey);
  }
}