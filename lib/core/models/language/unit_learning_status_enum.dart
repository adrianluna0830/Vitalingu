import 'package:vitalingu/core/models/language/language_enum.dart';

enum UnitLearningStatus {
  notStarted,
  learning,
  reviewing,
  mastered,
}

extension UnitLearningStatusX on UnitLearningStatus {
  static const _descriptions = {
    UnitLearningStatus.notStarted: {
      Language.English: 'Not Started',
      Language.Spanish: 'No iniciado',
    },
    UnitLearningStatus.learning: {
      Language.English: 'Learning',
      Language.Spanish: 'Aprendiendo',
    },
    UnitLearningStatus.reviewing: {
      Language.English: 'Reviewing',
      Language.Spanish: 'Repasando',
    },
    UnitLearningStatus.mastered: {
      Language.English: 'Mastered',
      Language.Spanish: 'Dominado',
    },
  };

  String description(Language language) =>
      _descriptions[this]![language]!;
}
