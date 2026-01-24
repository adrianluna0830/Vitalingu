import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_difficulty_enum.dart';

class GrammarTopic {
  int topicLearningOrder;
  CEFR cefrLevel;
  Language language;
  String topicCode;
  TopicDifficulty difficulty;
  Map<Language, String> translations;

  GrammarTopic({
    required this.topicCode,
    required this.topicLearningOrder,
    required this.cefrLevel,
    required this.language,
    this.difficulty = TopicDifficulty.medium,
    required this.translations,
  });

  Map<String, dynamic> toJson() {
    return {
      'topicCode': topicCode,
      'topicLearningOrder': topicLearningOrder,
      'cefrLevel': cefrLevel.name,
      'language': language.name,
      'difficulty': difficulty.name,
      'translations':
          translations.map((key, value) => MapEntry(key.name, value)),
    };
  }

  factory GrammarTopic.fromJson(Map<String, dynamic> json) {
    var translationsMap = <Language, String>{};
    if (json['translations'] != null) {
      (json['translations'] as Map<String, dynamic>).forEach((key, value) {
        try {
          translationsMap[Language.values.byName(key)] = value as String;
        } catch (e) {
        }
      });
    }

    return GrammarTopic(
      topicCode: json['topicCode'] ?? '',
      topicLearningOrder: json['topicLearningOrder'],
      cefrLevel: CEFR.values.byName(json['cefrLevel']),
      language: Language.values.byName(json['language']),
      difficulty: json['difficulty'] != null
          ? TopicDifficulty.values.byName(json['difficulty'])
          : TopicDifficulty.medium,
      translations: translationsMap,
    );
  }
}