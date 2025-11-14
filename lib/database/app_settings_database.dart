import 'package:vitalingu/interfaces/database_interface.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/register_languages.dart';

class AppSettingsDatabase {
  final DatabaseInterface<String, AppSettings> _database;
  final String _settingsKey = 'app_settings';
  
  AppSettingsDatabase({required DatabaseInterface<String, AppSettings> database}) : _database = database;

  Future<AppSettings?> getAppSettings() async {
    final settings = await _database.getItem(_settingsKey);
    if (settings == null) return null;

    final nativeLanguage = LanguageRegistry.getLanguageByCode( settings.nativeLanguage.bcp47Code);
    if (nativeLanguage == null) return null;

    return AppSettings(
      geminiApiKey: settings.geminiApiKey,
      pixabayApiKey: settings.pixabayApiKey,
      microsoftSpeechApiKey: settings.microsoftSpeechApiKey,
      microsoftSpeechRegion: settings.microsoftSpeechRegion,
      nativeLanguage: nativeLanguage,
    );
  }

  Future<void> saveAppSettings(AppSettings settings) async {
    final persistent = AppSettings(
      geminiApiKey: settings.geminiApiKey,
      pixabayApiKey: settings.pixabayApiKey,
      microsoftSpeechApiKey: settings.microsoftSpeechApiKey,
      microsoftSpeechRegion: settings.microsoftSpeechRegion,
      nativeLanguage: settings.nativeLanguage,
    );
    await _database.saveItem(persistent, _settingsKey);
  }
}