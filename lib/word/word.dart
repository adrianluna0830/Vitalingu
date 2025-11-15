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

  List<Widget> getWordWidgets()
  {
    return definitions
        .map((definition) => definition.getDefinitionWidget(wordLema))
        .toList();
  }

  String defaultToJson();
}