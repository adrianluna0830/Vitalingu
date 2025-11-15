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
    throw UnimplementedError();
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

  @override
  List<Widget> getWordWidgets() {
    return super.getWordWidgets();
  }

  factory EnglishWord.fromJson(Map<String, dynamic> json) =>
      _$EnglishWordFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishWordToJson(this);
}