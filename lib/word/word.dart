import 'dart:convert';

class WordExample {
  final String untranslatedExample;
  final String translatedExample;

  WordExample({
    required this.untranslatedExample,
    required this.translatedExample,
  });
}

class WordDefinition {
  final String meaning;
  final String imagePromptDescription; 
  final String partOfSpeech;
  final List<WordExample> examples;
  String? imageUrl;

  WordDefinition({
    required this.imagePromptDescription, 
  
    required this.meaning,
    required this.partOfSpeech,
    required this.examples,
  });

   @override
  int get imageHashCode => Object.hash(
        meaning,
        imagePromptDescription,
        partOfSpeech,
      );
}

class Word {
  final String wordLema;
  final List<WordDefinition> definitions;

  Word({
    required this.wordLema,
    required this.definitions,
  });

static String wordJsonPrompt() {
    Word tempWord = Word(
      wordLema: "Base form of the word",
      definitions: [
        WordDefinition(
          imagePromptDescription: '''SIMPLE visual description in English (maximum 5-8 words) representing the meaning. Use BASIC and COMMON objects or scenes. Keep it MINIMALIST. Example: for "happiness" -> "children smiling", for "book" -> "open book", for "speed" -> "fast car moving"''',
          meaning: "Meaning of this word in this specific context",
          partOfSpeech: "Part of speech of the word in this specific context",
          examples: [
            WordExample(
              untranslatedExample: "A untranslated sentence example of the word in the target language",
              translatedExample: "The same untranslated sentence translated to the specified native language",
            )
          ],
        )
      ],
    );
    return jsonEncode(tempWord.toJson());
  }
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      wordLema: json['wordLema'] as String,
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => WordDefinition(
                meaning: e['meaning'] as String,
                imagePromptDescription: e['imagePromptDescription'] as String, 
                partOfSpeech: e['partOfSpeech'] as String,
                examples: (e['examples'] as List<dynamic>)
                    .map((ex) => WordExample(
                          untranslatedExample: ex['untranslatedExample'] as String,
                          translatedExample: ex['translatedExample'] as String,
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wordLema': wordLema,
      'definitions': definitions.map((definition) {
        return {
          'meaning': definition.meaning,
          'imagePromptDescription': definition.imagePromptDescription, 
          'partOfSpeech': definition.partOfSpeech,
          'examples': definition.examples.map((example) {
            return {
              'untranslatedExample': example.untranslatedExample,
              'translatedExample': example.translatedExample,
            };
          }).toList(),
        };
      }).toList(),
    };
  }
}
