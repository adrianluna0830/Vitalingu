import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/word/word.dart';

class LanguageSessionSettings {
  final Language targetLanguage;
  final LanguageSettings languageSettings;
  final Word languageWord;

  const LanguageSessionSettings({
    required this.targetLanguage,
    required this.languageSettings,
    required this.languageWord,
  });
}
