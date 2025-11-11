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

const String universalPartsOfSpeech = "Noun, Verb, Adjective, Adverb, Pronoun, Preposition, Conjunction, Interjection, Article, Determiner, Numeral, Particle, Auxiliary Verb, Modal Verb, Phrase, Idiom";

@MappableClass()
class WordDefinition with WordDefinitionMappable {
  final String meaning;
  final String partOfSpeech;
  final List<WordExample> examples;

  const WordDefinition({
    this.examples = const [WordExample(), WordExample()],
    this.meaning = "Meaning of this word in this specific context",
    this.partOfSpeech = "Choose one of these: $universalPartsOfSpeech",
  });
}

abstract class Word {
  final String wordLema;
  final List<WordDefinition> definitions;

  Word({
    this.wordLema = "Base form of the word",
    this.definitions = const [WordDefinition(), WordDefinition()],
  });

  Widget wordWidget();

  Word fromJson(String json);

  String defaultToJson();
}