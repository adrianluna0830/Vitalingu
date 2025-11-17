import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';

@injectable
class SelectableTextService {
  final NativeLanguage _nativeLanguage;
  final SessionTargetLanguage _targetLanguage;
  final GeminiPromptService geminiPromptService;
  SelectableTextService(this._nativeLanguage, this._targetLanguage, this.geminiPromptService);

  Future<String> getDoubtResponse(String doubt,String selection, String selectionEnbracketedInFullText) async {
    String prompt = """
Answer the following question related to the given text.
You cannot use sybols like * or - in your answer. Only comas, periods, "" marks, and question marks are allowed.
Text where my Doubt is: "$selection"
Full context: "$selectionEnbracketedInFullText"
The question related to the text:
Question: "$doubt"
Provide a direct and conscice answer (if possible) in ${_nativeLanguage.language!.nativeLanguageName}, except is user request to use the target language.
""";
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }

    Future<String> getTranslationResponse(String selection, String selectionEnbracketedInFullText) async {
        String prompt = """
Translate the following text from ${_targetLanguage.language!.nativeLanguageName} to ${_nativeLanguage.language!.nativeLanguageName}:
Specific text: "$selection"
Full context: "$selectionEnbracketedInFullText"
Provide a direct and conscice answer.

""";
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }
}