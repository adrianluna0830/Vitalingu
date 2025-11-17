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
Text where my Doubt is: "$selection"
Full context: "$selectionEnbracketedInFullText"
The question related to the text:
Question: "$doubt"
Provide the answer in ${_nativeLanguage.language!.nativeLanguageName}.
""";
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }

    Future<String> getTranslationResponse(String selection, String selectionEnbracketedInFullText) async {
        String prompt = """
Translate the following text from ${_targetLanguage.language!.nativeLanguageName} to ${_nativeLanguage.language!.nativeLanguageName}:
Specific text: "$selection"
Full context: "$selectionEnbracketedInFullText"
Provide the answer in ${_nativeLanguage.language!.nativeLanguageName}.

""";
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }
}