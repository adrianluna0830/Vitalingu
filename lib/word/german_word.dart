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
    throw UnimplementedError();
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
  @override
  List<Widget> getWordWidgets() {
    return super.getWordWidgets();
  }

  factory GermanWord.fromJson(Map<String, dynamic> json) =>
      _$GermanWordFromJson(json);

  Map<String, dynamic> toJson() => _$GermanWordToJson(this);
}