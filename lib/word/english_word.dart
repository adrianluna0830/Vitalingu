import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitalingu/word/word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'english_word.g.dart';

@JsonSerializable()
class EnglishVerb {
  String simplePast =
      "Simple past form. Example: went, had, was, took, made. Use base form if regular (-ed rule applies).";
  String pastParticiple =
      "Past participle form. Example: gone, had, been, taken, made. Use base form if regular (-ed rule applies).";

  EnglishVerb();

  factory EnglishVerb.fromJson(Map<String, dynamic> json) =>
      _$EnglishVerbFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishVerbToJson(this);
}

@JsonSerializable()
class EnglishNoun {
  String pluralForm =
      "Exact plural form. Example: children, geese, mice, sheep, data. Use base form+s if regular. Use same word if uncountable.";

  EnglishNoun();

  factory EnglishNoun.fromJson(Map<String, dynamic> json) =>
      _$EnglishNounFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishNounToJson(this);
}

@JsonSerializable()
class EnglishAdjective {
  String comparative =
      "Comparative form. Example: better, worse, more beautiful. Use base form if regular (-er or more+base).";
  String superlative =
      "Superlative form. Example: best, worst, most beautiful. Use base form if regular (-est or most+base).";

  EnglishAdjective();

  factory EnglishAdjective.fromJson(Map<String, dynamic> json) =>
      _$EnglishAdjectiveFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishAdjectiveToJson(this);
}

@JsonSerializable()
class EnglishAdverb {
  String comparative =
      "Comparative form. Example: better, more quickly, faster. Use base form if regular (more+base).";
  String superlative =
      "Superlative form. Example: best, most quickly, fastest. Use base form if regular (most+base).";

  EnglishAdverb();

  factory EnglishAdverb.fromJson(Map<String, dynamic> json) =>
      _$EnglishAdverbFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishAdverbToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EnglishWordDefinition extends WordDefinition {
  EnglishNoun? nounInfo = EnglishNoun();
  EnglishVerb? verbInfo = EnglishVerb();
  EnglishAdjective? adjectiveInfo = EnglishAdjective();
  EnglishAdverb? adverbInfo = EnglishAdverb();

  EnglishWordDefinition();

  @override
  Widget getDefinitionWidget(String word) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Word: $word',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Meaning: $meaning',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Part of Speech: $partOfSpeech',
            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 12),
          Text(
            'Examples:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          ...examples.map((example) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('- Untranslated: ${example.untranslatedExample}'),
                    Text('- Translated: ${example.translatedExample}'),
                  ],
                ),
              )),
          const SizedBox(height: 16),
          if (nounInfo != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Noun Information:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Plural Form: ${nounInfo!.pluralForm}'),
              ],
            ),
          if (verbInfo != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Verb Information:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Simple Past: ${verbInfo!.simplePast}'),
                Text('Past Participle: ${verbInfo!.pastParticiple}'),
              ],
            ),
          if (adjectiveInfo != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Adjective Information:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Comparative: ${adjectiveInfo!.comparative}'),
                Text('Superlative: ${adjectiveInfo!.superlative}'),
              ],
            ),
          if (adverbInfo != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Adverb Information:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Comparative: ${adverbInfo!.comparative}'),
                Text('Superlative: ${adverbInfo!.superlative}'),
              ],
            ),
        ],
      ),
    );
  }

  factory EnglishWordDefinition.fromJson(Map<String, dynamic> json) =>
      _$EnglishWordDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishWordDefinitionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EnglishWord extends Word<EnglishWordDefinition> {
  EnglishWord();

  static String jsonWordPrompt() {
    EnglishWord sampleWord = EnglishWord();
    sampleWord.definitions = [EnglishWordDefinition()];
    return sampleWord.toJson().toString();
  }

  static Word fromJsonStatic(String json) {
    return EnglishWord.fromJson(
        Map<String, dynamic>.from(jsonDecode(json)));
  }

  factory EnglishWord.fromJson(Map<String, dynamic> json) =>
      _$EnglishWordFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishWordToJson(this);
}