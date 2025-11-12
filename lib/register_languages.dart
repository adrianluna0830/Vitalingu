import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/word/english_word.dart';
import 'package:vitalingu/word/german_word.dart';

class LanguageRegistry {
  static final List<Language> _languages = [
    Language(
      bcp47Code: "en-US",
      nativeName: "English",
      languageWord: EnglishWord()
    ),
    Language(
      bcp47Code: "de-DE",
      nativeName: "German",
      languageWord: GermanWord()
    ),
  ];

  static List<Language> get languages => List.unmodifiable(_languages);
  
  static Language? getLanguageByCode(String bcp47Code) {
    try {
      return _languages.firstWhere((lang) => lang.bcp47Code == bcp47Code);
    } catch (e) {
      return null;
    }
  }
}
