import 'package:fpdart/fpdart.dart'; 
import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/word/word.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:string_extensions/string_extensions.dart';

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

  TaskOption<Word> _getWordInDatabase(String word) {
    return TaskOption.fromNullable(null);
  }

  Future<String> _getWordLema(WordGenerationInput word) async {
    final String prompt = """
Return only the base form (lemma) of the given word in the language: ${_targetLanguage.language!.nativeLanguageName}.
Expected output: only the base form of the word, no explanations or additional text.

Example:
Input: "conjugated form"
Output: "word lemma (only one word)"

Now transform:
Input: "${word.word}"
The full context of the word is: "${word.wordBracketedInfullText}"

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

  TaskEither<String, Word> getWord(WordGenerationInput word) {
    return TaskEither.Do(
      ($) async {
        final String wordLema = await $(
          TaskEither.tryCatch(
            () => _getWordLema(word),
            (error, stackTrace) => 'Error getting lemma: $error',
          ),
        );

        final String wordPrompt = _getWordPrompt(wordLema);

        final String geminiPrompt = await $(
          TaskEither.tryCatch(
            () => _geminiPromptService.generatePrompt(wordPrompt),
            (error, stackTrace) => 'Error calling Gemini: $error',
          ),
        );

        final String cleanedOutput = _cleanOutput(geminiPrompt);

        final Map<String, dynamic> jsonMap = await $(
          Either.tryCatch(
            () => jsonDecode(cleanedOutput) as Map<String, dynamic>,
            (error, stackTrace) =>
                'Error decoding JSON: $error. Raw output: $cleanedOutput',
          ).toTaskEither(),
        );

        final Word finalWord = await $(
          Either.tryCatch(
            () => Word.fromJson(jsonMap),
            (error, stackTrace) => 'Error parsing Word: $error. JSON: $jsonMap',
          ).toTaskEither(),
        );

        return finalWord;
      },
    );
  }
}

class WordGenerationInput {
  final String word;
  final String wordBracketedInfullText;
  WordGenerationInput._({
    required this.word,
    required this.wordBracketedInfullText,
  });

  static Either<String, WordGenerationInput> create({
    required String word,
    required String fullContext,
  }) {
    if (word.isEmpty) {
      return Left("WordGenerationInput word cannot be empty.");
    }
    if (word.countWords() > 1) {
      return Left("WordGenerationInput can only accept a single word.");
    }
    if (fullContext.isEmpty) {
      return Left("WordGenerationInput fullContext cannot be empty.");
    }
    final regex = RegExp(r'<.*?>');
    if (!regex.hasMatch(fullContext)) {
      return Left("WordGenerationInput fullContext must contain '<' and '>' characters in the correct order.");
    }

    return Right(WordGenerationInput._(
      word: word,
      wordBracketedInfullText: fullContext,
    ));
  }
}