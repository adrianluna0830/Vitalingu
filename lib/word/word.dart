import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';

part 'word.mapper.dart';

@MappableClass()
class WordExample with WordExampleMappable {
  final String untranslatedExample;
  final String translatedExample;

  const WordExample({
    this.untranslatedExample = "A untranslated sentence example of the word in the target language",
    this.translatedExample = "The same untranslated sentence translated to the specified native language",
  });
}


abstract class WordDefinition {
  final String meaning;
  final String partOfSpeech;
  final List<WordExample> examples;

  const WordDefinition({
    this.examples = const [WordExample(), WordExample()],
    this.meaning = "Meaning of this word in this specific context",
    this.partOfSpeech = "Part of speech of the word in this specific context",
  });

  Widget getDefinitionWidget(String word);
}

abstract class Word {
  final String wordLema;
  final List<WordDefinition> definitions;

  Word({
    this.wordLema = "Base form of the word",
    required this.definitions,
  });

    String getWordPrompt({required String word, required String nativeLanguage, required String targetLanguage, int numberOfExamples = 3}) {
  String initialPrompt =
      "All 2nd level or 2ndindet fields can be entirely null. Only **wordLema**, **definitions**, and the fields within each definition (**meaning**, **partOfSpeech**, **examples**) are mandatory and cannot be null. Second-level objects (e.g., **nounInfo**, **verbInfo**, etc.) should be null or omitted if they don't apply to the specific part of speech.";

  String definitionInstruction =
      "\n\n**CRITICAL INSTRUCTION:** You MUST provide the maximum number of `EnglishWordDefinition` entries possible (in the `definitions` list) for the word **$word**. ONLY include definitions that are **fundamentally different** or **absolutely necessary to know** for full comprehension of the word's polysemy. Do not omit any crucial, distinct meaning. **You MUST ensure the `examples` list for EVERY definition contains EXACTLY $numberOfExamples entries. If you provide less than $numberOfExamples, your response will be considered incomplete and invalid.**";

  String languageInstructions =
      "\n\nThe following JSON is the expected format for the word **$word**. "
      "All fields, except the `untranslatedExample` within `examples`, should be in **$nativeLanguage**. "
      "The `untranslatedExample` must be in **$targetLanguage**.";

      return "$initialPrompt$definitionInstruction$languageInstructions\n${defaultToJson()}";
}

  List<Widget> getWordWidgets()
  {
    return definitions
        .map((definition) => definition.getDefinitionWidget(wordLema))
        .toList();
  }

  Word fromJson(String json);

  String defaultToJson();
}