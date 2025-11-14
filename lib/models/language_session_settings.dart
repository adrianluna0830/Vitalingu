import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_session_settings_persistent.dart';
import 'package:vitalingu/word/word.dart';

class LanguageSessionScopeSettings {
  final Language targetLanguage;
  final LanguageSessionSettings languageSettings;
  final Word languageWord;

  const LanguageSessionScopeSettings({
    required this.targetLanguage,
    required this.languageSettings,
    required this.languageWord,
  });
}
