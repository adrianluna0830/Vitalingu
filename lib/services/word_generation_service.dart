import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/word/word.dart';
import 'package:injectable/injectable.dart';

@injectable
class WordGenerationService {
  final NativeLanguage _nativeLanguage;
  final SessionTargetLanguage _targetLanguage;
  final SessionWord _languageWord;
  final GeminiPromptService _geminiPromptService;

  WordGenerationService({
    required NativeLanguage nativeLanguage,
    required SessionTargetLanguage targetLanguage,
    required SessionWord languageWord,
    required GeminiPromptService geminiPromptService,
  }) : _geminiPromptService = geminiPromptService, _languageWord = languageWord, _targetLanguage = targetLanguage, _nativeLanguage = nativeLanguage;

  Future<Word?> _getWordInDatabase(String word) async {
    return null;
  }

Future<String> _getWordLema(String word) async {
  final String prompt = """
Return only the base form (lemma) of the given word in the language: ${_targetLanguage.language!.nativeLanguageName}.
Expected output: only the base form of the word, no explanations or additional text.

Example:
Input: "conjugated form"
Output: "word lemma (only one word)"

Now transform:
Input: "$word"
Do not add anything before or after the word lemma.
""";

  final String raw = await _geminiPromptService.generatePrompt(prompt);
  return raw.trim();
}

/// Cleans the raw output from the GeminiPromptService to ensure valid JSON.
String _cleanOutput(String rawOutput) {
  // Trim whitespace and remove unexpected characters
  String cleanedOutput = rawOutput.trim();

  // Ensure the output starts and ends with valid JSON brackets
  if (!cleanedOutput.startsWith('{')) {
    int startIndex = cleanedOutput.indexOf('{');
    if (startIndex != -1) {
      cleanedOutput = cleanedOutput.substring(startIndex);
    }
  }
  if (!cleanedOutput.endsWith('}')) {
    int endIndex = cleanedOutput.lastIndexOf('}');
    if (endIndex != -1) {
      cleanedOutput = cleanedOutput.substring(0, endIndex + 1);
    }
  }

  return cleanedOutput;
}

  String _getWordPrompt(String wordLema) {
    String initialPrompt =
        "All 2nd level or 2ndindet fields can be entirely null. Only **wordLema**, **definitions**, and the fields within each definition (**meaning**, **partOfSpeech**, **examples**) are mandatory and cannot be null. Second-level objects (e.g., **nounInfo**, **verbInfo**, etc.) should be null or omitted if they don't apply to the specific part of speech.";

    String definitionInstruction =
        "\n\n**CRITICAL INSTRUCTION:** You MUST provide the maximum number of `EnglishWordDefinition` entries possible (in the `definitions` list) for the word **$wordLema**. ONLY include definitions that are **fundamentally different** or **absolutely necessary to know** for full comprehension of the word's polysemy. Do not omit any crucial, distinct meaning. **You MUST ensure the `examples` list for EVERY definition contains EXACTLY 3 entries. If you provide less than 3, your response will be considered incomplete and invalid.**";

    String languageInstructions =
        "\n\nThe following JSON is the expected format for the word **$wordLema**. "
        "All fields, except the `untranslatedExample` within `examples`, should be in **${_nativeLanguage.language!.nativeLanguageName}**. "
        "The `untranslatedExample` must be in **${_targetLanguage.language!.nativeLanguageName}**.";

    return "$initialPrompt$definitionInstruction$languageInstructions\n${_languageWord.wordJsonPrompt}";
  }

  Future<Word> getWord(String word) async {
    // Word? wordInDatabase = await _getWordInDatabase(word);
    // if (wordInDatabase != null) {
    //   return wordInDatabase;
    // }

    String wordLema = await _getWordLema(word);
    String wordPrompt = _getWordPrompt(wordLema);

    String geminiPrompt = await _geminiPromptService.generatePrompt(wordPrompt);
    print(geminiPrompt);

    // Clean the output before parsing
    String cleanedOutput = _cleanOutput(geminiPrompt);

    return _languageWord.fromJson!(cleanedOutput);
  }
}