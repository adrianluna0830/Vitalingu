// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'english_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnglishVerb _$EnglishVerbFromJson(Map<String, dynamic> json) => EnglishVerb()
  ..simplePast = json['simplePast'] as String
  ..pastParticiple = json['pastParticiple'] as String;

Map<String, dynamic> _$EnglishVerbToJson(EnglishVerb instance) =>
    <String, dynamic>{
      'simplePast': instance.simplePast,
      'pastParticiple': instance.pastParticiple,
    };

EnglishNoun _$EnglishNounFromJson(Map<String, dynamic> json) =>
    EnglishNoun()..pluralForm = json['pluralForm'] as String;

Map<String, dynamic> _$EnglishNounToJson(EnglishNoun instance) =>
    <String, dynamic>{
      'pluralForm': instance.pluralForm,
    };

EnglishAdjective _$EnglishAdjectiveFromJson(Map<String, dynamic> json) =>
    EnglishAdjective()
      ..comparative = json['comparative'] as String
      ..superlative = json['superlative'] as String;

Map<String, dynamic> _$EnglishAdjectiveToJson(EnglishAdjective instance) =>
    <String, dynamic>{
      'comparative': instance.comparative,
      'superlative': instance.superlative,
    };

EnglishAdverb _$EnglishAdverbFromJson(Map<String, dynamic> json) =>
    EnglishAdverb()
      ..comparative = json['comparative'] as String
      ..superlative = json['superlative'] as String;

Map<String, dynamic> _$EnglishAdverbToJson(EnglishAdverb instance) =>
    <String, dynamic>{
      'comparative': instance.comparative,
      'superlative': instance.superlative,
    };

EnglishWordDefinition _$EnglishWordDefinitionFromJson(
        Map<String, dynamic> json) =>
    EnglishWordDefinition()
      ..meaning = json['meaning'] as String
      ..partOfSpeech = json['partOfSpeech'] as String
      ..examples = (json['examples'] as List<dynamic>)
          .map((e) => WordExample.fromJson(e as Map<String, dynamic>))
          .toList()
      ..nounInfo = json['nounInfo'] == null
          ? null
          : EnglishNoun.fromJson(json['nounInfo'] as Map<String, dynamic>)
      ..verbInfo = json['verbInfo'] == null
          ? null
          : EnglishVerb.fromJson(json['verbInfo'] as Map<String, dynamic>)
      ..adjectiveInfo = json['adjectiveInfo'] == null
          ? null
          : EnglishAdjective.fromJson(
              json['adjectiveInfo'] as Map<String, dynamic>)
      ..adverbInfo = json['adverbInfo'] == null
          ? null
          : EnglishAdverb.fromJson(json['adverbInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$EnglishWordDefinitionToJson(
        EnglishWordDefinition instance) =>
    <String, dynamic>{
      'meaning': instance.meaning,
      'partOfSpeech': instance.partOfSpeech,
      'examples': instance.examples.map((e) => e.toJson()).toList(),
      'nounInfo': instance.nounInfo?.toJson(),
      'verbInfo': instance.verbInfo?.toJson(),
      'adjectiveInfo': instance.adjectiveInfo?.toJson(),
      'adverbInfo': instance.adverbInfo?.toJson(),
    };

EnglishWord _$EnglishWordFromJson(Map<String, dynamic> json) => EnglishWord()
  ..wordLema = json['wordLema'] as String
  ..definitions = (json['definitions'] as List<dynamic>)
      .map((e) => EnglishWordDefinition.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$EnglishWordToJson(EnglishWord instance) =>
    <String, dynamic>{
      'wordLema': instance.wordLema,
      'definitions': instance.definitions.map((e) => e.toJson()).toList(),
    };
