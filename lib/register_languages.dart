import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/word/english_word.dart';
import 'package:vitalingu/word/german_word.dart';
import 'package:vitalingu/word/word.dart';

class LanguageRegistry {
  static final Map<Language, (Word, Word Function(String))> _languageWordMap = {
    const Language(
      bcp47Code: "en-US",
      nativeLanguageName: "English",
    ): (EnglishWord(), EnglishWord.fromJsonStatic),
    const Language(
      bcp47Code: "de-DE",
      nativeLanguageName: "Deutsch",
    ): (GermanWord(), GermanWord.fromJsonStatic),
  };

  static List<Language> get languages => List.unmodifiable(_languageWordMap.keys);
  
  static Language? getLanguageByCode(String bcp47Code) {
    try {
      return _languageWordMap.keys.firstWhere((lang) => lang.bcp47Code == bcp47Code);
    } catch (e) {
      return null;
    }
  }

  static Word? getWordForLanguage(Language language) {
    return _languageWordMap[language]?.$1;
  }

  static Word Function(String)? getFromJsonForLanguage(Language language) {
    return _languageWordMap[language]?.$2;
  }
}
