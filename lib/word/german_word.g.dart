// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'german_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GermanPreposition _$GermanPrepositionFromJson(Map<String, dynamic> json) =>
    GermanPreposition()
      ..prepositionCase = json['prepositionCase'] as String
      ..commonContractions = (json['commonContractions'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

Map<String, dynamic> _$GermanPrepositionToJson(GermanPreposition instance) =>
    <String, dynamic>{
      'prepositionCase': instance.prepositionCase,
      'commonContractions': instance.commonContractions,
    };

GermanVerb _$GermanVerbFromJson(Map<String, dynamic> json) => GermanVerb()
  ..simplePast = json['simplePast'] as String
  ..pastParticiple = json['pastParticiple'] as String
  ..thirdPersonPresent = json['thirdPersonPresent'] as String
  ..isSeparable = json['isSeparable'] as bool
  ..isReflexive = json['isReflexive'] as bool
  ..fixedPreposition = json['fixedPreposition'] as String
  ..prepositionCase = json['prepositionCase'] as String
  ..governedCase = json['governedCase'] as String;

Map<String, dynamic> _$GermanVerbToJson(GermanVerb instance) =>
    <String, dynamic>{
      'simplePast': instance.simplePast,
      'pastParticiple': instance.pastParticiple,
      'thirdPersonPresent': instance.thirdPersonPresent,
      'isSeparable': instance.isSeparable,
      'isReflexive': instance.isReflexive,
      'fixedPreposition': instance.fixedPreposition,
      'prepositionCase': instance.prepositionCase,
      'governedCase': instance.governedCase,
    };

GermanNoun _$GermanNounFromJson(Map<String, dynamic> json) => GermanNoun()
  ..gender = json['gender'] as String
  ..pluralForm = json['pluralForm'] as String;

Map<String, dynamic> _$GermanNounToJson(GermanNoun instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'pluralForm': instance.pluralForm,
    };

GermanAdjective _$GermanAdjectiveFromJson(Map<String, dynamic> json) =>
    GermanAdjective()
      ..comparative = json['comparative'] as String
      ..superlative = json['superlative'] as String;

Map<String, dynamic> _$GermanAdjectiveToJson(GermanAdjective instance) =>
    <String, dynamic>{
      'comparative': instance.comparative,
      'superlative': instance.superlative,
    };

GermanAdverb _$GermanAdverbFromJson(Map<String, dynamic> json) => GermanAdverb()
  ..comparativeForm = json['comparativeForm'] as String
  ..superlativeForm = json['superlativeForm'] as String;

Map<String, dynamic> _$GermanAdverbToJson(GermanAdverb instance) =>
    <String, dynamic>{
      'comparativeForm': instance.comparativeForm,
      'superlativeForm': instance.superlativeForm,
    };

GermanWordDefinition _$GermanWordDefinitionFromJson(
        Map<String, dynamic> json) =>
    GermanWordDefinition()
      ..meaning = json['meaning'] as String
      ..partOfSpeech = json['partOfSpeech'] as String
      ..examples = (json['examples'] as List<dynamic>)
          .map((e) => WordExample.fromJson(e as Map<String, dynamic>))
          .toList()
      ..nounInfo = json['nounInfo'] == null
          ? null
          : GermanNoun.fromJson(json['nounInfo'] as Map<String, dynamic>)
      ..verbInfo = json['verbInfo'] == null
          ? null
          : GermanVerb.fromJson(json['verbInfo'] as Map<String, dynamic>)
      ..prepositionInfo = json['prepositionInfo'] == null
          ? null
          : GermanPreposition.fromJson(
              json['prepositionInfo'] as Map<String, dynamic>)
      ..adjectiveInfo = json['adjectiveInfo'] == null
          ? null
          : GermanAdjective.fromJson(
              json['adjectiveInfo'] as Map<String, dynamic>)
      ..adverbInfo = json['adverbInfo'] == null
          ? null
          : GermanAdverb.fromJson(json['adverbInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$GermanWordDefinitionToJson(
        GermanWordDefinition instance) =>
    <String, dynamic>{
      'meaning': instance.meaning,
      'partOfSpeech': instance.partOfSpeech,
      'examples': instance.examples.map((e) => e.toJson()).toList(),
      'nounInfo': instance.nounInfo?.toJson(),
      'verbInfo': instance.verbInfo?.toJson(),
      'prepositionInfo': instance.prepositionInfo?.toJson(),
      'adjectiveInfo': instance.adjectiveInfo?.toJson(),
      'adverbInfo': instance.adverbInfo?.toJson(),
    };

GermanWord _$GermanWordFromJson(Map<String, dynamic> json) => GermanWord()
  ..wordLema = json['wordLema'] as String
  ..definitions = (json['definitions'] as List<dynamic>)
      .map((e) => GermanWordDefinition.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GermanWordToJson(GermanWord instance) =>
    <String, dynamic>{
      'wordLema': instance.wordLema,
      'definitions': instance.definitions.map((e) => e.toJson()).toList(),
    };
