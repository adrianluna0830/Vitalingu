import 'package:vitalingu/interfaces/database_interface.dart';

class AppSettingsDatabase {
  final DatabaseInterface<String, String> _database;

  AppSettingsDatabase({
    required DatabaseInterface<String, String> database,
  }) : _database = database;

  Future<void> saveGeminiApiKey(String apiKey) async {
    await _database.saveItem(apiKey, 'gemini_api_key');
  }

  Future<String> getGeminiApiKey() async {
    final value = await _database.getItem('gemini_api_key');
    return value ?? '';
  }

  Future<void> savePixabayApiKey(String apiKey) async {
    await _database.saveItem(apiKey, 'pixabay_api_key');
  }

  Future<String> getPixabayApiKey() async {
    final value = await _database.getItem('pixabay_api_key');
    return value ?? '';
  }

  Future<void> clearSettings() async {
    await _database.deleteItem('gemini_api_key');
    await _database.deleteItem('pixabay_api_key');
  }
}
