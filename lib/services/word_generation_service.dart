import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/word/word.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordGenerationService {
  final NativeLanguage nativeLanguage;
  final SessionTargetLanguage targetLanguage;
  final SessionWord languageWord;
  final GeminiPromptService geminiPromptService;

  WordGenerationService({
    required this.nativeLanguage,
    required this.targetLanguage,
    required this.languageWord,
    required this.geminiPromptService,
  });

  Future<Word?> _getWordInDatabase(String word) async {
    return null;
  }

  Future<String> _getWordLema(String word) async {
    String prompt = "Return the word lema for the word '$word' in ${targetLanguage.language!.nativeLanguageName} language.";
    return await geminiPromptService.generatePrompt(prompt);
  }

  String _getWordPrompt(String wordLema) {
    String initialPrompt =
        "All 2nd level or 2ndindet fields can be entirely null. Only **wordLema**, **definitions**, and the fields within each definition (**meaning**, **partOfSpeech**, **examples**) are mandatory and cannot be null. Second-level objects (e.g., **nounInfo**, **verbInfo**, etc.) should be null or omitted if they don't apply to the specific part of speech.";

    String definitionInstruction =
        "\n\n**CRITICAL INSTRUCTION:** You MUST provide the maximum number of `EnglishWordDefinition` entries possible (in the `definitions` list) for the word **$wordLema**. ONLY include definitions that are **fundamentally different** or **absolutely necessary to know** for full comprehension of the word's polysemy. Do not omit any crucial, distinct meaning. **You MUST ensure the `examples` list for EVERY definition contains EXACTLY 3 entries. If you provide less than 3, your response will be considered incomplete and invalid.**";

    String languageInstructions =
        "\n\nThe following JSON is the expected format for the word **$wordLema**. "
        "All fields, except the `untranslatedExample` within `examples`, should be in **${nativeLanguage.language!.nativeLanguageName}**. "
        "The `untranslatedExample` must be in **${targetLanguage.language!.nativeLanguageName}**.";

    return "$initialPrompt$definitionInstruction$languageInstructions\n${languageWord.word!.defaultToJson()}";
  }

  Future<Word> getWord(String word) async {
    Word? wordInDatabase = await _getWordInDatabase(word);
    if (wordInDatabase != null) {
      return wordInDatabase;
    }

    String wordLema = await _getWordLema(word);
    String wordPrompt = _getWordPrompt(wordLema);

    String geminiPrompt = await geminiPromptService.generatePrompt(wordPrompt);
    return languageWord.fromJson!(geminiPrompt);
  }
}