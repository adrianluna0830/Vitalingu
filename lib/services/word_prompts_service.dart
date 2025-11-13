import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/word/word.dart';

class WordPromptsService {
  final Language nativeLanguage;
  final Language targetLanguage;
  final Word languageWord;
  final GeminiPromptService geminiPromptService;

  WordPromptsService({
    required this.nativeLanguage,
    required this.targetLanguage,
    required this.languageWord,
    required this.geminiPromptService,
  });

  Future<Word?> _getWordInDatabase(String word) async {
    return null;
  }

  Future<String> _getWordLema(String word) async {
    String prompt = "Return the word lema for the word '$word' in ${targetLanguage.nativeName} language.";
    return await geminiPromptService.generatePrompt(prompt);
  }

  String _getWordPrompt(String wordLema) {
    return languageWord.getWordPrompt(
      word: wordLema,
      nativeLanguage: nativeLanguage.nativeName,
      targetLanguage: targetLanguage.nativeName,
    );
  }

  Future<Word> getWord(String word) async {
    Word? wordInDatabase = await _getWordInDatabase(word);
    if (wordInDatabase != null) {
      return wordInDatabase;
    }

    String wordLema = await _getWordLema(word);
    String wordPrompt = _getWordPrompt(wordLema);

    String geminiPrompt = await geminiPromptService.generatePrompt(wordPrompt);
    return languageWord.fromJson(geminiPrompt);
  }
}