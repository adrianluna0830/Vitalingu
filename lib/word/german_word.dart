import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:vitalingu/word/word.dart';

part 'german_word.mapper.dart';

@MappableClass()
class GermanPreposition with GermanPrepositionMappable {
  final String prepositionCase;
  final List<String> commonContractions;

  const GermanPreposition({
    this.prepositionCase = "ACCUSATIVE, DATIVE, GENITIVE, TWO-WAY",
    this.commonContractions = const ["List of common contractions with articles. Examples: ins, im, zum, am, beim, vom, ans, aufs. Use empty list if not applicable."]
  });
}

@MappableClass()
class GermanVerb with GermanVerbMappable {
  final String simplePast;
  final String pastParticiple;
  final String thirdPersonPresent;
  final bool isSeparable;
  final bool isReflexive;
  final String fixedPreposition;
  final String prepositionCase;
  final String governedCase;

  const GermanVerb({
    this.simplePast = "The simple past form (Präteritum). Example: ging, hatte, war. Use the infinitive form if not applicable.",
    this.pastParticiple = "The past participle form (Partizip II). Must include ge- prefix if applicable. Example: gegangen, gehabt, gewesen. Use the infinitive form if not applicable.",
    this.thirdPersonPresent = "The third person singular present form. Example: geht, hat, ist, gibt, fährt. Use the infinitive form if there's no vowel change.",
    this.isSeparable = false,
    this.isReflexive = false,
    this.fixedPreposition = "The exact preposition that must be used with this verb. Example: an, auf, über, mit, für, von. Use empty string if no fixed preposition.",
    this.prepositionCase = "ACCUSATIVE, DATIVE. Use empty string if not applicable.",
    this.governedCase = "ACCUSATIVE, DATIVE, GENITIVE. Use empty string if not applicable."
  });
}

@MappableClass()
class GermanNoun with GermanNounMappable {
  final String gender;
  final String pluralForm;

  const GermanNoun({
    this.gender = "Choose only one: der, die, das",
    this.pluralForm = "The exact plural form of the noun. Example: Kinder, Häuser, Frauen. If the noun has no plural form, use the same word as singular."
  });
}

@MappableClass()
class GermanAdjective with GermanAdjectiveMappable {
  final String comparative;
  final String superlative;

  const GermanAdjective({
    this.comparative = "The comparative form. Example: besser, schöner, größer. Use base+er for regular forms. Use the base form if not applicable.",
    this.superlative = "The superlative form WITHOUT 'am'. Example: best, schönst, größt. Use base+st for regular forms. Use the base form if not applicable."
  });
}

@MappableClass()
class GermanAdverb with GermanAdverbMappable {
  final String comparativeForm;
  final String superlativeForm;

  const GermanAdverb({
    this.comparativeForm = "The comparative form. Example: lieber, eher, mehr. Use the base form if not applicable.",
    this.superlativeForm = "The superlative form with 'am'. Example: am liebsten, am ehesten, am meisten. Use the base form if not applicable."
  });
}

@MappableClass()
class GermanWordDefinition extends WordDefinition with GermanWordDefinitionMappable {
  final GermanNoun? nounInfo;
  final GermanVerb? verbInfo;
  final GermanPreposition? prepositionInfo;
  final GermanAdjective? adjectiveInfo;
  final GermanAdverb? adverbInfo;

  const GermanWordDefinition({
    super.examples,
    super.meaning,
    super.partOfSpeech,
    this.nounInfo = const GermanNoun(),
    this.verbInfo = const GermanVerb(),
    this.prepositionInfo = const GermanPreposition(),
    this.adjectiveInfo = const GermanAdjective(),
    this.adverbInfo = const GermanAdverb()
  });
  
  @override
  Widget getDefinitionWidget(String word) {
    throw UnimplementedError();
  }
}

@MappableClass()
class GermanWord extends Word with GermanWordMappable {

  GermanWord._({
    super.wordLema,
    super.definitions = const [GermanWordDefinition(),GermanWordDefinition()],
  });

  static String jsonWordPrompt() => GermanWord._().toJson();
  static Word fromJsonStatic(String json) {
    return GermanWordMapper.fromJson(json);
  }
  
  @override
  // TODO: implement copyWith
  GermanWordCopyWith<GermanWord, GermanWord, GermanWord> get copyWith => throw UnimplementedError();
  
}