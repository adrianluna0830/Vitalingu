import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:fpdart/fpdart.dart';

@injectable
class SelectableTextService {
  final NativeLanguage _nativeLanguage;
  final SessionTargetLanguage _targetLanguage;
  final GeminiPromptService geminiPromptService;
  SelectableTextService(this._nativeLanguage, this._targetLanguage, this.geminiPromptService);

  Future<Either<Exception, String>> getDoubtResponse(String doubt, String selection, String selectionEnbracketedInFullText) async {
    String prompt = """
Answer the following question related to the given text.
You cannot use symbols like * or - in your answer. Only commas, periods, "" marks, and question marks are allowed.
Text where my Doubt is: "$selection"
Full context: "$selectionEnbracketedInFullText"
The question related to the text:
Question: "$doubt"
Provide a direct and conscice answer (if possible) in ${_nativeLanguage.language!.nativeLanguageName}, except is user request to use the target language.
""";
    return await geminiPromptService.generatePrompt(prompt);
  }

  Future<Either<Exception, String>> getTranslationResponse(String selection, String selectionEnbracketedInFullText) async {
    String prompt = """
Translate the following text from ${_targetLanguage.language!.nativeLanguageName} to ${_nativeLanguage.language!.nativeLanguageName}:
Specific text: "$selection"
Full context: "$selectionEnbracketedInFullText"
Provide a direct and conscice answer.

""";
    return await geminiPromptService.generatePrompt(prompt);
  }
}