import 'package:vitalingu/language/language.dart';

class LanguageRegistry {
  static final List<Language>_languagePromptMap = [
    const Language(
      bcp47Code: "en-US",
      nativeLanguageName: "English",
    ),
    const Language(
      bcp47Code: "de-DE",
      nativeLanguageName: "Deutsch",
    ),
    const Language(
      bcp47Code: "es-MX",
      nativeLanguageName: "Español",
    ),
  ];

  static List<Language> get languages => List.unmodifiable(_languagePromptMap);
  
  static Language? getLanguageByCode(String bcp47Code) {
    try {
      return _languagePromptMap.firstWhere((lang) => lang.bcp47Code == bcp47Code);
    } catch (e) {
      return null;
    }
  }


}
