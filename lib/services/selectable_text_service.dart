import 'package:injectable/injectable.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';

@injectable
class SelectableTextService {
  final GeminiPromptService geminiPromptService;
  SelectableTextService(this.geminiPromptService);

  Future<String> getDoubtResponse(String doubt) async {
    final response = await geminiPromptService.generatePrompt(  doubt);
    return response;
  }

    Future<String> getTranslationResponse(String untranslatedText) async {
    final response = await geminiPromptService.generatePrompt(  untranslatedText);
    return response;
  }
}