import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserSettings {
  late SupportedLanguagesBcp47 nativeLanguage;
  late SupportedLanguagesBcp47 targetLanguage;
  
  @FactoryMethod(preResolve: true)
  static Future<UserSettings> create() async {
    final settings = UserSettings();
    await settings.loadSettings();
    return settings;
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final nativeLangName = prefs.getString('nativeLanguage');
    final targetLangName = prefs.getString('targetLanguage');

    if (nativeLangName != null) {
      nativeLanguage = SupportedLanguagesBcp47.values.firstWhere(
        (e) => e.name == nativeLangName,
      );
    }

    if (targetLangName != null) {
      targetLanguage = SupportedLanguagesBcp47.values.firstWhere(
        (e) => e.name == targetLangName,
      );
    }
  }

  Future<void> saveNativeLanguage(SupportedLanguagesBcp47 language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nativeLanguage', language.name);
    nativeLanguage = language;
  }

  Future<void> saveTargetLanguage(SupportedLanguagesBcp47 language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('targetLanguage', language.name);
    targetLanguage = language;
  }
}
