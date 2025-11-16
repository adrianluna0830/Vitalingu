import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/word/word.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

@injectable
class WordGenerationService {
  final NativeLanguage _nativeLanguage;
  final SessionTargetLanguage _targetLanguage;
  final GeminiPromptService _geminiPromptService;

  WordGenerationService({
    required NativeLanguage nativeLanguage,
    required SessionTargetLanguage targetLanguage,
    required GeminiPromptService geminiPromptService,
  })  : _geminiPromptService = geminiPromptService,
        _targetLanguage = targetLanguage,
        _nativeLanguage = nativeLanguage;

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

  String _cleanOutput(String rawOutput) {
    String cleanedOutput = rawOutput.trim();

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
    final int examplesCount = _targetLanguage.languageSettings?.numberOfExamples ?? 3;

    return """
Generate a JSON object for the word "$wordLema" in the following format:
${Word.wordJsonPrompt()}

- The `wordLema` must be the base form of the word.
- Include exactly $examplesCount examples for each definition.
- All fields except `untranslatedExample` must be in ${_nativeLanguage.language!.nativeLanguageName}.
- The `untranslatedExample` must be in ${_targetLanguage.language!.nativeLanguageName}.
""";
  }

  Future<Word> getWord(String word) async {
    String wordLema = await _getWordLema(word);
    String wordPrompt = _getWordPrompt(wordLema);

    String geminiPrompt = await _geminiPromptService.generatePrompt(wordPrompt);
    print(geminiPrompt);

    String cleanedOutput = _cleanOutput(geminiPrompt);

    final Map<String, dynamic> jsonMap = jsonDecode(cleanedOutput);
    return Word.fromJson(jsonMap);
  }
}