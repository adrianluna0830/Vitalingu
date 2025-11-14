import 'package:vitalingu/interfaces/database_interface.dart';
import 'package:vitalingu/models/language_settings.dart';

class LanguageSettingsDatabase {
  final DatabaseInterface<String, LanguageSettings> _database;

  LanguageSettingsDatabase({required DatabaseInterface<String, LanguageSettings> database}) : _database = database;

  Future<LanguageSettings?> getSettings(String bcp47Code) async {
    final settings = await _database.getItem(bcp47Code);
    return settings;
  }

  Future<void> saveSettings(String bcp47Code, LanguageSettings settings) async {
    await _database.saveItem(settings, bcp47Code);
  }
}
