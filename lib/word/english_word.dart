import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vitalingu/word/word.dart';
import 'dart:convert';

part 'english_word.mapper.dart';

@MappableClass()
class EnglishVerb with EnglishVerbMappable {
  final String simplePast;
  final String pastParticiple;

  const EnglishVerb({
    this.simplePast = "Simple past form. Example: went, had, was, took, made. Use base form if regular (-ed rule applies).",
    this.pastParticiple = "Past participle form. Example: gone, had, been, taken, made. Use base form if regular (-ed rule applies).",
  });

}

@MappableClass()
class EnglishNoun with EnglishNounMappable {
  final String pluralForm;

  const EnglishNoun({
    this.pluralForm = "Exact plural form. Example: children, geese, mice, sheep, data. Use base form+s if regular. Use same word if uncountable.",
  });
}

@MappableClass()
class EnglishAdjective with EnglishAdjectiveMappable {
  final String comparative;
  final String superlative;

  const EnglishAdjective({
    this.comparative = "Comparative form. Example: better, worse, more beautiful. Use base form if regular (-er or more+base).",
    this.superlative = "Superlative form. Example: best, worst, most beautiful. Use base form if regular (-est or most+base).",
  });
}

@MappableClass()
class EnglishAdverb with EnglishAdverbMappable {
  final String comparative;
  final String superlative;

  const EnglishAdverb({
    this.comparative = "Comparative form. Example: better, more quickly, faster. Use base form if regular (more+base).",
    this.superlative = "Superlative form. Example: best, most quickly, fastest. Use base form if regular (most+base).",
  });
}

@MappableClass()
class EnglishWordDefinition extends WordDefinition with EnglishWordDefinitionMappable {
  final EnglishNoun? nounInfo;
  final EnglishVerb? verbInfo;
  final EnglishAdjective? adjectiveInfo;
  final EnglishAdverb? adverbInfo;

  const EnglishWordDefinition({
    super.examples,
    super.meaning,
    super.partOfSpeech,
    this.nounInfo = const EnglishNoun(),
    this.verbInfo = const EnglishVerb(),
    this.adjectiveInfo = const EnglishAdjective(),
    this.adverbInfo = const EnglishAdverb(),
  });
  
  @override
  Widget getDefinitionWidget(String word) {
    // TODO: implement getDefinitionWidget
    throw UnimplementedError();
  }
}

@MappableClass()
class EnglishWord extends Word with EnglishWordMappable {
  @override
  final List<EnglishWordDefinition> definitions;

  EnglishWord({
    super.wordLema,
    this.definitions = const [EnglishWordDefinition()],
  }) : super(definitions: definitions);

  @override
  String defaultToJson() {
    return const JsonEncoder.withIndent('  ').convert(toJson());
  }

  @override
  Word fromJson(String json) {
    return EnglishWordMapper.fromJson(json);
  }

  @override
  Widget geTwordWidgets() {
    return Text("English Word Widget for $wordLema");
  }
}