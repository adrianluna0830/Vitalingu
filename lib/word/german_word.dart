import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitalingu/word/word.dart';
import 'package:json_annotation/json_annotation.dart';

part 'german_word.g.dart';

@JsonSerializable()
class GermanPreposition {
  String prepositionCase = "ACCUSATIVE, DATIVE, GENITIVE, TWO-WAY";
  List<String> commonContractions = [
    "List of common contractions with articles. Examples: ins, im, zum, am, beim, vom, ans, aufs. Use empty list if not applicable."
  ];

  GermanPreposition();

  factory GermanPreposition.fromJson(Map<String, dynamic> json) =>
      _$GermanPrepositionFromJson(json);

  Map<String, dynamic> toJson() => _$GermanPrepositionToJson(this);
}

@JsonSerializable()
class GermanVerb {
  String simplePast =
      "The simple past form (Präteritum). Example: ging, hatte, war. Use the infinitive form if not applicable.";
  String pastParticiple =
      "The past participle form (Partizip II). Must include ge- prefix if applicable. Example: gegangen, gehabt, gewesen. Use the infinitive form if not applicable.";
  String thirdPersonPresent =
      "The third person singular present form. Example: geht, hat, ist, gibt, fährt. Use the infinitive form if there's no vowel change.";
  bool isSeparable = false;
  bool isReflexive = false;
  String fixedPreposition =
      "The exact preposition that must be used with this verb. Example: an, auf, über, mit, für, von. Use empty string if no fixed preposition.";
  String prepositionCase =
      "ACCUSATIVE, DATIVE. Use empty string if not applicable.";
  String governedCase =
      "ACCUSATIVE, DATIVE, GENITIVE. Use empty string if not applicable.";

  GermanVerb();

  factory GermanVerb.fromJson(Map<String, dynamic> json) =>
      _$GermanVerbFromJson(json);

  Map<String, dynamic> toJson() => _$GermanVerbToJson(this);
}

@JsonSerializable()
class GermanNoun {
  String gender = "Choose only one: der, die, das";
  String pluralForm =
      "The exact plural form of the noun. Example: Kinder, Häuser, Frauen. If the noun has no plural form, use the same word as singular.";

  GermanNoun();

  factory GermanNoun.fromJson(Map<String, dynamic> json) =>
      _$GermanNounFromJson(json);

  Map<String, dynamic> toJson() => _$GermanNounToJson(this);
}

@JsonSerializable()
class GermanAdjective {
  String comparative =
      "The comparative form. Example: besser, schöner, größer. Use base+er for regular forms. Use the base form if not applicable.";
  String superlative =
      "The superlative form WITHOUT 'am'. Example: best, schönst, größt. Use base+st for regular forms. Use the base form if not applicable.";

  GermanAdjective();

  factory GermanAdjective.fromJson(Map<String, dynamic> json) =>
      _$GermanAdjectiveFromJson(json);

  Map<String, dynamic> toJson() => _$GermanAdjectiveToJson(this);
}

@JsonSerializable()
class GermanAdverb {
  String comparativeForm =
      "The comparative form. Example: lieber, eher, mehr. Use the base form if not applicable.";
  String superlativeForm =
      "The superlative form with 'am'. Example: am liebsten, am ehesten, am meisten. Use the base form if not applicable.";

  GermanAdverb();

  factory GermanAdverb.fromJson(Map<String, dynamic> json) =>
      _$GermanAdverbFromJson(json);

  Map<String, dynamic> toJson() => _$GermanAdverbToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GermanWordDefinition extends WordDefinition {
  GermanNoun? nounInfo = GermanNoun();
  GermanVerb? verbInfo = GermanVerb();
  GermanPreposition? prepositionInfo = GermanPreposition();
  GermanAdjective? adjectiveInfo = GermanAdjective();
  GermanAdverb? adverbInfo = GermanAdverb();

  GermanWordDefinition();

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
                Text('Gender: ${nounInfo!.gender}'),
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
                Text('3rd Person Present: ${verbInfo!.thirdPersonPresent}'),
                Text('Is Separable: ${verbInfo!.isSeparable}'),
                Text('Is Reflexive: ${verbInfo!.isReflexive}'),
                Text('Fixed Preposition: ${verbInfo!.fixedPreposition}'),
                Text('Preposition Case: ${verbInfo!.prepositionCase}'),
                Text('Governed Case: ${verbInfo!.governedCase}'),
              ],
            ),
          if (prepositionInfo != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'Preposition Information:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Case: ${prepositionInfo!.prepositionCase}'),
                Text(
                    'Common Contractions: ${prepositionInfo!.commonContractions.join(", ")}'),
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
                Text('Comparative: ${adverbInfo!.comparativeForm}'),
                Text('Superlative: ${adverbInfo!.superlativeForm}'),
              ],
            ),
        ],
      ),
    );
  }

  factory GermanWordDefinition.fromJson(Map<String, dynamic> json) =>
      _$GermanWordDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$GermanWordDefinitionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GermanWord extends Word<GermanWordDefinition> {
  GermanWord();
  static String jsonWordPrompt() {
    GermanWord sampleWord = GermanWord();
    sampleWord.definitions = [GermanWordDefinition()];
    return sampleWord.toJson().toString();
  }

  static Word fromJsonStatic(String json) {
    return GermanWord.fromJson(
        Map<String, dynamic>.from(jsonDecode(json)));
  }


  factory GermanWord.fromJson(Map<String, dynamic> json) =>
      _$GermanWordFromJson(json);

  Map<String, dynamic> toJson() => _$GermanWordToJson(this);
}