import 'package:vitalingu/models/language/language_enum.dart';

enum TopicLearningStatus {
  notStarted,
  learning,
  reviewing,
  mastered,
}

extension TopicLearningStatusX on TopicLearningStatus {
  static const _descriptions = {
    TopicLearningStatus.notStarted: {
      Language.English: 'Not Started',
      Language.Spanish: 'No iniciado',
    },
    TopicLearningStatus.learning: {
      Language.English: 'Learning',
      Language.Spanish: 'Aprendiendo',
    },
    TopicLearningStatus.reviewing: {
      Language.English: 'Reviewing',
      Language.Spanish: 'Repasando',
    },
    TopicLearningStatus.mastered: {
      Language.English: 'Mastered',
      Language.Spanish: 'Dominado',
    },
  };

  String description(Language language) =>
      _descriptions[this]![language]!;
}
