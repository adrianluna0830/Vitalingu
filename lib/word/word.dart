import 'dart:convert';
import 'package:flutter/widgets.dart';

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
  final String partOfSpeech;
  final List<WordExample> examples;

  WordDefinition({
    required this.meaning,
    required this.partOfSpeech,
    required this.examples,
  });

  Widget getDefinitionWidget(String word) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Word: $word',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Meaning: $meaning',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          'Part of Speech: $partOfSpeech',
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 8),
        Text(
          'Examples:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...examples.map((example) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Untranslated: ${example.untranslatedExample}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Translated: ${example.translatedExample}',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )),
      ],
    );
  }
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

  List<Widget> getWordWidgets() {
    return definitions
        .map((definition) => definition.getDefinitionWidget(wordLema))
        .toList();
  }
}
