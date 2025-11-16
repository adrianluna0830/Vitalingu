// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spanish_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpanishWordDefinition _$SpanishWordDefinitionFromJson(
        Map<String, dynamic> json) =>
    SpanishWordDefinition()
      ..meaning = json['meaning'] as String
      ..partOfSpeech = json['partOfSpeech'] as String
      ..examples = (json['examples'] as List<dynamic>)
          .map((e) => WordExample.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SpanishWordDefinitionToJson(
        SpanishWordDefinition instance) =>
    <String, dynamic>{
      'meaning': instance.meaning,
      'partOfSpeech': instance.partOfSpeech,
      'examples': instance.examples,
    };

SpanishWord _$SpanishWordFromJson(Map<String, dynamic> json) => SpanishWord()
  ..wordLema = json['wordLema'] as String
  ..definitions = (json['definitions'] as List<dynamic>)
      .map((e) => SpanishWordDefinition.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SpanishWordToJson(SpanishWord instance) =>
    <String, dynamic>{
      'wordLema': instance.wordLema,
      'definitions': instance.definitions,
    };
