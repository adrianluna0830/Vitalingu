import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/app_settings_persistent.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class AppSettingsDatabase {
  static const String _boxName = 'appSettings';
  static const String _settingsKey = 'app_settings';
  Box? _box;

  Future<void> _ensureBoxOpen() async {
    _box ??= await Hive.openBox(_boxName);
  }

  Future<void> saveAppSettings(AppSettings settings) async {
    try {
      await _ensureBoxOpen();
      final persistent = AppSettingsPersistent(
        geminiApiKey: settings.geminiApiKey,
        pixabayApiKey: settings.pixabayApiKey,
        microsoftSpeechApiKey: settings.microsoftSpeechApiKey,
        microsoftSpeechRegion: settings.microsoftSpeechRegion,
        nativeLanguageBcp47: settings.nativeLanguage.bcp47Code,
      );
      await _box!.put(_settingsKey, persistent);
    } catch (e) {
      rethrow;
    }
  }

  Future<AppSettings?> getAppSettings() async {
    try {
      await _ensureBoxOpen();
      final persistent = _box!.get(_settingsKey) as AppSettingsPersistent?;
      if (persistent == null) {
        return null;
      }
      final nativeLanguage = LanguageRegistry.getLanguageByCode(persistent.nativeLanguageBcp47);
      if (nativeLanguage == null) {
        throw Exception('Native language not found: ${persistent.nativeLanguageBcp47}');
      }
      return AppSettings(
        geminiApiKey: persistent.geminiApiKey,
        pixabayApiKey: persistent.pixabayApiKey,
        microsoftSpeechApiKey: persistent.microsoftSpeechApiKey,
        microsoftSpeechRegion: persistent.microsoftSpeechRegion,
        nativeLanguage: nativeLanguage,
      );
    } catch (e) {
      return null;
    }
  }

  Future<bool> hasAppSettings() async {
    await _ensureBoxOpen();
    return _box!.containsKey(_settingsKey);
  }

  Future<void> clearSettings() async {
    await _ensureBoxOpen();
    await _box!.delete(_settingsKey);
  }
}
