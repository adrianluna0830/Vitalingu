import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/services/word_prompts_service.dart';

class LanguageSessionScopeSettings {
  final Language targetLanguage;
  final LanguageSettings languageSettings;
  final SelectableTextService wordPromptsService;

  const LanguageSessionScopeSettings({
    required this.targetLanguage,
    required this.languageSettings,
    required this.wordPromptsService,
  });
}
