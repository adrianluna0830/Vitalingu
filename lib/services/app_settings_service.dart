import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/models/app_settings.dart';

@singleton
class AppSettingsService {
  final AppSettingsDatabase _database;

  AppSettingsService(this._database);

  Future<AppSettings?> getSettings() async {
    return await _database.getAppSettings();
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _database.saveAppSettings(settings);
  }

  Future<bool> hasSettings() async {
    final settings = await getSettings();
    return settings != null;
  }
}
