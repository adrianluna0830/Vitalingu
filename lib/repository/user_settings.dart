import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';

@singleton
class UserSettings {
  static const _nativeLanguageKey = 'nativeLanguage';
  static const _targetLanguageKey = 'targetLanguage';

  Future<SupportedLanguagesBcp47> get nativeLanguage async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_nativeLanguageKey);
    if (value == null) return SupportedLanguagesBcp47.en_US;
    return SupportedLanguagesBcp47.values.firstWhere(
      (e) => e.name == value,
      orElse: () => SupportedLanguagesBcp47.en_US,
    );
  }

  Future<void> setNativeLanguage(SupportedLanguagesBcp47 value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nativeLanguageKey, value.name);
  }

  Future<SupportedLanguagesBcp47> get targetLanguage async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_targetLanguageKey);
    if (value == null) return SupportedLanguagesBcp47.es_MX;
    return SupportedLanguagesBcp47.values.firstWhere(
      (e) => e.name == value,
      orElse: () => SupportedLanguagesBcp47.es_MX,
    );
  }

  Future<void> setTargetLanguage(SupportedLanguagesBcp47 value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_targetLanguageKey, value.name);
  }
}
