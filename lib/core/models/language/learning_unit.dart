import 'package:vitalingu/core/models/language/cefr_enum.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/language/unit_difficulty_enum.dart';

class LearningUnit {
  int unitLearningOrder;
  CEFR cefrLevel;
  Language language;
  String unitCode;
  UnitDifficulty difficulty;
  Map<Language, String> translations;

  LearningUnit({
    required this.unitCode,
    required this.unitLearningOrder,
    required this.cefrLevel,
    required this.language,
    this.difficulty = UnitDifficulty.medium,
    required this.translations,
  });

  Map<String, dynamic> toJson() {
    return {
      'unitCode': unitCode,
      'unitLearningOrder': unitLearningOrder,
      'cefrLevel': cefrLevel.name,
      'language': language.name,
      'difficulty': difficulty.name,
      'translations':
          translations.map((key, value) => MapEntry(key.name, value)),
    };
  }

  factory LearningUnit.fromJson(Map<String, dynamic> json) {
    var translationsMap = <Language, String>{};
    if (json['translations'] != null) {
      (json['translations'] as Map<String, dynamic>).forEach((key, value) {
        try {
          translationsMap[Language.values.byName(key)] = value as String;
        } catch (e) {
        }
      });
    }

    return LearningUnit(
      unitCode: json['unitCode'] ?? '',
      unitLearningOrder: json['unitLearningOrder'],
      cefrLevel: CEFR.values.byName(json['cefrLevel']),
      language: Language.values.byName(json['language']),
      difficulty: json['difficulty'] != null
          ? UnitDifficulty.values.byName(json['difficulty'])
          : UnitDifficulty.medium,
      translations: translationsMap,
    );
  }
}